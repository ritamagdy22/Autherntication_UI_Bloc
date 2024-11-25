import 'dart:io';

import 'package:api/cubit/User_State.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic

  File? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  // SignIn method with try-catch
  signIn() async {
    try {
      emit(
          UserSignInLoading()); // Emit loading state to show a loading indicator

      // Make the API request using Dio
      final response = await Dio().post(
        'https://reqres.in/api/login',
        data: {
          "email": signInEmail.text,
          "password": signInPassword.text,
        },
      );
      print(response);
      // Check if the response is successful
      emit(UserSignInFailur()); // Emit failure state if statusCode is not 200

      emit(UserSignInSucess()); // Emit success state when sign-in is successful
    } catch (e) {
      emit(UserSignInFailur()); // Emit failure state if there's an error
      print(e.toString()); // Optional: Log the error for debugging
    }
  }

  SIgnUp() async {
    emit(UserSignInLoading()); // Emit loading state to show a loading indicator

    try {
      // Make the API request using Dio
      final response = await Dio().post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          "Name": signUpName.text,
          "Email": signUpEmail.text,
          "phoneNumber": signUpPhoneNumber.text,
          "password": signUpPassword.text,
          "confirmPassword": signUpPassword.text,
        },
      );

      if (response.statusCode == 200) {
        emit(
            UserSignInSucess()); // Emit success state when sign-in is successful
      } else {
        emit(UserSignInFailur()); // Emit failure state if statusCode is not 200
      }
    } catch (e) {
      emit(UserSignInFailur()); // Emit failure state if there's an error
      print(e.toString()); // Optional: Log the error for debugging
    }
  }
}
