import 'package:feedback_app/cubit/adminCubit/cubit.dart';
import 'package:feedback_app/cubit/adminCubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ShowFeedBack extends StatelessWidget {
  const ShowFeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => AdminCubit()..getAllFeedbacksAdmin(),
      child: BlocConsumer<AdminCubit, AdminCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetFeedbacksLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Feedbacks"),
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
              ),
              body: ListView.separated(
                  itemBuilder: (context, index) {
                    var model =
                        AdminCubit.get(context).feedBacksModel!.data![index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: size.width * .04,
                        left: size.width * .04,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.height * .01),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.grey.withOpacity(.1),
                              Colors.blue.withOpacity(.2),
                            ],
                          ),
                        ),
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
                                    Row(
                                      children: [
                                        Text(
                                          model.sessionTitle,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: HexColor("#4B72AD"),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          model.instructorName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * .03,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "from : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          model.email,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: Colors.redAccent),
                                        ),

                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * .01,
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(size.height*.03),
                                      padding: EdgeInsets.all(size.height*.01),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(size.height * .01),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.green.withOpacity(.1),
                                            Colors.greenAccent.withOpacity(.2),
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        model.mess,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,

                                            color: Colors.green),
                                      ),
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
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: size.height * .02,
                      ),
                  itemCount:
                      AdminCubit.get(context).feedBacksModel!.data!.length),
            );
          }
        },
      ),
    );
  }
}
