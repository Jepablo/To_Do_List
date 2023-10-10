class RegisterModel{
  late final String? id;
  late final String? name;
  late final String? email;


  RegisterModel({this.id, this.name, this.email});

  factory RegisterModel.fromMap(map){
    return RegisterModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'email': email,

    };
  }
  //receive data from server
  static RegisterModel fromJson(Map<String, dynamic> json) => RegisterModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
  );
}