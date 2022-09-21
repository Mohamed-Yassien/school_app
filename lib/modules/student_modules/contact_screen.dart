import 'package:flutter/material.dart';
import 'package:school_app/modules/student_modules/chat_screen.dart';
import 'package:school_app/shared/methods.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // void launchWhatsApp({
    //   @required int? phone,
    //   @required String? message,
    // }) async {
    //   String url() {
    //     if (Platform.isAndroid) {
    //       return "https://wa.me/?phone=$phone";
    //     } else {
    //       return "whatsapp://send?phone=$phone&text=${Uri.parse(message!)}";
    //     }
    //   }
    //   if (await launchUrl(Uri.directory(url()))) {
    //     await launch(url());
    //   } else {
    //     throw 'Could not launch ${url()}';
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // LottieBuilder.asset(
          //   'assets/images/chat.json',
          // ),
          MaterialButton(
            onPressed: () {
              // launchWhatsApp(phone: 0101585, message: 'hello');
            },
            child: Text(
              'go to whats',
            ),
          ),
          const SizedBox(
            height: 30,
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
              'CHAT US FOR SUPPORT',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
