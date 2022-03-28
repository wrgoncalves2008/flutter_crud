import 'dart:convert';

class Usuario {
  late String? id;
  late String nome;
  late String email;
  late String avatarUrl;

  Usuario({
    this.id,
    required this.nome,
    required this.email,
    required this.avatarUrl,
  });

  Usuario copyWith({
    String? id,
    String? nome,
    String? email,
    String? avatarUrl,
  }) {
    return Usuario(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'nome': nome});
    result.addAll({'email': email});
    result.addAll({'avatarUrl': avatarUrl});

    return result;
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      avatarUrl: map['avatarUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(id: $id, nome: $nome, email: $email, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Usuario &&
        other.id == id &&
        other.nome == nome &&
        other.email == email &&
        other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nome.hashCode ^ email.hashCode ^ avatarUrl.hashCode;
  }
}
