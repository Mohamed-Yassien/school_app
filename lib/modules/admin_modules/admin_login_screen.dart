import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/login_cubit/login_cubit.dart';
import 'package:school_app/cubit/login_cubit/login_states.dart';
import 'package:school_app/layouts/admin_layout.dart';
import 'package:school_app/modules/welcome_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:school_app/shared/widgets/reusable_button.dart';
import 'package:school_app/shared/widgets/reusable_text_field.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is AdminLoginSuccessState) {
            // navigateToAndFinish(
            //   widget: const AdminLayout(),
            //   context: context,
            // );
          }
        },
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          ReusableTextField(
                            controller: emailController,
                            textLabel: AppLocalizations.of(context)!.email,
                            validate: (String val) {
                              if (val.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .email_empty;
                              }
                            },
                            type: TextInputType.emailAddress,
                            onChange: (val) {},
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ReusableTextField(
                            controller: passwordController,
                            textLabel: AppLocalizations.of(context)!.password,
                            validate: (String val) {
                              if (val.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .password_empty;
                              }
                            },
                            type: TextInputType.number,
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
                          state is AdminLoginLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : state is AdminLoginSuccessState
                                  ? const SizedBox()
                                  : reusableButton(
                                      text: AppLocalizations.of(context)!.login,
                                      function: () {
                                        // if (formKey.currentState!.validate()) {
                                        //   cubit.adminLogin(
                                        //     email: emailController.text,
                                        //     password: passwordController.text,
                                        //   );
                                        // }
                                        navigateToAndFinish(
                                          widget: const AdminLayout(),
                                          context: context,
                                        );
                                      },
                                      radius: 5,
                                    ),
                        ],
                      ),
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
