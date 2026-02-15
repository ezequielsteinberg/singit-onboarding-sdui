---
description: 
globs: 
alwaysApply: false
---
---
globs: lib/infrastructure/models/**/*.dart
alwaysApply: false
---

# 🧾 Regla – Modelos de Datos (Models)

Los modelos representan estructuras de datos externas (ej: JSON de una API) que se usan en infraestructura. Sirven como puente entre las fuentes de datos y las entidades del dominio.

---

## ✅ Convenciones

- Declarar todos los campos como `final`.
- Crear constructor con `required` para todos los campos.
- Implementar:
  - `factory fromJson(Map<String, dynamic>)`
  - `Map<String, dynamic> toJson()`
  - `Entity toEntity()` para transformar a una entidad del dominio.
  - `fromEntity(Entity)` opcional, para ir desde dominio a infraestructura.

---

## 🧩 Ejemplo

```dart
class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  User toEntity() {
    return User(id: id, name: name, email: email);
  }

  static UserModel fromEntity(User user) {
    return UserModel(id: user.id, name: user.name, email: user.email);
  }
}
