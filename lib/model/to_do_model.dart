class ToDoDataModel{
  late final String id;
  final String title;
  final String desc;

  ToDoDataModel({required this.id, required this.title, required this.desc});
  
  factory ToDoDataModel.fromMap(map){
    return ToDoDataModel(
        id: map['id'],
        title: map['title'],
        desc: map['desc']
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'id' : id,
      'title' : title,
      'desc' : desc,
    };
  }

  //receive data from server
  static ToDoDataModel fromJson(Map<String, dynamic> json) => ToDoDataModel(
    id: json['id'],
    title: json['title'],
    desc: json['desc'],
  );

  //sending data to server
  Map<String,dynamic> toJson() =>{
    'id': id,
    'title': title,
    'desc': desc,
  };

}