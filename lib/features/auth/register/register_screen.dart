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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: Color(0xff1E1E1E)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Register",
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
                            text: "Already have an account?  ",
                            style: TextStyle(color: ColorsManager.lightBlack),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  color: ColorsManager.mainOrange,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pop(context);
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
                text: 'Register',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      setState(() {
                        isLoading = true;
                      });
                      await registerUser();
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    showToast('Success');
  }
}
