import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productReference =
  FirebaseFirestore.instance.collection('Products');
  final CollectionReference _categoryProductReference =
  FirebaseFirestore.instance.collection('Categories');

  Future <List<QueryDocumentSnapshot>> getCategory ()async{
var value =await _collectionReference.get();
return value.docs;

  }

  Future <List<QueryDocumentSnapshot>> getBestSelling ()async{
var value =await _productReference.get();
return value.docs;

  }
//   Future <List<QueryDocumentSnapshot>> getCategoryProduct ()async{
// var value =await _categoryProductReference.get();
// return value.docs;
//
//   }


}