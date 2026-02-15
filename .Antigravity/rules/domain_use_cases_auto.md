---
description: 
globs: 
alwaysApply: false
---
---
globs: lib/domain/use_cases/**/*.dart
alwaysApply: false
---

# 🧠 Regla – Casos de uso (UseCases)

Esta regla define cómo estructurar correctamente los casos de uso del dominio (`use_cases`) respetando Clean Architecture.

## ✅ Convenciones generales

- Cada caso de uso debe ser una clase que represente **una única acción de negocio**.
- El nombre debe describir claramente la acción: `GetUserProfileUseCase`, `DeleteOrderUseCase`, etc.
- Los métodos deben ser síncronos o `async`, dependiendo del proceso.

---

## ✅ Estructura recomendada

- Usar el método `call()` para que el caso de uso sea invocable como una función.
- Inyectar las dependencias por el constructor (normalmente un `Manager` o `Repository` del dominio).
- Solo orquestar lógica de negocio, sin lógica de presentación ni acceso a servicios.

```dart
class GetUserProfileUseCase {
  final UserManager _userManager;
  GetUserProfileUseCase(this._userManager);

  Future<User> call(String userId) {
    return _userManager.fetchUser(userId);
  }
}

⚠️ Evitar
❌ Colocar lógica de presentación o UI.

❌ Acceder a BuildContext, Widgets, Services o clases de infraestructura.

❌ Instanciar directamente implementaciones concretas (UserManagerImpl) → siempre usar interfaces (UserManager).

🧪 Ejemplo práctico
class DeleteUserUseCase {
  final UserManager _userManager;
  DeleteUserUseCase(this._userManager);

  Future<void> call(String userId) async {
    await _userManager.deleteUser(userId);
  }
}

Este patrón garantiza que la lógica de negocio esté aislada, testeable, y conforme a Clean Architecture. Los casos de uso serán utilizados desde los Notifiers o Providers en la capa de presentación.


