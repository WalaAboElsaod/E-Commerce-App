import 'package:ecommerce_app/helper/cash_helper.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/service/firestore_user.dart';
import 'package:ecommerce_app/view/home_screen/home_screen.dart';
import 'package:ecommerce_app/view/view_controller_bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  late String email, password, name;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();
  get user => _user.value?.email;
  // final CashHelper cashHelper = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("       UUUUUUUUUUUUUUUUU    ${_auth.currentUser}");
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print('userrrrrrrrrr ${googleUser}');

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
    });
    print('firbaaaaaaaaaaaaaaaaaaaaaaaase');
  }

  void createUser() async {
    try {
      var user = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      print(user);
      print('done');
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar('error', '$e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signIN() async {
    try {
      var signinuser = await _auth.signInWithEmailAndPassword(
          email: email, password: password).then((value)async {
             await FireStoreUser().getCurrentUser(value.user!.uid).then((value){
               // setUser(UserModel.fromJson(value.data()));
             });
      });

      Get.offAll(ControlView());
      print(signinuser);
      print('done');
    } catch (e) {
      Get.snackbar('error', '$e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  // void setUser(UserModel userModel) async {
  //   await cashHelper.setUser(userModel);
  // }

  void saveUser(UserCredential user) async {
   UserModel userModel    =   UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(userModel);
   // setUser(userModel);

    print('yes firstore');
    print('yes casghelper');
  }

}
