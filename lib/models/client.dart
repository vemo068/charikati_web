class Cliente {
  int? id;
  String name;
  String phone;
  
  String nif;
  String rcn;
  Cliente(
      {required this.name, required this.phone, this.id,required this.nif,required this.rcn});

  //toJson method to convert the object to json format

  Map<String, dynamic> toJson() {
    return {
      'clientId': id,
      'name': name,
      'phone': phone,
      
      'nif': nif,
      'rcn': rcn,
    };
  }

  //fromJson method to convert the json to object format
  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['clientId']?.toInt() ?? 0,
      name: json['name'],
      phone: json['phone'],
     
      nif: json['nif'],
      rcn: json['rcn'],
    );
  }
}
