import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipe_app_codsoft_task3/Ui/Authenctication/login_screen.dart';
import 'package:recipe_app_codsoft_task3/Ui/RecipesScreen.dart';

// firebase Auth Provider
final firebaseAuthServiceProvider = Provider<FirebaseAuthServices>((ref) {
  return FirebaseAuthServices();
});

class FirebaseAuthServices {
  // instance of firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestoreDatabase = FirebaseFirestore.instance;
  //create user with email and password
  Future createUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
    required String fullName,
  }) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (credential) {
          firestoreDatabase.collection("Users").doc().set({
            "FullName": fullName,
            "Email": email,
            "UserId": credential.user!.uid,
          }).then((value) {
            Fluttertoast.showToast(
              msg: "Account Created Succesfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.black,
              textColor: Colors.white,
            );
          }).then(
            (value) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const RecipeScreen(),
                ),
              );
            },
          );
        },
      );
    } on FirebaseAuthException catch (e) {
    } catch (e) {}
  }

  // Login user with email and password
  Future signInUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          Fluttertoast.showToast(
            msg: "Logged in  Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.black,
            textColor: Colors.white,
          );
        },
      ).then(
        (value) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const RecipeScreen(),
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
  }

  // signout user
  Future signOutUser(BuildContext context) async {
    await firebaseAuth.signOut().then((value) {
      Fluttertoast.showToast(
        msg: "Logout Succesfull",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
    );
  }

  // getting the auth state of a user
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();
}
