
class Usermodel {
   String name;

  final String email;
   String phone;
  final List<dynamic> coordinates;

  Usermodel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.coordinates});

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
        name: json['user']['name'] ?? '',
        email: json['user']['email'] ?? '',
        phone: json['user']['phone'] ?? '',
      coordinates: json['user']['location']['coordinates'] ?? '');
  }


  
}
