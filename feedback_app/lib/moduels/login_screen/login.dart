import 'package:feedback_app/cubit/cubit.dart';
import 'package:feedback_app/cubit/states.dart';
import 'package:feedback_app/moduels/feedback_instructor/feedback_instructor.dart';
import 'package:feedback_app/moduels/register_screen/register.dart';
import 'package:feedback_app/shared_componant/reuseable_componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit, CubitStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.09),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .22,
                  width: size.width,
                  child: Image.asset("assets/images/feedback.png"),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: size.height * .04,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#4B72AD")),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Form(
                    key: formKey,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.06),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .06,
                            width: size.width * .9,
                            child: defaultTextFormFiled(
                                borderRadius: 10.0,
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'email can not be empty ';
                                  }
                                },
                                prefix: Icons.email_rounded,
                                label: 'email'),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                            height: size.height * .06,
                            width: size.width * .9,
                            child: defaultTextFormFiled(
                                borderRadius: 10.0,
                                controller: passwordController,
                                type: TextInputType.number,
                                obscure: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'password can not be empty ';
                                  }
                                },
                                prefix: Icons.security,
                                label: 'password'),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: HexColor("#4B72AD"),
                                ),
                                width: size.width * .3,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {

                                      HomeCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context);
                                    }
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(context, RegisterScreen());
                                  },
                                  child: const Text(
                                    "Register Now",
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
