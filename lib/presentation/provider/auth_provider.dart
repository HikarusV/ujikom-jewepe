import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AccountProv extends ChangeNotifier {
  bool iSLogedOn = false;

  UserCredential? user;
  User? userData;
  bool isNormalLogin = false;

  int testID = 0;

  void test() {
    testID++;
    notifyListeners();
  }

  Future reloadState() async {
    FirebaseAuth.instance.authStateChanges();
  }

  void getCurentUser() {
    userData = FirebaseAuth.instance.currentUser;

    handler.userId = userData!.uid;
    handler.email = userData!.email ?? "Kosong";
    // print(userData ?? 'kosong');
  }

  Future getReloadCurentUser() async {
    await FirebaseAuth.instance.currentUser!.reload();
    userData = FirebaseAuth.instance.currentUser!;
  }

  Future<UserCredential> signInMailPass(String email, String pass) async {
    user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
    isNormalLogin = true;
    userData = user!.user;
    notifyListeners();

    return user!;
  }

  Future signUp(String name, String email, String pass) async {
    try {
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      // print('create user success');
      isNormalLogin = true;
      userData = user!.user;
      // print('cekBro : ${userData!.emailVerified}');
      userData!.sendEmailVerification();
      // userData?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    user = null;
  }
}
