import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
class UserFromFirebase {
  UserFromFirebase({required this.uid});
  final String uid;
}
//
//abstract class AuthBase {
//  Stream<UserFromFirebase?> get onAuthStateChanged;
////  Future<UserFromFirebase> currentUser();
//  Future<void> signInWithEmailAndPassword(String email, String password);
//  Future sendPasswordResetEmail(String email);
//  Future<void> signOut();
//}

@lazySingleton
class Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  UserFromFirebase? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return UserFromFirebase(
      uid: user.uid,
    );
  }

  Stream<UserFromFirebase?> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

//  @override
//  Future<UserFromFirebase> currentUser() async {
//    final user =  _firebaseAuth.currentUser;
//    return _userFromFirebase(user);
//  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try{
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
       _userFromFirebase(authResult.user);
    }catch(e){
      rethrow;
    }
  }

  Future sendPasswordResetEmail(String email) async {
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }catch(e){
      rethrow;
    }

    catch(e){
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
