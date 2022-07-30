class UserModel {
  int? id;
  String? nom;
  String? prenoms;
  String? phone;
  String? email;
  String? nomAtelier;

  UserModel({this.id, this.nom, this.prenoms, this.phone, this.email, this.nomAtelier});

  factory UserModel.fromJson(Map<String, dynamic> j){
    return UserModel(
      id: j['id'],
      nom: j['nom'],
      prenoms: j['prenoms'],
      phone: j['phone'],
      email: j['email'],
      nomAtelier: j['nomAtelier'],
    );
  }

  Map<String, dynamic> toMap()=>{
    'id':id,
    'nom':nom,
    'prenoms':prenoms,
    'phone':phone,
    'email':email,
    'nomAtelier':nomAtelier,
  };
}