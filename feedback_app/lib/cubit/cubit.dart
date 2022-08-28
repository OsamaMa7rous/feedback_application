import 'package:bloc/bloc.dart';
import 'package:feedback_app/cubit/states.dart';
import 'package:feedback_app/model/login_model.dart';
import 'package:feedback_app/model/logout_model.dart';
import 'package:feedback_app/model/send_feedback_model.dart';
import 'package:feedback_app/model/user_signup_model.dart';
import 'package:feedback_app/moduels/feedback_instructor/feedback_instructor.dart';
import 'package:feedback_app/moduels/feedback_student/feedback_student.dart';
import 'package:feedback_app/moduels/login_screen/login.dart';
import 'package:feedback_app/remote/dio_helper.dart';
import 'package:feedback_app/shared_componant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/get_sessions_model.dart';
import '../shared_componant/reuseable_componant.dart';

class HomeCubit extends Cubit<CubitStates> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> job = ["Student", "Instructor"];
  String? selectedJob;

  void changeJob(job) {
    selectedJob = job;
    emit(ChangeJobSuccessState());
  }

  bool isBottomSheet = false;
  IconData bottomIcon = Icons.edit;


  SignUpModel? signUpModel;
  void signUp({
    required String email,
    required String password,
    required String userName,
    required String phone,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postData(path: signup, data: {
      "email": email,
      "password": password,
      "userName": userName,
      "phone": phone,
      "type": "student"
    }).then((value) {
      signUpModel = SignUpModel.fromJson(value.data);
      emit(SignUpSuccessState());
    }).catchError((error) {
      print("not good");
      print(error.toString());

      emit(SignUpErrorState());
    });
  }

  SendFeedbackModel? sendFeedbackModel;
  void sendFeedbacks({
    required String? email,
    required String? message,
    required String? sessionId,
    required BuildContext context
  }) {
    emit(SendFeedbacksLoadingState());
    DioHelper.postData(path: feedback, data: {
      "email": email,
      "message": message,
      "sessionId": sessionId,
    }).then((value) {
      sendFeedbackModel = SendFeedbackModel.fromJson(value.data);
      print(value.data);
      print("good");
      emit(SendFeedbacksSuccessState());
      navigateAndFinish(context, FeedbackStudent(email: email));
    }).catchError((error) {
      print("not good");
      print(error.toString());

      emit(SendFeedbacksErrorState());
    });
  }

  LogOutModel? logOutModel;
  void logOut({
    required BuildContext context,
  }) {
    emit(LogOutLoadingState());
    DioHelper.postData(path: logout, data: {}).then((value) {
      logOutModel = LogOutModel.fromJson(value.data);
      print(value.data);
      emit(LogOutSuccessState());
      navigateAndFinish(context, LoginScreen());
    }).catchError((error) {
      emit(LogOutErrorState());
    });
  }

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
    required BuildContext context,
    String type = "student",}) {
    emit(LoginLoadingState());
    if (email == "mmoh33657@gmail.com" && password == "mohamedreda") {
      type = "admin";
      DioHelper.postData(
              path: login,
              data: {"email": email, "password": password, "type": type})
          .then((value) {
        loginModel = LoginModel.fromJson(value.data);
        emit(LoginSuccessState());
        navigateAndFinish(context, FeedbackInstructor());
      }).catchError((error) {
        print("Error in get userLogin");

        emit(LoginErrorState());
      });
    } else {
      DioHelper.postData(
              path: login,
              data: {"email": email, "password": password, "type": type})
          .then((value) {
        loginModel = LoginModel.fromJson(value.data);
        emit(LoginSuccessState());
        getAllSessions();
        navigateAndFinish(context, FeedbackStudent(email: email,));
      }).catchError((error) {
        print("Error in get userLogin");

        emit(LoginErrorState());
      });
    }
  }

  GetSessionsModel? getSessionsModel;
  void getAllSessions() {
    emit(GetSessionsLoadingState());

    DioHelper.getData(
      path: getSessions,
    ).then((value) {
      getSessionsModel = GetSessionsModel.fromJson(value.data);
      print(value.data);
      emit(GetSessionsSuccessState());
    }).catchError((onError) {
      emit(GetSessionsErrorState());
    });
  }
}
