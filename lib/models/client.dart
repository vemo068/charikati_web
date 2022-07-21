class Client {
  int? id;
  String name;
  String phone;
  String email;
  Client(
      {required this.name, required this.phone, required this.email, this.id});



  //toJson method to convert the object to json format
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
  //fromJson method to convert the json to object format
  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id']?.toInt() ?? 0,
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}
