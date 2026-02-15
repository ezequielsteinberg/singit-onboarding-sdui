---
description: 
globs: 
alwaysApply: false
---
---
globs: lib/infrastructure/services/**/*.dart
alwaysApply: false
---

# 🌐 Regla – Servicios de Infraestructura

Los servicios encapsulan el acceso a APIs, bases de datos u otras fuentes externas. Son usados exclusivamente por los managers implementados (`*ManagerImpl`).

---

## ✅ Convenciones

- Nombrar con sufijo `Service` (ej: `UserApiService`).
- Inyectar dependencias como `Dio`, `HttpClient`, o base de datos vía constructor.
- Cada método debe encargarse de una operación específica: `getUser`, `postOrder`, `fetchList`, etc.
- Retornar datos **crudos** o modelos (`Model`), nunca entidades de dominio.

---

## 🧩 Ejemplo

```dart
class UserApiService {
  final HttpClient _http;

  UserApiService(this._http);

  Future<Map<String, dynamic>> getUser(String id) async {
    final response = await _http.get('/users/$id');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Error fetching user');
    }
  }

  Future<void> updateUser(int id, Map<String, dynamic> data) async {
    final response = await _http.put('/users/$id', body: data);
    if (response.statusCode != 200) {
      throw Exception('Error updating user');
    }
  }
}
