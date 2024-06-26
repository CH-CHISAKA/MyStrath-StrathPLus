import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerNewUser(String id, String password) async {
    String result = 'Something went wrong';

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: '$id@example.com', 
              password: password);

      await _firestore.collection('Buyers').doc(userCredential.user!.uid).set({
        'id': id,
        'fullName':" ",
        'uid': userCredential.user!.uid,
        'phoneNumber': " ",
        // 'admissionNumber': " ",
      });

      result = "success";
    } on FirebaseAuthException catch (e){
      if (e.code == 'weak-password') {
      result =  'The password provided is too weak.';
      } else if(e.code == 'details-already-in-use'){
        result = 'The accoint already exists for that credentiial';
      }
    }
  
    catch (e) {
      result = e.toString();
    }

    return result;
  }

  /// LOGIIN USER
  ///
  Future<String> loginUser (String id, String password )async{
    String result = "Something went wrong - Confirm Password and Login Id ";

    try {
      await _auth.signInWithEmailAndPassword(email: id, password: password);
    } on FirebaseAuthException catch (e){
      if (e.code == 'user-not-founf') {
      result =  'No user found for that credential';
      } else if(e.code == 'wrong-password'){
        result = 'Wrong credentials provided for this user.';
      }
    }
    catch (e) {
      result = e.toString();
    }
    return result;
  }
}