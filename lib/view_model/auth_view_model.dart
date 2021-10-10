import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/service/firestore_user.dart';
import 'package:ecommerce_app/view/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn =GoogleSignIn(scopes: ['email']);


  late String email, password, name;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn <User> _user=Rxn <User>();
  get user =>_user.value?.email;
  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod ()async {
  final  GoogleSignInAccount?  googleUser=
  await _googleSignIn.signIn();
  print ('userrrrrrrrrr ${googleUser}');


  GoogleSignInAuthentication googleSignInAuthentication=
 await googleUser!.authentication;
 final AuthCredential credential= GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,

  );

await _auth.signInWithCredential(credential);
print('firbaaaaaaaaaaaaaaaaaaaaaaaase');
  }
  

  void createUser() async {
    try {
    var user=  await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) async{

      await FireStoreUser().addUserToFireStore(  UserModel(
        userId:user.user!.uid,
        email:user.user!.email,
        name:name,
        pic:'',
      ));
      print('yes firstore');

    });

    print(user);
    print('done');
    Get.offAll(Home());

    }

    catch (e) {
      Get.snackbar('error', '$e',snackPosition: SnackPosition.BOTTOM);

    }
  }
  void signIN() async {
    try {
    var signinuser=  await _auth.signInWithEmailAndPassword(email: email, password: password);

    Get.offAll(Home());
    print(signinuser);
    print('done');
    }
    catch (e) {
      Get.snackbar('error', '$e',snackPosition: SnackPosition.BOTTOM);

    }
  }
}