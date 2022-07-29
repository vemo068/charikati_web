class Forni {
  int? id;
  String name;
  String phone;
  
  
  Forni(
      {required this.name, required this.phone, this.id});

  //toJson method to convert the object to json format

  Map<String, dynamic> toJson() {
    return {
      'forniId': id,
      'name': name,
      'phone': phone,
      
      
    };
  }

  //fromJson method to convert the json to object format
  factory Forni.fromJson(Map<String, dynamic> json) {
    return Forni(
      id: json['clientId']?.toInt() ?? 0,
      name: json['name'],
      phone: json['phone'],
     
     
    );
  }
}
