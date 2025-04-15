class AppUser {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final DateTime registeredAt;

  AppUser({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.registeredAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'registeredAt': registeredAt.toIso8601String(),
    };
  }
}
