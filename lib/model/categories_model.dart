class CategoryModel{
  String? name,image;
  // DataModel? data;


  CategoryModel({this.name,this.image});
  CategoryModel.fromJson(map)
  {
    if (map == null){
      return;
    }
    name=map['name'];
    image=map['image'];
  }
  toJson(){
    return{
      'name':name,
      'image':image,
    };
  }







}

//
// class CategoriesDataModel
// {
//   // int? currentPage;
//   List <DataModel>data=[];
//   CategoriesDataModel.fromjson(json){
//     // currentPage=json['current_page'];
//
//     json['data'].forEach((element) {
//       // banners.add(element);
//       data.add(DataModel.fromjson(element));
//     });
//
//
//   }
//
// }



class DataModel
{
  int? id;
  String? name;
  String? image;

  DataModel.fromjson(json){
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }
  toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }
}