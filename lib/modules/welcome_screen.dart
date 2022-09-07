import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app/modules/login_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/language_change_drop.dart';

import '../shared/widgets/reusable_material_button_for_choice.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.teal,
          statusBarIconBrightness: Brightness.light,
        ),
        actions: [
          LanguageChangeDrop(),
        ],
      ),
      body: Column(
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
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
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
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
            child: ReusableMaterialButtonForChoice(
              text: AppLocalizations.of(context)!.login_admin,
              onPress: () {
                navigateTo(
                  widget: const LoginScreen(),
                  context: context,
                );
              },
            ),
          ),
          Expanded(
            child: ReusableMaterialButtonForChoice(
              text: AppLocalizations.of(context)!.login_instructor,
              onPress: () {},
            ),
          ),
          Expanded(
            child: ReusableMaterialButtonForChoice(
              text: AppLocalizations.of(context)!.login_student,
              onPress: () {},
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
