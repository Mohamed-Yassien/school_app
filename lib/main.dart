import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/instructor_cubit/instructor_cubit.dart';
import 'package:school_app/cubit/plans_cubit/plans_cubit.dart';
import 'package:school_app/cubit/school_cubit/cubit.dart';
import 'package:school_app/cubit/student_cubit/student_cubit.dart';
import 'package:school_app/modules/welcome_screen.dart';
import 'package:school_app/network/local/cache_helper.dart';
import 'package:school_app/network/remote/dio_helper.dart';
import 'package:school_app/shared/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cubit/bloc_observer.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  var fcmToken = await messaging.getToken();
  print('token is $fcmToken');
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? userLocale;

  setLocale(Locale locale) {
    setState(() {
      userLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SchoolCubit()
            ..getCourses()
            ..initNotification(),
        ),
        BlocProvider(
          create: (context) => StudentCubit()..getStudents(),
        ),
        BlocProvider(
          create: (context) => InstructorCubit()..getInstructors(),
        ),
        BlocProvider(
          create: (context) => PlansCubit()..getPlans(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: Locale(CacheHelper.getData(key: 'lang') ?? 'en', ''),
        theme: lightTheme,
        home: const WelcomeScreen(),
      ),
    );
  }
}
