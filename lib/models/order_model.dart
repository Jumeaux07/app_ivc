class OrderModel {
  String? numero;
  String? model;
  String? description;
  String? mesure;
  String? delais;
  int? id;
  int? total;
  int? reste;
  int? user_id;
  int? client_id;

  OrderModel({
    this.id, this.numero, this.model, this.description, this.mesure, this.delais, this.total,
    this.reste, this.user_id, this.client_id
  });

  factory OrderModel.fromJson(Map<String, dynamic>j)=> OrderModel(
      id: j['id'],
      numero: j['numero'],
      model: j['model'],
      description: j['description'],
      mesure: j['mesure'],
      delais: j['delais'],
      total: j['total'],
      reste: j['reste'],
      user_id: j['user_id'],
      client_id: j['client_id'],
    );
      Map<String, dynamic>toMap()=>{
      'id': id,
      'numero': numero,
      'model': model,
      'description': description,
      'mesure': mesure,
      'delais': delais,
      'total': total,
      'reste': reste,
      'user_id': user_id,
      'client_id': client_id,
    };


}