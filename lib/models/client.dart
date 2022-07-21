class Client {
  int? id;
  String name;
  String phone;
  String email;
  Client(
      {required this.name, required this.phone, required this.email, this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ,
      phone: map['phone'] ,
      email: map['email'],
    );
  }
}
