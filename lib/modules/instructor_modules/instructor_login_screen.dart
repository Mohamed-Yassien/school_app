import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/login_cubit/login_cubit.dart';
import 'package:school_app/cubit/login_cubit/login_states.dart';
import 'package:school_app/layouts/instructor_layout.dart';
import 'package:school_app/modules/welcome_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/reusable_button.dart';
import 'package:school_app/shared/widgets/reusable_text_field.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InstructorLoginScreen extends StatelessWidget {
  const InstructorLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nationalIdController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.login,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontSize: 25,
                    ),
              ),
              backgroundColor: Colors.teal,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarColor: Colors.teal,
                statusBarIconBrightness: Brightness.light,
              ),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      color: Colors.teal,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: Image.asset(
                      'assets/images/teach.jpg',
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 40,
                    ),
                    child: Column(
                      children: [
                        ReusableTextField(
                          controller: nationalIdController,
                          textLabel: AppLocalizations.of(context)!.email,
                          validate: (val) {},
                          type: TextInputType.emailAddress,
                          onChange: (val) {},
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ReusableTextField(
                          controller: passwordController,
                          textLabel: AppLocalizations.of(context)!.password,
                          validate: (val) {},
                          type: TextInputType.text,
                          onChange: (val) {},
                          inRating: true,
                          isPassword: cubit.isPassword,
                          iconData: IconButton(
                            onPressed: () {
                              cubit.changePasswordVisibility();
                            },
                            icon: Icon(
                              cubit.iconData,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        reusableButton(
                          text: AppLocalizations.of(context)!.login,
                          function: () {
                            navigateToAndFinish(
                              widget: const InstructorLayout(),
                              context: context,
                            );
                          },
                          radius: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
