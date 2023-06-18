import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import '../models/users.dart';

class AuthGoogle {
  _showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    UserCredential? credentials =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (credentials.user == null) {
      _showErrorMessage(context, "Failed to sign in with Google");
      return;
    }

    String email = credentials.user!.email ?? "";

    if (email == "") {
      _showErrorMessage(context, "Can't login with this google account");
      return;
    }

    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection("users")
        .doc(credentials.user!.uid)
        .get();

    if (document.exists) {
      // Utilisateur déjà existant
      debugPrint("User already exists in Firestore");
      return;
    }

    Users user = Users(email: email, uid: credentials.user!.uid);

    await FirebaseFirestore.instance
        .collection("users")
        .doc(credentials.user!.uid)
        .set(user.toJson());
  }
}

class AuthWithoutServices {
  _showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  logInUser(BuildContext context, String email, String password) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      _showErrorMessage(context, e.code);
    }
  }

  registerUser(
    BuildContext context,
    String email,
    String password,
    String confirmPassword,
  ) async {
    if (password != confirmPassword) {
      _showErrorMessage(context, "Passwords don't match");
      return;
    }

    try {
      UserCredential? credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        _showErrorMessage(context, "Failed to create user");
        return;
      }

      Users user = Users(email: email, uid: credential.user!.uid);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      _showErrorMessage(context, e.code);
    }
  }
}

class AuthService {
  AuthGoogle google = AuthGoogle();
  AuthWithoutServices noServices = AuthWithoutServices();
}
