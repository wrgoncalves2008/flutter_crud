class Usuario {
  late String? id;
  late String nome;
  late String email;
  late String avatarUrl;

  Usuario(
      {this.id,
      required this.nome,
      required this.email,
      required this.avatarUrl});
}
