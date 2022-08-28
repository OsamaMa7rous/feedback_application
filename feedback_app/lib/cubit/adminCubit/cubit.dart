import 'package:bloc/bloc.dart';
import 'package:feedback_app/cubit/adminCubit/states.dart';
import 'package:feedback_app/cubit/states.dart';
import 'package:feedback_app/model/admin_model/add_session_model.dart';
import 'package:feedback_app/model/admin_model/update_session_model.dart';
import 'package:feedback_app/moduels/feedback_instructor/feedback_instructor.dart';
import 'package:feedback_app/shared_componant/reuseable_componant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/admin_model/delete_session_model.dart';
import '../../model/admin_model/getfeedbacks_model.dart';
import '../../model/get_sessions_model.dart';
import '../../model/logout_model.dart';
import '../../moduels/login_screen/login.dart';
import '../../remote/dio_helper.dart';
import '../../shared_componant/constant.dart';


class AdminCubit extends Cubit<AdminCubitStates> {
AdminCubit():super(InitialAdminState());



  static AdminCubit get(context) => BlocProvider.of(context);



  bool isBottomSheet = false;
  IconData bottomIcon = Icons.edit;
List<Map> sessions= [];
  void changeBottomSheet({required bool isOpened, required IconData icon}) {
    isBottomSheet = isOpened;
    bottomIcon = icon;

    emit(ChangeBottomSheetState());
  }
DeleteSessionModel? deleteSessionModel;
void deleteSession({
  required var id,

}) {
  emit(DeleteSessionLoadingState());
  DioHelper.postData(path: deletesession, data: {
    "sessionid": id,
  }).then((value) {
    getAllSessionsAdmin();
    deleteSessionModel = DeleteSessionModel.fromJson(value.data);

    emit(DeleteSessionSuccessState());
  }).catchError((error) {
    print(error.toString());

    emit(DeleteSessionErrorState());
  });
}

UpdateSessionModel? updateSessionModel;
void updateSession({
  required String title,
  required var id,
  required String instructor,
  required BuildContext context,

}) {
  emit(UpdateSessionLoadingState());
  DioHelper.postData(path: updatesession, data: {
    "sessionid": id,
    "sessiontitle": title,
    "instructorname": instructor,
  }).then((value) {

    updateSessionModel = UpdateSessionModel.fromJson(value.data);
    emit(UpdateSessionSuccessState());
    navigateAndFinish(context, FeedbackInstructor());
    getAllSessionsAdmin();
  }).catchError((error) {
    print(error.toString());

    emit(UpdateSessionErrorState());
  });
}

  AddSessionModel? addSessionModel;
  void addSession({
    required String title,
    required String instructor,
    required BuildContext context,

  }) {
    emit(AddSessionLoadingState());
    DioHelper.postData(path: addsession, data: {
      "sessiontitle": title,
      "instructorname": instructor,
    }).then((value) {

      addSessionModel = AddSessionModel.fromJson(value.data);
      bottomIcon = Icons.edit;
      isBottomSheet = false;
      Navigator.pop(context);
      emit(AddSessionSuccessState());
      getAllSessionsAdmin();
    }).catchError((error) {
      print("not good");
      print(error.toString());

      emit(AddSessionErrorState());
    });
  }


GetSessionsModel? getSessionsAdminModel;
void getAllSessionsAdmin() {
  emit(AdminGetSessionsLoadingState());

  DioHelper.getData(
    path: getSessions,
  ).then((value) {
    getSessionsAdminModel = GetSessionsModel.fromJson(value.data);
    print(value.data);
    emit(AdminGetSessionsSuccessState());
  }).catchError((onError) {
    emit(AdminGetSessionsErrorState());
  });
}

LogOutModel? logOutModel;
void logOut({
  required BuildContext context,
}) {
  emit(AdminLogOutLoadingState());
  DioHelper.postData(path: logout, data: {}).then((value) {
    logOutModel = LogOutModel.fromJson(value.data);
    print(value.data);
    emit(AdminLogOutSuccessState());
    navigateAndFinish(context, LoginScreen());
  }).catchError((error) {
    emit(AdminLogOutErrorState());
  });
}
FeedBacksModel? feedBacksModel;
void getAllFeedbacksAdmin() {
  emit(GetFeedbacksLoadingState());

  DioHelper.getData(
    path: getfeadbacks,
  ).then((value) {
    feedBacksModel = FeedBacksModel.fromJson(value.data);
    print(value.data);
    emit(GetFeedbacksSuccessState());
  }).catchError((onError) {
    emit(GetFeedbacksErrorState());
  });
}
}
