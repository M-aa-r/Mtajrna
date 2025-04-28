//import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtjry/login/cubit/state.dart';

//import '../../core/componant/cache_helper.dart';
import '../../models/user_model.dart';

String? uId;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  void userSkip({
    required List<String> favorite,
  }) async {
    try {
      emit(AuthLoading());
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print("User signed in anonymously: ${userCredential.user!.uid}");
      await userCreate(
          uId: FirebaseAuth.instance.currentUser!.uid, favorite: favorite);
      /*    bool saveUId = await CacheHelper.saveData(
          key: "uId", value: FirebaseAuth.instance.currentUser!.uid);
      if (saveUId == true) {
        uId = FirebaseAuth.instance.currentUser!.uid;
      }*/
      emit(AuthRegisterSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorOccurred(error: e.toString()));
    }
  }

  userCreate({
    required String uId,
    required List<String> favorite,
  }) {
    UserModel model = UserModel(
      uId: uId,
      favorite: favorite,
    );

    FirebaseFirestore.instance
        .collection("user")
        .doc(uId)
        .set(model.toMap())
        .then((value) {})
        .catchError((error) {
      print("fireStore error ${error.toString()}");
      emit(AuthErrorOccurred(error: error.toString()));
    });
  }
}
