import 'package:flutter/material.dart';
import 'package:school_app/modules/student_modules/chat_screen.dart';
import 'package:school_app/shared/methods.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri toLaunchWhats = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: '+201028311143',
    );
    final Uri toLaunchFace = Uri(
      scheme: 'https',
      host: 'www.facebook.com',
      path: 'Code-Icons-101881032678071',
    );
    final Uri toLaunchLinkedIn = Uri(
      scheme: 'https',
      host: 'www.linkedin.com',
      path: 'in/mohamed-ali98/',
    );

    Future<void> launchApps(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }

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
                Expanded(
                  child: InkWell(
                    onTap: () {
                      launchApps(toLaunchWhats);
                    },
                    child: CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/whatsapp.png',
                      ),
                      backgroundColor: Colors.grey[200],
                      radius: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      launchApps(toLaunchFace);
                    },
                    child: CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/facebook.png',
                      ),
                      backgroundColor: Colors.grey[200],
                      radius: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      launchApps(toLaunchLinkedIn);
                    },
                    child: CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/linkedin.png',
                      ),
                      backgroundColor: Colors.grey[200],
                      radius: 30,
                    ),
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
  }
}
