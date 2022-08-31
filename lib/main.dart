import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/school_cubit/cubit.dart';
import 'package:school_app/layouts/school_layout.dart';
import 'package:school_app/network/local/cache_helper.dart';
import 'package:school_app/network/remote/dio_helper.dart';
import 'package:school_app/shared/themes.dart';

import 'cubit/bloc_observer.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(
        const MyApp(),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SchoolCubit()
            ..getStudents()
            ..getInstructors()
            ..getSubjects()
            ..getCourses(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const SchoolLayOut(),
      ),
    );
  }
}
