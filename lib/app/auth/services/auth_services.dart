// import 'package:bitix/app/auth/models/user.dart';
// import 'firestore_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SignInSignUpResult {
//   final Users? user;
//   final String? message;

//   SignInSignUpResult({this.user, this.message});
// }

// class AuthServices {
//   static FirebaseAuth? _auth = FirebaseAuth.instance;
//   static Future<SignInSignUpResult> register(
//       {String? name,
//       String? email,
//       String? password,
//       String? profilePicture}) async {
//     var result = await _auth!
//         .createUserWithEmailAndPassword(email: email!, password: password!);
//     Users user = Users(
//         id: result.user!.uid,
//         name: name,
//         email: email,
//         balance: 0,
//         profilePicture: profilePicture);
//     FirestoreServices.saveUser(user);
//     return SignInSignUpResult(user: user);
//   }
//   static Stream<User?> get userStream => _auth!.authStateChanges();
// }
