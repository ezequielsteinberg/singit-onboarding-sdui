---
description: 
globs: 
alwaysApply: true
---
---
globs:
alwaysApply: true
---

# 🧱 Regla Global – Clean Architecture

Esta regla define los principios fundamentales de Clean Architecture para todo el proyecto Flutter `singit-onboarding-sdui`. Se aplica **siempre**, sin importar el archivo, para asegurar consistencia y separación de capas.

## 🎯 Principios Generales

### 1. Separación por Capas

La aplicación está organizada en tres capas principales:

- **Presentación (`lib/presentation/`)**  
  Contiene widgets, flows, screens, notifiers y providers. No debe contener lógica de negocio ni acceder directamente a servicios ni modelos externos.

- **Dominio (`lib/domain/`)**  
  Contiene entidades, casos de uso (use cases) e interfaces de repositorios/data sources. Aquí vive la lógica de negocio pura, sin dependencias externas.

- **Infraestructura (`lib/infrastructure/`)**  
  Implementa los contratos definidos en dominio. Aquí se accede a APIs, base de datos, almacenamiento, etc.

> Cada capa solo puede depender de capas más internas.  
> ❌ Presentación → Infraestructura (prohibido)  
> ✅ Infraestructura → Dominio  
> ✅ Presentación → Dominio

---

### 2. Comunicación mediante interfaces

Las dependencias entre capas se deben hacer por **abstracciones** (interfaces en `domain`).  
Ejemplo:
- `UserManager` (interface en dominio)  
- `UserManagerImpl` (implementación en infraestructura)

---

### 3. No lógica cruzada

- ❌ Una pantalla (`Widget`) no debe hacer llamadas HTTP ni manejar datos directamente.
- ❌ Un `use case` no debe crear widgets ni conocer detalles visuales.
- ❌ Un `repository` no debe usar `BuildContext` ni `Riverpod`.

---

### 4. Uso obligatorio de clases base

- Los providers deben usar `BaseProvider`.
- Los notifiers deben extender `BaseStateNotifier`.
- Los estados deben seguir `BaseState` o clases definidas de forma centralizada.

---

### 5. Respetar estructura de carpetas

Cada archivo debe ir en la carpeta correspondiente:
- `entities/`, `use_cases/`, `repositories/`, `data_sources/` → dominio
- `models/`, `services/`, `repositories/`, `data_sources/` → infraestructura
- `flows/`, `widgets/`, `providers/`, `states/`, `actions/` → presentación

---

### 6. Consistencia de código

- Usar `relative imports` (`../`, `./`) en lugar de `package:...`.
- Aplicar archivos barril (`auth.dart`, `home.dart`, etc.) para organizar exports.
- Separar widgets pequeños en archivos propios para mayor legibilidad.

---

### 7. Estructura del estado (`State`)

Cada flujo debe tener su clase de estado definida de forma clara y predecible.

- Los estados deben ser **clases simples** con propiedades finales (o mutables si se justifica).
- Deben incluir un método `copyWith()` para permitir la actualización inmutable del estado.
- Las propiedades deben tener valores por defecto seguros, o ser opcionales (`?`).
- No deben contener lógica de negocio ni dependencias externas.

> Estos `State` son utilizados por los `BaseStateNotifier<State, Action>` y reflejan la UI.

---

#### 🧩 Ejemplo de estado correcto

```dart
import 'package:template/domain/entities/photo.dart';

class DetailState {
  final Photo? photo;
  final int like;
  final int dislike;

  DetailState({
    this.photo,
    this.like = 0,
    this.dislike = 0,
  });

  DetailState copyWith({
    Photo? photo,
    int? like,
    int? dislike,
  }) {
    return DetailState(
      photo: photo ?? this.photo,
      like: like ?? this.like,
      dislike: dislike ?? this.dislike,
    );
  }
}

---

### 8. Definición de Acciones (`Action`)

Cada flujo debe tener una clase de acciones (`Action`) que define los eventos que modifican el estado. Estas acciones son utilizadas dentro del `reducer()` del `BaseStateNotifier<State, Action>`.

#### ✅ Convenciones

- Definir una clase `sealed` con el sufijo `Action`, por ejemplo `HomeAction`, `LoginAction`, etc.
- Crear una clase por cada tipo de acción, con sus propiedades necesarias.
- El `reducer({required A action})` en el `Notifier` debe hacer `switch` sobre esas acciones y ejecutar la lógica correspondiente.

---

#### 🧩 Ejemplo

```dart
sealed class HomeAction {}

class LoadAction extends HomeAction {
  final List<Photo> photos;

  LoadAction({this.photos = const []});
}

Ejemplo de uso en el reducer del Notifier
@override
void reducer({required HomeAction action}) {
  switch (action) {
    case LoadAction():
      state = state.copyWith(photos: action.photos);
      break;
  }
}

## 🖼️ Uso de imágenes (Assets)
Todas las rutas de imágenes deben centralizarse en la clase `AppImages` dentro del archivo: lib/config/theme/app_images.dart


