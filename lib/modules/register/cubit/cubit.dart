import 'package:book_app_store/models/User/user.dart';
import 'package:book_app_store/modules/register/Cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  })
  {
    emit(RegisterLoad());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value)
    {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        name: name,
        email: email,
        phone: phone,
        uid:value.user!.uid,
        address:address,
      );
      emit(RegisterSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(RegisterErrorState(error));
    });
  }
  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uid,
    required String address,
  })
  {
    UserData model = UserData(
      name: name,
      email: email,
      phone: phone,
      address:address,
      uid: uid,
    );
    FirebaseFirestore.instance.collection('Users').
    doc(uid).
    set(model.toMap()).
    then((value){
      emit(CreateUserSuccessState());
    }).catchError((error){
      emit(CreateUserErrorState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(RegisterChangePasswordVisibilityState());
  }
}