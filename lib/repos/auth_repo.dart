// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:todolist/model/register_model.dart';
//
// class AuthRepo{
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   bool validate() {
//     // resetErrorText();
//     RegExp emailExp = RegExp(
//         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
//     bool isValid = true;
//
//     // if (email.isEmpty || !emailExp.hasMatch(email)) {
//     //   setState(() {
//     //     emailError = "Email is invalid";
//     //   });
//     //   isValid = false;
//     // }
//     //
//     // if (password.isEmpty) {
//     //   setState(() {
//     //     passwordError = "Please enter a password";
//     //   });
//     //   isValid = false;
//     // }
//     //
//     // if(name.isEmpty ){
//     //   setState((){
//     //     nameError = "Please enter your full name";
//     //   });
//     //   isValid = false;
//     // }
//
//     return isValid;
//
//   }
//
//   Future<void> submit() async{
//     if (validate()){
//       final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {postDetailsToFirestore()});
//       if(newUser != null){
//         // Navigator.of(context).pushReplacement(
//         //     MaterialPageRoute(builder: (context) =>  LoginScreen()));
//         print('account created');
//       }
//     }
//   }
//   postDetailsToFirestore() async{
//     //calling Firestore
//     //calling user model
//     //sending value
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     User? user = _auth.currentUser;
//
//     RegisterModel userModel = RegisterModel();
//
//     userModel.name = name;
//     userModel.id = user.uid;
//     userModel.email = email;
//
//     await firebaseFirestore
//         .collection("User")
//         .doc(user?.uid)
//         .set(userModel.toMap());
//     print('Account created');
//     // Constant.sendToNext(context, Routes.loginRoute);
//     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => PagesNavigate()), (route) => false);
//   }
// }