import 'package:feedback_app/moduels/feedback_instructor/show_feedback_screen.dart';
import 'package:feedback_app/moduels/feedback_instructor/update_session_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../cubit/adminCubit/cubit.dart';
import '../../cubit/adminCubit/states.dart';
import '../../shared_componant/reuseable_componant.dart';

class FeedbackInstructor extends StatelessWidget {
  FeedbackInstructor({Key? key}) : super(key: key);
  TextEditingController sessionNameController = TextEditingController();
  TextEditingController engineerNAmeController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AdminCubit()..getAllSessionsAdmin(),
      child: BlocConsumer<AdminCubit, AdminCubitStates>(
        listener: (context, state) {
          if (state is AddSessionSuccessState) {
            AdminCubit.get(context).isBottomSheet = false;
            AdminCubit.get(context).bottomIcon = Icons.edit;
          }
        },
        builder: (context, state) {
          if (state is AdminGetSessionsLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: const Text("Welcome Admin"),
                toolbarHeight: size.height * .1,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      color: HexColor("#4B72AD"),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0))),
                ),
                elevation: 20.0,
                actions: [
                  TextButton(
                      onPressed: () {
                        navigateTo(context, const ShowFeedBack());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "See ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(" Feedbacks",
                              style: TextStyle(color: Colors.white)),
                        ],
                      )),
                  TextButton(
                      onPressed: () {
AdminCubit.get(context).logOut(context: context);
                      },
                      child: Icon(Icons.login_outlined,color: Colors.white,)),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: HexColor("#4B72AD"),
                onPressed: () {
                  if (AdminCubit.get(context).isBottomSheet == true) {
                    if (formKey.currentState!.validate()) {
                      AdminCubit.get(context).addSession(
                          instructor: engineerNAmeController.text,
                          title: sessionNameController.text,
                          context: context);
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet(
                          (context) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      defaultTextFormFiled(
                                          controller: sessionNameController,
                                          type: TextInputType.text,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'title must not be empty';
                                            }
                                            return null;
                                          },
                                          prefix: Icons.title,
                                          label: "Task Title",
                                          borderRadius: 10),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultTextFormFiled(
                                          borderRadius: 10.0,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'time must not be empty';
                                            }
                                            return null;
                                          },
                                          controller: engineerNAmeController,
                                          type: TextInputType.text,
                                          prefix: Icons
                                              .supervised_user_circle_outlined,
                                          label: "engineer Name"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          elevation: 40.0,
                          backgroundColor: Colors.grey[50],
                        )
                        .closed
                        .then((value) {
                          AdminCubit.get(context).changeBottomSheet(
                              isOpened: false, icon: Icons.edit);
                        });

                    AdminCubit.get(context)
                        .changeBottomSheet(isOpened: true, icon: Icons.add);
                  }
                },
                child: Icon(AdminCubit.get(context).bottomIcon),
              ),
              body: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          navigateTo(
                              context,
                              UpdateSession(
                                id: AdminCubit.get(context)
                                    .getSessionsAdminModel!
                                    .data![index]
                                    .sessionId,
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * .03),
                          child: Row(
                            children: [
                              CircleAvatar(
                                maxRadius: size.height * .04,
                                backgroundColor: HexColor("#4B72AD"),
                                child: Icon(
                                  Icons.school_outlined,
                                  color: Colors.white,
                                  size: size.height * .04,
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      AdminCubit.get(context)
                                          .getSessionsAdminModel!
                                          .data![index]
                                          .sessionTitle,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: HexColor("#4B72AD"),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * .03,
                                      child: Row(
                                        children: [
                                          const Spacer(),
                                          TextButton(
                                            onPressed: () {
                                              AdminCubit.get(context)
                                                  .deleteSession(
                                                      id: AdminCubit.get(
                                                              context)
                                                          .getSessionsAdminModel!
                                                          .data![index]
                                                          .sessionId);
                                            },
                                            child: Icon(Icons.delete,
                                                color: Colors.grey,
                                                size: size.width * .04),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      AdminCubit.get(context)
                                          .getSessionsAdminModel!
                                          .data![index]
                                          .instructorName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: size.height * .01,
                                    ),
                                    Container(
                                      width: size.width,
                                      color: Colors.grey[300],
                                      height: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: size.height * .02,
                      ),
                  itemCount: AdminCubit.get(context)
                      .getSessionsAdminModel!
                      .data!
                      .length),
            );
          }
        },
      ),
    );
  }
}
