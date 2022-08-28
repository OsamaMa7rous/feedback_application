import 'package:feedback_app/cubit/cubit.dart';
import 'package:feedback_app/cubit/states.dart';
import 'package:feedback_app/model/get_sessions_model.dart';
import 'package:feedback_app/shared_componant/reuseable_componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class SendFeedbackScreen extends StatelessWidget {

    String? sessionsId ;
    String? email;

    SendFeedbackScreen({ required this.sessionsId,required this.email});
  var messageController = TextEditingController();
   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit,CubitStates>(
      listener: (context, state) {

      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text("Write Your Feedback"),
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
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: size.height*.05,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.message_rounded ,color: HexColor("#4B72AD"),),
                    SizedBox(width: size.width*.05,),
                    Text("Write Your Feedback Here",style: TextStyle(
                        color: HexColor("#4B72AD")
                    ),),


                  ],
                ),

                Padding(
                  padding:  EdgeInsets.all(size.height*.03),
                  child: TextFormField(
                    controller: messageController,
                    validator:  (value) {
                      if (value!.isEmpty) {
                        return 'message can not be empty ';
                      }
                      return null;
                    },

                    maxLines: 10,
                    decoration: InputDecoration(

                      iconColor: HexColor("#4B72AD"),
                      enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0),borderSide: BorderSide(
                        color: HexColor("#4B72AD"),
                      ),),
                      focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(10.0),borderSide: BorderSide(
                        color: HexColor("#4B72AD"),
                      ),),
                      border:  OutlineInputBorder(borderRadius:BorderRadius.circular(10.0),borderSide: BorderSide(
                        color: HexColor("#4B72AD"),
                      ), ),
                    ),

                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: HexColor("#4B72AD"),
                  ),
                  width: size.width * .3,
                  child: MaterialButton(
                    onPressed: () {
                   if(formKey.currentState!.validate()){
                     HomeCubit.get(context).sendFeedbacks(email:email, message: messageController.text, sessionId: sessionsId, context: context );


                   }




                    },
                    child: const Text(
                      "send",
                      style: TextStyle(
                          color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
