---
description: Regla para implementar Server-Driven UI (SDUI) en el proyecto
globs: 
  - lib/models/sdui/**/*.dart
  - lib/widgets/sdui/**/*.dart
  - lib/services/*Service.dart
  - lib/flows/**/ui/*Page.dart
alwaysApply: false
---

# 🎨 Regla – Server-Driven UI (SDUI)

Esta regla aplica a **todas las implementaciones de SDUI** en el proyecto RanchGPT. SDUI permite que el backend controle la estructura y contenido de las pantallas sin necesidad de actualizar la app.

---

## 📖 ¿Qué es SDUI?

**Server-Driven UI (SDUI)** es un patrón arquitectónico donde el backend define la estructura de la UI y el cliente la renderiza dinámicamente. Esto permite:

- ✅ Cambiar la UI sin actualizar la app
- ✅ A/B testing de diferentes layouts
- ✅ Personalización por usuario o contexto
- ✅ Reducir el tamaño de las actualizaciones de la app

---

## 🏗️ Arquitectura SDUI

### **Flujo de Datos**

```
Backend API → Service → ScreenSDUI → BaseComponent → SDUIComponent → AlchemistSDUI → Widget Flutter
```

### **Componentes Principales**

1. **ScreenSDUI**: Estructura completa de la pantalla (header, body, footer)
2. **BaseComponent**: Componente genérico recibido del backend
3. **SDUIComponent**: Componente tipado específico (sealed class)
4. **ComponentData**: Datos tipados para cada tipo de componente
5. **AlchemistSDUI**: Renderizador principal que mapea componentes a widgets
6. **Component Widget**: Widget Flutter específico que renderiza el componente

---

## 📁 Estructura de Archivos

```
lib/
├── models/sdui/
│   ├── screen_sdui.dart                    # Estructura de pantalla completa
│   ├── base_component.dart                 # Componente genérico del backend
│   ├── sdui_component.dart                 # Sealed class con todos los tipos
│   └── components/
│       ├── {component_name}_component_data.dart    # Datos tipados del componente
│       ├── {component_name}_component_data.freezed.dart
│       └── {component_name}_component_data.g.dart
├── widgets/sdui/
│   ├── alchemist_sdui.dart                # Renderizador principal
│   └── components/
│       └── {component_name}_component.dart # Widget Flutter del componente
└── services/
    └── {Feature}Service.dart               # Service que obtiene ScreenSDUI del backend
```

---

## 🔄 Flujo de Implementación

### **1. Backend envía JSON**

El backend envía una estructura `ScreenSDUI` con componentes:

```json
{
  "header": [
    {
      "type": "topbar",
      "data": {
        "title": "WeatherApp",
        "show_back_button": true
      },
      "horizontal_padding": 16,
      "vertical_padding": 16
    }
  ],
  "body": [
    {
      "type": "current_conditions",
      "data": {
        "title": "Condiciones Actuales",
        "location": "Casupá",
        "temperature": 26,
        "description": "Soleado",
        ...
      }
    }
  ],
  "footer": []
}
```

### **2. Service obtiene datos**

```dart
// lib/services/WeatherService.dart
@RestApi(baseUrl: 'https://api.example.com')
abstract class WeatherService {
  @GET('/weather/ui')
  Future<ScreenSDUI> getWeatherUI();
}
```

### **3. Pantalla consume el Service**

```dart
// lib/flows/weather/ui/WeatherPage.dart
final weatherService = ref.watch(weatherServiceProvider);
final screenData = await weatherService.getWeatherUI();
```

### **4. Conversión BaseComponent → SDUIComponent**

```dart
final components = screenData.body
    .map((baseComponent) => baseComponent.toSDUIComponent())
    .where((component) => component != null)
    .cast<SDUIComponent>()
    .toList();
```

### **5. Renderizado con AlchemistSDUI**

```dart
AlchemistSDUI(
  component: component,
  onTrackAction: (trackingData) {
    // Tracking si es necesario
  },
)
```

---

## 🚀 Cómo Agregar un Nuevo Componente SDUI

### **Paso 1: Crear ComponentData**

Crear el modelo de datos tipado en `lib/models/sdui/components/`:

```dart
// lib/models/sdui/components/subtitle_component_data.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtitle_component_data.freezed.dart';
part 'subtitle_component_data.g.dart';

@freezed
abstract class SubtitleComponentData with _$SubtitleComponentData {
  const factory SubtitleComponentData({
    required String text,
    @JsonKey(name: 'text_color') String? textColor,
    @Default(16) int fontSize,
  }) = _SubtitleComponentData;

  factory SubtitleComponentData.fromJson(Map<String, dynamic> json) =>
      _$SubtitleComponentDataFromJson(json);
}
```

**Ejecutar code generation:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### **Paso 2: Agregar a SDUIComponent**

Agregar el nuevo tipo en `lib/models/sdui/sdui_component.dart`:

```dart
// En la sealed class SDUIComponent
const factory SDUIComponent.subtitle({
  required SubtitleComponentData data,
  @JsonKey(name: 'horizontal_padding') @Default(0) int horizontalPadding,
  @JsonKey(name: 'vertical_padding') @Default(0) int verticalPadding,
  @JsonKey(name: 'data_tracking') String? dataTracking,
}) = SubtitleSDUIComponent;
```

**Importar el nuevo ComponentData:**
```dart
import 'package:ranchgpt/models/sdui/components/subtitle_component_data.dart';
```

**Ejecutar code generation nuevamente.**

### **Paso 3: Agregar Conversión en BaseComponentExtension**

En `lib/models/sdui/sdui_component.dart`, agregar caso en `toSDUIComponent()`:

```dart
extension BaseComponentExtension on BaseComponent {
  SDUIComponent? toSDUIComponent() {
    switch (type.toLowerCase()) {
      // ... casos existentes ...
      
      case 'subtitle':
        try {
          final subtitleData = SubtitleComponentData.fromJson(data);
          return SDUIComponent.subtitle(
            data: subtitleData,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
            dataTracking: dataTracking,
          );
        } catch (e) {
          return null;
        }
        
      default:
        return null;
    }
  }
}
```

### **Paso 4: Crear Widget del Componente**

Crear el widget en `lib/widgets/sdui/components/`:

```dart
// lib/widgets/sdui/components/subtitle_component.dart
import 'package:flutter/material.dart';
import 'package:ranchgpt/core/style/AppColor.dart';
import 'package:ranchgpt/core/style/Text.dart';
import 'package:ranchgpt/models/sdui/sdui_component.dart';

class SubtitleComponent extends StatelessWidget {
  final SubtitleSDUIComponent component;
  final VoidCallback? onTap;

  const SubtitleComponent({
    super.key,
    required this.component,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final data = component.data;
    
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: component.horizontalPadding.toDouble(),
        vertical: component.verticalPadding.toDouble(),
      ),
      child: BodyRegular(
        data.text,
        color: _parseColor(data.textColor),
      ),
    );
  }
  
  Color _parseColor(String? colorString) {
    // Lógica de parsing de color
    return AppColors.onSurface;
  }
}
```

### **Paso 5: Agregar a AlchemistSDUI**

En `lib/widgets/sdui/alchemist_sdui.dart`:

**1. Importar el nuevo componente:**
```dart
import 'package:ranchgpt/widgets/sdui/components/subtitle_component.dart';
```

**2. Agregar tracking (opcional):**
```dart
component.maybeWhen(
  // ... casos existentes ...
  subtitle: (data, horizontalPadding, verticalPadding, dataTracking) {
    if (dataTracking != null && onTrackAction != null) {
      onTrackAction!(dataTracking);
    }
  },
  orElse: () {},
);
```

**3. Agregar renderizado:**
```dart
return component.when(
  // ... casos existentes ...
  subtitle: (data, horizontalPadding, verticalPadding, dataTracking) {
    return SubtitleComponent(
      component: component as SubtitleSDUIComponent,
      onTap: onTap,
    );
  },
);
```

---

## ✅ Convenciones

### **Nomenclatura**

- **ComponentData**: `{Nombre}ComponentData` (ej: `SubtitleComponentData`)
- **SDUIComponent factory**: `{nombre}` en camelCase (ej: `subtitle`)
- **Widget**: `{Nombre}Component` (ej: `SubtitleComponent`)
- **Archivo ComponentData**: `{nombre}_component_data.dart`
- **Archivo Widget**: `{nombre}_component.dart`

### **Estructura de ComponentData**

- Usar `@freezed` para inmutabilidad
- Campos requeridos: `required`
- Campos opcionales: con valores por defecto o nullable
- Usar `@JsonKey` para mapear nombres del backend
- Ejecutar code generation después de cambios

### **Estructura de Widget**

- Extender `StatelessWidget` (o `BaseHookConsumer` si necesita providers)
- Recibir el componente completo como parámetro
- Acceder a datos mediante `component.data`
- Respetar `horizontalPadding` y `verticalPadding`
- Usar `AppColors`, `Spacing`, `Text` del proyecto
- Manejar errores de parsing gracefully

### **Manejo de Errores**

- En `toSDUIComponent()`: retornar `null` si falla el parsing
- En widgets: usar valores por defecto si el parsing falla
- Filtrar componentes `null` antes de renderizar
- No lanzar excepciones que rompan toda la pantalla

---

## 🎯 Ejemplo Completo: Componente "Button"

### **1. ComponentData**

```dart
// lib/models/sdui/components/button_component_data.dart
@freezed
abstract class ButtonComponentData with _$ButtonComponentData {
  const factory ButtonComponentData({
    required String text,
    @JsonKey(name: 'action_type') @Default('navigate') String actionType,
    @JsonKey(name: 'action_data') Map<String, dynamic>? actionData,
    @JsonKey(name: 'button_color') @Default('#133F58') String buttonColor,
  }) = _ButtonComponentData;

  factory ButtonComponentData.fromJson(Map<String, dynamic> json) =>
      _$ButtonComponentDataFromJson(json);
}
```

### **2. SDUIComponent**

```dart
// En sdui_component.dart
const factory SDUIComponent.button({
  required ButtonComponentData data,
  @JsonKey(name: 'horizontal_padding') @Default(0) int horizontalPadding,
  @JsonKey(name: 'vertical_padding') @Default(0) int verticalPadding,
  @JsonKey(name: 'data_tracking') String? dataTracking,
}) = ButtonSDUIComponent;
```

### **3. Conversión**

```dart
case 'button':
  try {
    final buttonData = ButtonComponentData.fromJson(data);
    return SDUIComponent.button(
      data: buttonData,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      dataTracking: dataTracking,
    );
  } catch (e) {
    return null;
  }
```

### **4. Widget**

```dart
// lib/widgets/sdui/components/button_component.dart
class ButtonComponent extends StatelessWidget {
  final ButtonSDUIComponent component;
  final VoidCallback? onTap;

  const ButtonComponent({
    super.key,
    required this.component,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final data = component.data;
    
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: component.horizontalPadding.toDouble(),
        vertical: component.verticalPadding.toDouble(),
      ),
      child: ElevatedButton(
        onPressed: onTap ?? () => _handleAction(context, data),
        style: ElevatedButton.styleFrom(
          backgroundColor: _parseColor(data.buttonColor),
        ),
        child: Text(data.text),
      ),
    );
  }
  
  void _handleAction(BuildContext context, ButtonComponentData data) {
    switch (data.actionType) {
      case 'navigate':
        // Lógica de navegación
        break;
      case 'callback':
        // Lógica de callback
        break;
    }
  }
  
  Color _parseColor(String colorString) {
    // Parsing de color
    return AppColors.primary;
  }
}
```

### **5. AlchemistSDUI**

```dart
// Agregar import
import 'package:ranchgpt/widgets/sdui/components/button_component.dart';

// Agregar tracking
button: (data, horizontalPadding, verticalPadding, dataTracking) {
  if (dataTracking != null && onTrackAction != null) {
    onTrackAction!(dataTracking);
  }
},

// Agregar renderizado
button: (data, horizontalPadding, verticalPadding, dataTracking) {
  return ButtonComponent(
    component: component as ButtonSDUIComponent,
    onTap: onTap,
  );
},
```

---

## 🧠 Buenas Prácticas

### **✅ Hacer**

- **Tipado fuerte**: Usar Freezed para ComponentData
- **Parsing seguro**: Manejar errores en conversión
- **Valores por defecto**: Proporcionar defaults sensibles
- **Separación de responsabilidades**: ComponentData solo datos, Widget solo UI
- **Reutilización**: Crear componentes genéricos cuando sea posible
- **Documentación**: Comentar tipos complejos o lógica no obvia

### **❌ Evitar**

- **Lógica de negocio en widgets**: Los widgets solo renderizan
- **Dependencias circulares**: No crear referencias circulares entre componentes
- **Hardcoding**: No hardcodear valores que vienen del backend
- **Ignorar padding**: Siempre respetar `horizontalPadding` y `verticalPadding`
- **Excepciones no manejadas**: Siempre manejar errores de parsing
- **Componentes muy específicos**: Preferir componentes genéricos y configurables

---

## 🔍 Debugging

### **Problemas Comunes**

1. **Componente no se renderiza**
   - Verificar que el `type` en el backend coincida con el case en `toSDUIComponent()`
   - Verificar que el parsing de `ComponentData` no falle
   - Verificar que el componente no sea `null` después de la conversión

2. **Error de parsing**
   - Verificar estructura del JSON del backend
   - Verificar que los campos requeridos estén presentes
   - Verificar tipos de datos (String vs int, etc.)

3. **Widget no aparece**
   - Verificar que se agregó el caso en `AlchemistSDUI.when()`
   - Verificar que el import del widget está presente
   - Verificar que el componente está en la sección correcta (header/body/footer)

### **Logging**

Agregar logs temporales para debugging:

```dart
case 'subtitle':
  try {
    final subtitleData = SubtitleComponentData.fromJson(data);
    print('✅ Subtitle parsed: ${subtitleData.text}');
    return SDUIComponent.subtitle(...);
  } catch (e) {
    print('❌ Subtitle parsing failed: $e');
    return null;
  }
```

---

## 📚 Referencias

- **Ejemplo completo**: `lib/flows/weather/ui/WeatherPage.dart`
- **Componentes existentes**: `lib/widgets/sdui/components/`
- **Modelos existentes**: `lib/models/sdui/components/`
- **Renderizador**: `lib/widgets/sdui/alchemist_sdui.dart`

---

## 🎓 Checklist para Nuevo Componente

- [ ] Crear `{nombre}_component_data.dart` con Freezed
- [ ] Ejecutar `build_runner` para generar código
- [ ] Agregar factory en `SDUIComponent`
- [ ] Agregar import del ComponentData en `sdui_component.dart`
- [ ] Ejecutar `build_runner` nuevamente
- [ ] Agregar caso en `toSDUIComponent()` con manejo de errores
- [ ] Crear widget `{nombre}_component.dart`
- [ ] Importar widget en `alchemist_sdui.dart`
- [ ] Agregar tracking en `maybeWhen()` (opcional)
- [ ] Agregar renderizado en `when()`
- [ ] Probar con datos reales del backend
- [ ] Manejar casos edge (valores null, parsing errors)

---

## 🚀 Extensibilidad

Para agregar nuevas features SDUI:

1. **Nueva pantalla**: Crear `{Feature}Page` que consuma un Service
2. **Nuevo Service**: Crear `{Feature}Service` con endpoint que retorne `ScreenSDUI`
3. **Nuevos componentes**: Seguir los pasos de "Cómo Agregar un Nuevo Componente"

El backend puede empezar a enviar nuevos componentes una vez implementados, sin necesidad de actualizar la app.
