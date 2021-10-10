import 'dart:math';

class UserModel {
  String? userId,email,name,pic;
  UserModel({
    this.name,
    this.email,
    this.pic,
    this.userId,
});
  UserModel.fromJson(Map<dynamic,dynamic>map){
    if (map==null){
      return;
    }
    email =map['email'];
    name =map['name'];
    pic =map['pic'];
    userId =map['userId'];


  }
  toJson() {
    return

    {
      'email':email,
      'name':name,
      'pic':pic,
      'userId':userId,
  };
  }
}