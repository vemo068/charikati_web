

class Designation  {
 int? id;
  String name;
  
  Designation({required this.name, this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      
    };
  }
   factory Designation.fromMap(Map<String, dynamic> map) {
    return Designation(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
     
    );
  }
}
