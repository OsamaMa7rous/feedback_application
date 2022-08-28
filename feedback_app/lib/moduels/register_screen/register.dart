import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:feedback_app/cubit/cubit.dart';
import 'package:feedback_app/moduels/feedback_instructor/feedback_instructor.dart';
import 'package:feedback_app/moduels/feedback_student/feedback_student.dart';
import 'package:feedback_app/moduels/login_screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../cubit/states.dart';
import '../../shared_componant/reuseable_componant.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, CubitStates>(
      listener: (context, state) {
        if(state is SignUpSuccessState){
          navigateAndFinish(context, LoginScreen());
        }
      },
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            foregroundColor: HexColor("#4B72AD"),
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * .05),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .22,
                    width: size.width,
                    child: Image.asset("assets/images/feedback.png"),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Register",
                    style: TextStyle(fontSize: 30, color: HexColor("#4B72AD")),
                  ),
                  const SizedBox(height: 20.0),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * .06,
                            width: size.width * .9,
                            child: defaultTextFormFiled(
                                borderRadius: 10.0,
                                controller: nameController,
                                type: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'username can not be empty ';
                                  }
                                },
                                prefix: Icons.supervised_user_circle_outlined,
                                label: 'username'),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
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
                          const SizedBox(
                            height: 10.0,
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
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: size.height * .06,
                            width: size.width * .9,
                            child: defaultTextFormFiled(
                                borderRadius: 10.0,
                                controller: phoneController,
                                type: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'phone can not be empty ';
                                  }
                                },
                                prefix: Icons.phone,
                                label: 'phone'),
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),
                          ConditionalBuilder(
                            condition: state is! UserRegisterLoadingState,
                            builder: (BuildContext context) => Container(
                              decoration: BoxDecoration(
                                color: HexColor("#4B72AD"),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              height: size.height * .05,
                              width: size.width * .8,
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    HomeCubit.get(context).signUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        userName: nameController.text,
                                        phone: phoneController.text);


                                  }

                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            fallback: (BuildContext context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
