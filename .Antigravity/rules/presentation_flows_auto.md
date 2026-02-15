---
description: 
globs: 
alwaysApply: false
---
---
globs: lib/presentation/flows/**/*.dart
alwaysApply: false
---

# 🖥️ Regla – Flujos de Presentación (Flows)

Esta regla guía la estructura completa de un flujo de UI. Cada flujo debe organizarse por feature e incluir pantalla, notifier, provider, state, action y widgets específicos.

---

## ✅ Organización por flujo

Cada carpeta dentro de `lib/presentation/flows/` debe contener:

- Una `Screen` que extienda `BaseStatefulWidget`
- El primer widget de la `Screen` debe ser `ContentStateWidget` ubicado en: lib/presentation/base/content_state/content_state_widget.dart
- Un `Notifier` que extienda `BaseStateNotifier<State, Action>`
- Un `Provider` con `BaseProvider<Notifier, State>`
- Archivo `state.dart` para el estado del flujo
- Archivo `action.dart` con la sealed class de acciones
- Widgets específicos y archivo barril (`widgets.dart`, etc.)

---

## ✅ Pantallas

Usar siempre `BaseStatefulWidget` como clase base. Esto garantiza suscripciones automáticas a navegación y alertas desde el notifier.

```dart
abstract class BaseStatefulWidget<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> with BaseScreen {
  Widget buildView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    subscribeAlert(ref: ref);
    subscribeNavigation(
      ref: ref,
      context: context,
    );
    return buildView(context);
  }
}

Ejemplo de pantalla
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStatefulWidget<LoginScreen> {
  @override
  Widget buildView(BuildContext context) {
    final state = ref.watch(loginProvider);
    return Column(
      children: [
        Text(state.email),
        // ...
      ],
    );
  }
}
---

### 🚦 Navegación

Cada flujo debe tener su propia configuración de rutas siguiendo este patrón:

```dart
class HomeRouter {
  static const String homeRouteName = 'Home';

  static GoRoute getRoute() {
    return GoRoute(
      name: homeRouteName,
      path: '/Home',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: HomeScreen(),
        name: homeRouteName,
      ),
      routes: [SettingsRouter.getRoute()], // Sub-rutas si aplica
    );
  }
}

📁 Ubicación del archivo:
lib/presentation/flows/{feature}/nav/{feature}_route.dart

## 🧠 Buenas prácticas de diseño

- **Abstraer siempre que sea posible**: mover bloques de UI a widgets privados o reutilizables.
- Es preferible tener **muchos widgets pequeños y limpios** que una `Screen` con código largo y difícil de mantener.
- Seguir el principio de **responsabilidad única** y mantener la legibilidad.

⚠️ Evitar
❌ Usar ConsumerWidget o HookConsumerWidget en flows → usar BaseStatefulWidget.

❌ Usar setState() en pantallas que ya usan Riverpod.
❌ Llamar a servicios directamente desde la pantalla.

