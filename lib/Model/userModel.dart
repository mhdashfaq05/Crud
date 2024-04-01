class UserModel {
  String id;
  String name;
  String uid;
  UserModel({
    ///Constructer (to pass value)
    required this.id,
    required this.name,
    required this.uid
  });
  Map<String,dynamic> toMap(){
    /// add Map  model  to firebase
    return{
      "id":id,
      "name":name,
      "uid":uid
    };
  }
  factory UserModel.fromMap(Map<String,dynamic>map){
    ///factory- to get data form firebase (to create the index and update index in  firebase)
    ///User model to trns firebase from map
    return UserModel(
        id: map['id'].toString(),
        name: map['name'].toString(),
        uid: map['uid'].toString()

    );
  }
 UserModel copyWith({
    String? id,
    String? name,
    String? uid,
}){
    return UserModel(id: id?? this.id, name: name?? this.name, uid: uid?? this.uid);
 }
}
