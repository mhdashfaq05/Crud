///class are used define the blueprint for object
class addUserModel {
  String name;
  String email;
  String password;
  addUserModel(
      {
      ///Constructer (to pass value)
      required this.name,
      required this.email,
      required this.password});
  Map<String, dynamic> toMap() {
    /// add Map  model  to firebase
    return {
      "name": name,
      "email": email,
      "password": password};
  }

  factory addUserModel.fromMap(Map<String, dynamic> map) {
    ///factory - to get data form firebase (to create the index and update index in  firebase)
    ///User model to trns firebase from map
    return addUserModel(
        name: map['name'].toString(),
        email: map['email'].toString(),
        password: map['password'].toString());
  }
  addUserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return addUserModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}
