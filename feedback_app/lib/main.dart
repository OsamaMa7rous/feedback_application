import 'package:feedback_app/cubit/cubit.dart';
import 'package:feedback_app/moduels/start_screen/start.dart';
import 'package:feedback_app/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/bloc_observable.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => HomeCubit(),
      child: const MaterialApp(
        title: 'Flutter Demo',
debugShowCheckedModeBanner: false,
        home: StartScreen(),
      ),
    );
  }
}
