class Cliente {
  int? id;
  String name;
  String? phone;

  String nif;
  String rcn;
  String? address;
  String? nis;
  String? nai;
  String? description;
  Cliente(
      {required this.name,
      this.phone,
      this.id,
      required this.nif,
      required this.rcn,
      this.address,
      this.nis,
      this.description,
      this.nai});

  //toJson method to convert the object to json format

  Map<String, dynamic> toJson() {
    return {
      'clientId': id,
      'name': name,
      'phone': phone,
      'nif': nif,
      'rcn': rcn,
      'address': address,
      'nis': nis,
      'nai': nai,
      'description': description
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
      address: json['address'],
      nis: json['nis'],
      nai: json['nai'],
      description: json['description'],

    );
  }
}
