import 'package:feedback_app/cubit/adminCubit/cubit.dart';
import 'package:feedback_app/cubit/adminCubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared_componant/reuseable_componant.dart';

class UpdateSession extends StatelessWidget {
  var id;
  UpdateSession({required this.id});
  var sessionNameController = TextEditingController();
  var engineerNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => AdminCubit(),
      child: BlocConsumer<AdminCubit,AdminCubitStates>(
        listener: (context, state) {

        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text("Update Your Session"),
            centerTitle: true,
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * .2, horizontal: size.width * .1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.height * .01),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(.1),
                      Colors.blue.withOpacity(.2),
                    ],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .08, vertical: size.height * .1),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(id.toString()),
                          SizedBox(
                            height: size.height * .06,
                            width: size.width * .9,
                            child: defaultTextFormFiled(
                                borderRadius: 10.0,
                                controller: sessionNameController,
                                type: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'sessionName can not be empty ';
                                  }
                                  return null;
                                },
                                prefix: Icons.title,
                                label: 'session name'),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                            height: size.height * .06,
                            width: size.width * .9,
                            child: defaultTextFormFiled(
                                borderRadius: 10.0,
                                controller: engineerNameController,
                                type: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'EngineerName can not be empty ';
                                  }
                                  return null;
                                },
                                prefix: Icons.supervised_user_circle_outlined,
                                label: 'engineer Name'),
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
                                      AdminCubit.get(context).updateSession(
                                          title: sessionNameController.text,
                                          id: id,
                                          instructor: engineerNameController.text,
                                          context: context);
                                    }
                                  },
                                  child: const Text(
                                    "update",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ) ,

      ),
    );
  }
}
