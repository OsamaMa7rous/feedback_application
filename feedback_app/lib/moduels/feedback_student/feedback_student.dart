import 'package:feedback_app/cubit/cubit.dart';
import 'package:feedback_app/cubit/states.dart';
import 'package:feedback_app/moduels/feedback_student/send_feedback_screen.dart';
import 'package:feedback_app/shared_componant/reuseable_componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class FeedbackStudent extends StatelessWidget {
  String? email;
  FeedbackStudent({required this.email});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, CubitStates>(
      listener: (context, state) {
        if (state is GetSessionsLoadingState) {}
      },
      builder: (context, state) {
        if (state is GetSessionsLoadingState) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text("Select session"),
              centerTitle: true,
              toolbarHeight: size.height * .1,
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    color: HexColor("#4B72AD"),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0))),
              ),
              elevation: 0.0,
            ),
            floatingActionButton: CircleAvatar(
               backgroundColor: HexColor("#4B72AD"),
              maxRadius: 25,
              child: Center(
                child: IconButton(
                    onPressed: () {
                      HomeCubit.get(context).logOut(context: context);
                    },
                    icon: Icon(
                      Icons.login_sharp,
                      size: 30.0,
                      color: Colors.white,
                    )),
              ),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        navigateTo(
                            context,
                            SendFeedbackScreen(
                              sessionsId: HomeCubit.get(context)
                                  .getSessionsModel!
                                  .data![index]
                                  .sessionId,
                              email: email,
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
                                    HomeCubit.get(context)
                                        .getSessionsModel!
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
                                        Spacer(),
                                        TextButton(
                                          onPressed: () {},
                                          child: Icon(Icons.arrow_forward_ios,
                                              color: Colors.grey,
                                              size: size.width * .04),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    HomeCubit.get(context)
                                        .getSessionsModel!
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
                itemCount:
                    HomeCubit.get(context).getSessionsModel!.data!.length),
          );
        }
      },
    );
  }
}
