import 'package:api/cubit/Cubit/All_Cubit_Classes.dart';
import 'package:api/cubit/Cubit/All_Cubit_States.dart';
import 'package:api/widgets/already_have_an_account_widget.dart';
import 'package:api/widgets/custom_form_button.dart';
import 'package:api/widgets/custom_input_field.dart';
import 'package:api/widgets/page_header.dart';
import 'package:api/widgets/page_heading.dart';
import 'package:api/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<All_Cubit_Classes, All_Cubit_States>(
        listener: (context, state) {
         if (state is User_Registeration_Failed) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Sign-In Failed")));
  } else if (state is User_Registeration_Sucess) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Sign-In Successful")));
  } else if (state is User_Registeration_Failed) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Sign-Up Failed")));
  } else if (state is User_Registeration_Sucess) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Sign-Up Successful")));
  }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: SingleChildScrollView(
              child: Form(
                key: context.read<All_Cubit_Classes>().signUpFormKey,
                child: Column(
                  children: [
                    const Images(),
                    const PageHeading(title: 'Sign-up'),
                    //! Image
                    const PickImageWidget(),
                    const SizedBox(height: 16),
                    //! Name
                    CustomInputField(
                      labelText: 'Name',
                      hintText: 'Your name',
                      isDense: true,
                      controller: context.read<All_Cubit_Classes>().signUpName,
                    ),
                    const SizedBox(height: 16),
                    //!Email
                    CustomInputField(
                      labelText: 'Email',
                      hintText: 'Your email',
                      isDense: true,
                      controller: context.read<All_Cubit_Classes>().signUpEmail,
                    ),
                    const SizedBox(height: 16),
                    //! Phone Number
                    CustomInputField(
                      labelText: 'Phone number',
                      hintText: 'Your phone number ex:01234567890',
                      isDense: true,
                      controller: context.read<All_Cubit_Classes>().signUpPhoneNumber,
                    ),
                    const SizedBox(height: 16),
                    //! Password
                    CustomInputField(
                      labelText: 'Password',
                      hintText: 'Your password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      controller: context.read<All_Cubit_Classes>().signUpPassword,
                    ),
                    //! Confirm Password
                    CustomInputField(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Your password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      controller: context.read<All_Cubit_Classes>().confirmPassword,
                    ),
                    const SizedBox(height: 22),
                    //!Sign Up Button
                    CustomFormButton(
                      innerText: 'Signup',
                      onPressed: () {


                              context.read<All_Cubit_Classes>().Registeration();


                      },
                    ),
                    const SizedBox(height: 18),
                    //! Already have an account widget
                    const AlreadyHaveAnAccountWidget(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
