import 'dart:io';
import 'package:api/cubit/User_State.dart';
import 'package:api/json_files/Login_Request/Login_Request.dart';
import 'package:api/json_files/Login_Request/Login_Response.dart';
import 'package:api/json_files/Registeration/Registeration_request.dart';
import 'package:api/json_files/Registeration/Registeration_response.dart';
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

  Login() async {
    try {
      emit(UserSignInLoading()); // Emit loading state before the request
      final loginRequest = LoginRequest(
        email: signInEmail.text,
        password: signInPassword.text,
      );
      final response = await Dio().post(
        'https://reqres.in/api/login',
        data: loginRequest.toJson(),
      );
      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);
        print('User Token: ${loginResponse.token}');
        emit(UserSignInSucess()); // Emit success when statusCode is 200
      } else {
        emit(UserSignInFailed(
            ErrorMEssage: 'Login failed. Please check your credentials.'));
      }
    } catch (e) {
      emit(UserSignInFailed(
          ErrorMEssage: 'Something went wrong. Please try again later.'));
      print('Error: ${e.toString()}');
    }
  }

/*


  SIgnUp() async {
    emit(UserSignInLoading()); // Emit loading state to show a loading indicator
    try {
      // Make the API request using Dio
      final response = await Dio().post(
        'https://6743e4e9b7464b1c2a663ce5.mockapi.io/registeration',
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

*/

 
Registeration() async {
  try {
    emit(UserSignInLoading()); // Emit loading state before the request

    final registrationRequest = RegistrationRequest(
      name: signUpName.text,
      email: signUpEmail.text,
      phoneNumber: signUpPhoneNumber.text,
      password: signUpPassword.text,
      confirmPassword: signUpPassword.text,
    );
    
    print("Request Data: ${registrationRequest.toJson()}");

    final response = await Dio().post(
      'https://6743e4e9b7464b1c2a663ce5.mockapi.io/registeration',
      data: registrationRequest.toJson(),
    );

    print("Raw Response Data: ${response.data}");
    print("Response Status Code: ${response.statusCode}");

    // Handle successful response
    if (response.statusCode == 200 || response.statusCode == 201) {
      RegistrationResponse registrationResponse = RegistrationResponse.fromJson(response.data);
      emit(UserSignInSucess()); // Emit success state
      print("Registration Successful: ${registrationResponse.name}");
    } else {
      // Handle failure if status code is not 200 or 201
      emit(UserSignInFailed(ErrorMEssage: "Registration failed. Please try again."));
      print("Registration Failed: ${response.statusMessage}");
    }
  } catch (e) {
    // Handle any exception that occurs during registration
    emit(UserSignInFailed(ErrorMEssage: "Something went wrong. Please try again later."));
    print("Error during registration: ${e.toString()}");
  }
}






  
}
