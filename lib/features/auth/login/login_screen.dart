import 'package:balanced_meal/core/helpers/show_toast.dart';
import 'package:balanced_meal/core/theming/colors.dart';
import 'package:balanced_meal/core/theming/styles.dart';
import 'package:balanced_meal/core/widgets/app_text_button.dart';
import 'package:balanced_meal/core/widgets/app_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isLoading = false;
  String? email;
  String? password;
  IconData passwordSuffixIcon = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(
        color: ColorsManager.mainOrange,
      ),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: null,
          title: Text(
            "Login",
            style: TextStyles.font20BlackMedium.copyWith(fontFamily: 'Poppins'),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.0.h,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 120),
                        AppTextFormField(
                          hintText: 'Email',
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter your email.';
                            }
                            return null;
                          },
                          onChanged: (data) {
                            email = data;
                          },
                        ),
                        SizedBox(height: 20),
                        AppTextFormField(
                          hintText: 'Password',
                          obscureText: isObscure,
                          suffixIcon: IconButton(
                            icon: Icon(passwordSuffixIcon),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                                passwordSuffixIcon =
                                    isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off;
                              });
                            },
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter your password.';
                            }
                            return null;
                          },
                          onChanged: (data) {
                            password = data;
                          },
                        ),
                        SizedBox(height: 50),
                        Text.rich(
                          TextSpan(
                            text: "Don't have an account?  ",
                            style: TextStyle(color: ColorsManager.lightBlack),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  color: ColorsManager.mainOrange,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                          context,
                                          'registerPage',
                                        );
                                      },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30,
              ),
              child: AppTextButton(
                text: 'Login',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      setState(() {
                        isLoading = true;
                      });
                      await loginUser();
                      Navigator.pushReplacementNamed(
                        context,
                        'userDetailsScreen',
                      );
                    } on FirebaseAuthException catch (ex) {
                      showToast(ex.code);
                    } catch (ex) {
                      showToast('An error occurred');
                    }
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                color: ColorsManager.mainOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    showToast('Success');
  }
}
