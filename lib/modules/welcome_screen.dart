import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app/modules/admin_modules/admin_login_screen.dart';
import 'package:school_app/modules/student_modules/student_login_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/language_change_drop.dart';

import '../shared/widgets/reusable_material_button_for_choice.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'instructor_modules/instructor_login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.teal,
          statusBarIconBrightness: Brightness.light,
        ),
        actions: [
          LanguageChangeDrop(),
        ],
      ),
      body: width <= 450
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    color: Colors.teal,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.let_start,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.teal,
                            fontSize: 22,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Expanded(
                  child: ReusableMaterialButtonForChoice(
                    text: AppLocalizations.of(context)!.login_admin,
                    onPress: () {
                      navigateTo(
                        widget: const AdminLoginScreen(),
                        context: context,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ReusableMaterialButtonForChoice(
                    text: AppLocalizations.of(context)!.login_instructor,
                    onPress: () {
                      navigateTo(
                        widget: const InstructorLoginScreen(),
                        context: context,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ReusableMaterialButtonForChoice(
                    text: AppLocalizations.of(context)!.login_student,
                    onPress: () {
                      navigateTo(
                        widget: const StudentLoginScreen(),
                        context: context,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/login_bottom.png',
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.let_start,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.teal,
                            fontSize: 22,
                          ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ReusableMaterialButtonForChoice(
                        text: AppLocalizations.of(context)!.login_admin,
                        onPress: () {
                          navigateTo(
                            widget: const AdminLoginScreen(),
                            context: context,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableMaterialButtonForChoice(
                        text: AppLocalizations.of(context)!.login_instructor,
                        onPress: () {
                          navigateTo(
                            widget: const InstructorLoginScreen(),
                            context: context,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableMaterialButtonForChoice(
                        text: AppLocalizations.of(context)!.login_student,
                        onPress: () {
                          navigateTo(
                            widget: const StudentLoginScreen(),
                            context: context,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;

    Path path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(
      w * .5,
      h - 150,
      w,
      h - 50,
    );
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
