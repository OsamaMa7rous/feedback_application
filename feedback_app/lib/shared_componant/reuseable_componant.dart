import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/get_sessions_model.dart';


void navigateTo(BuildContext context ,Widget builder ){
  Navigator.push(context, MaterialPageRoute(builder:(context) => builder, ));
}
void navigateAndFinish(BuildContext context ,Widget builder ){
  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => builder, ));
}

Widget defaultTextFormFiled({
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator<String> validator,
  required IconData prefix,
  required String label,
   var lines=1,
  IconData? suffix,
  bool isClickable = true,
  bool obscure = false,
  VoidCallback? suffixPressed,
  VoidCallback? onTap,
  ValueChanged<String>? onChange,
  required double borderRadius,
}) =>
    TextFormField(
      maxLines: lines,
      obscureText: obscure,
      validator: validator,
      enabled: isClickable,
      onTap: onTap,
      onChanged: onChange,
      controller: controller,

      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(

        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix),
        )
            : null,
        label: Text(label),

iconColor: HexColor("#4B72AD"),

enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(borderRadius),borderSide: BorderSide(
    color: HexColor("#4B72AD"),
),),
focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(borderRadius),borderSide: BorderSide(
    color: HexColor("#4B72AD"),
),),
        border:  OutlineInputBorder(borderRadius:BorderRadius.circular(borderRadius),borderSide: BorderSide(
          color: HexColor("#4B72AD"),
        ), ),
      ),
    );

Widget separatorBuilder(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 1,
      color: Colors.grey[500],
    ),
  );
}
Future<bool?> showToast({required String massage}){
  return Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
void printFullText({required String text}){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) { print(match.group(0));});
}
// Widget conditionBuild({ required Datum tasks, required Size size}) {
//   return ConditionalBuilder(
//     builder: (context) => ListView.separated(
//         itemBuilder: (context, index) =>
//             buildTasks(model: tasks[index], context: context, size: size),
//         separatorBuilder: (context, index) => SizedBox(
//           height: size.height * 0.0005,
//         ),
//         itemCount: tasks.length),
//     fallback: (context) => Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           Icon(
//             Icons.menu,
//             size: 80.0,
//             color: Colors.grey,
//           ),
//           Text(
//             "No Sessions Yet ",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     ),
//     condition: tasks.isNotEmpty,
//   );
// }

Widget buildTasks(
    {required Datum? model,
      required BuildContext context,
      required Size size}) =>
    Dismissible(
      key: Key(model!.sessionId),
      onDismissed: (direction) {
        //   HomeCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding:  EdgeInsets.all(size.height*.015),
        child: SingleChildScrollView(
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
                      model.sessionTitle,
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
                          TextButton(onPressed: (){}, child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: size.width*.04),)
                        ],
                      ),
                    ),
                    Text(
                      " Osama Mahrous",
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
    );





