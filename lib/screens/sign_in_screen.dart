import 'package:api/cubit/Cubit/All_Cubit_Classes.dart';
import 'package:api/cubit/Cubit/All_Cubit_States.dart';
import 'package:api/screens/Product_Screen.dart';
import 'package:api/widgets/custom_form_button.dart';
import 'package:api/widgets/custom_input_field.dart';
import 'package:api/widgets/dont_have_an_account.dart';
import 'package:api/widgets/forget_password_widget.dart';
import 'package:api/widgets/page_header.dart';
import 'package:api/widgets/page_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<All_Cubit_Classes, All_Cubit_States>(
        listener: (context, state) {
          print('Current state: $state');

          if (state is User_Registeration_Failed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.Error_MEssage_Whiele_Register)));
          } else if (state is User_Registeration_Sucess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Sign-in successful')));

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: Column(
              children: [
                const Images(),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: context.read<All_Cubit_Classes>().signInFormKey,
                        child: Column(
                          children: [
                            const PageHeading(title: 'Sign-in'),
                            //!Email
                            CustomInputField(
                              labelText: 'Email',
                              hintText: 'Your email',
                              controller: context.read<All_Cubit_Classes>().signInEmail,
                            ),
                            const SizedBox(height: 16),
                            //!Password
                            CustomInputField(
                              labelText: 'Password',
                              hintText: 'Your password',
                              obscureText: true,
                              suffixIcon: true,
                              controller:
                                  context.read<All_Cubit_Classes>().signInPassword,
                            ),
                            const SizedBox(height: 16),
                            //! Forget password?
                            ForgetPasswordWidget(size: size),
                            const SizedBox(height: 20),
                            //!Sign In Button
                            CustomFormButton(
                                innerText: 'Sign In',
                                onPressed: () {
                                  context.read<All_Cubit_Classes>().Login();
                                  /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileScreen(),
                                  ),
                                );
                                  */
                                }),
                            const SizedBox(height: 18),
                            //! Dont Have An Account ?
                            DontHaveAnAccountWidget(size: size),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
