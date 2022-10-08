import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/contact_cubit/chat_cubit.dart';
import 'package:school_app/cubit/contact_cubit/chat_states.dart';
import 'package:school_app/modules/student_modules/chat_screen.dart';
import 'package:school_app/shared/methods.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit,ChatStates>(
      builder: (context, state) {
        var cubit = ChatCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 20,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.launchApps(cubit.toLaunchWhats);
                      },
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                          'assets/images/whatsapp.png',
                        ),
                        backgroundColor: Colors.grey[200],
                        radius: 30,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.launchApps(cubit.toLaunchFace);
                      },
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                          'assets/images/facebook.png',
                        ),
                        backgroundColor: Colors.grey[200],
                        radius: 30,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.launchApps(cubit.toLaunchLinkedIn);
                      },
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                          'assets/images/linkedin.png',
                        ),
                        backgroundColor: Colors.grey[200],
                        radius: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                MaterialButton(
                  shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0,
                    ),
                  ),
                  color: Colors.teal,
                  onPressed: () {
                    navigateTo(
                      widget: const ChatScreen(),
                      context: context,
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.chat_for_support,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
