class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final List<String> donations;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.donations = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'donations': donations,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      donations: List<String>.from(json['donations'] ?? []),
    );
  }
}
