import 'dart:io';
import 'package:api/Models/products/Products_Response.dart';
import 'package:api/cubit/Cubit/All_Cubit_States.dart';
import 'package:api/Models/Login/Login_Request.dart';
import 'package:api/Models/Login/Login_Response.dart';
import 'package:api/Models/Registeration/Registeration_request.dart';
import 'package:api/Models/Registeration/Registeration_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class All_Cubit_Classes extends Cubit<All_Cubit_States> {
  All_Cubit_Classes() : super(User_Initial_Registeration());
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
      emit(User_Initial_Login()); // Emit loading state before the request
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
        emit(User_Registeration_Sucess()); // Emit success when statusCode is 200
      } else {
        emit(User_Login_Failed(Error_MEssage_Whiel_Login: 'Login failed. Please check your credentials.'));
      }
    } catch (e) {
             emit(User_Login_Failed(Error_MEssage_Whiel_Login: 'Login failed. Please check your credentials.'));

      print('Error: ${e.toString()}');
    }
  }

  Registeration() async {

    try {
      emit(User_Registeration_Loading()); // Emit loading state before the request

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
        RegistrationResponse registrationResponse =
            RegistrationResponse.fromJson(response.data);
        emit(User_Registeration_Sucess()); // Emit success state
        print("Registration Successful: ${registrationResponse.name}");
      } else {
        // Handle failure if status code is not 200 or 201
        emit(User_Registeration_Failed(Error_MEssage_Whiele_Register: "Registration failed. Please try again."));
        print("Registration Failed: ${response.statusMessage}");
      }
    } catch (e) {
      // Handle any exception that occurs during registration

    emit(User_Registeration_Failed(Error_MEssage_Whiele_Register: "Something went wrong. Please try again later"));
      print("Error during registration: ${e.toString()}");
    }
  }


FetchProduct() async {
  try {
    emit(ProductLoading());
    print("Current state: $state");
    print("Fetching products..."); // Debug log before the request is made

    final response = await Dio().get('https://fakestoreapi.com/products'); 
    print("Raw Response Data: ${response.data}");
    print("Response Status Code: ${response.statusCode}");

    if (response.statusCode == 200) {
      // Map the response data into a list of products
      List<Product> products = (response.data as List)
          .map((productData) => Product.fromJson(productData))
          .toList();

      // Emit ProductLoadedSucessfully state with the list of products
      emit(ProductLoadedSucessfully(products: products));
      print("Products Loaded Successfully");
      print("Products List: $products"); // Debug log for the parsed product list
    } else {
      emit(ProductFailed(ErrorInLoadingProducts: "Error in loading products"));
      print("Failed to load products: ${response.statusMessage}");
    }
  } catch (e) {
    emit(ProductFailed(ErrorInLoadingProducts: "Something went wrong. Please try again later."));
    print("Error during product fetch: ${e.toString()}");
  }
}





}
