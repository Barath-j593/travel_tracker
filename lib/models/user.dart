class User {
  final String id;
  final String email;
  final String phone;
  final bool isAdmin;
  final int ecoPoints;

  User({
    required this.id,
    required this.email,
    required this.phone,
    this.isAdmin = false,
    this.ecoPoints = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      isAdmin: json['isAdmin'] ?? false,
      ecoPoints: json['ecoPoints'] ?? 0,
    );
  }
}