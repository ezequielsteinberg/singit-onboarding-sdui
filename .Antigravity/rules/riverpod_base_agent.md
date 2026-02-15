---
description: 
globs: 
alwaysApply: false
---
---
description: Aplicar esta regla cuando se cree o modifique un StateNotifier, Provider o lógica de estado con Riverpod.
globs:
alwaysApply: false
---

# 🌿 Regla – Uso de clases base con Riverpod

Este proyecto utiliza una clase base personalizada `BaseStateNotifier<S, A>` para gestionar el estado, las acciones y los side-effects de forma unificada.  
Todas las clases `Notifier` deben extender esta base y respetar su estructura.

---

## ✅ StateNotifiers

- Toda clase de flujo que maneje estado debe extender `BaseStateNotifier<State, Action>`.
- Debe implementar el método `reducer({required A action})`.
- Debe inicializar el estado desde el constructor `super(state: ..., ref: ref)`.

```dart
class HomeNotifier extends BaseStateNotifier<HomeState, HomeAction> {
  final GetProductsUseCase _getProductsUseCase;

  HomeNotifier(this._getProductsUseCase, super.ref)
      : super(state: const HomeState());

  @override
  void reducer({required HomeAction action}) {
    switch (action) {
      case HomeAction.load:
        _loadProducts();
        break;
    }
  }

  Future<void> _loadProducts() async {
    showLoading();
    await callService<List<Product>>(
      service: () => _getProductsUseCase(),
      onSuccess: (products) {
        state = state.copyWith(products: products);
        showContent();
      },
    );
  }
}

✅ Providers
Para exponer un notifier, usar BaseProvider<Notifier, State>().

final homeProvider = BaseProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(ref.watch(getProductsUseCaseProvider), ref),
);

✅ Métodos disponibles en la base
Todas las clases que extiendan BaseStateNotifier pueden usar:

callService<T>() → para ejecutar servicios de forma unificada con manejo de Either<HttpError, T>

showLoading() y showContent() → para manipular el estado visual usando contentStateNotifierProvider

ref → para acceder a otros providers si es necesario

⚠️ Evitar
❌ Usar StateNotifier<T> directamente.

❌ Lógica de estado sin pasar por reducer.

❌ Asignación directa de state sin respetar los pasos de callService, showLoading, showContent.

❌ No usar copyWith() para modificar partes del estado fuera del metodo reducer().
