import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_app/shared/widgets/message_bubble.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference chats = FirebaseFirestore.instance.collection('chats');

    var messageController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    int currentUserId = 1;

    Future<void> addMessage(String? message) {
      return chats
          .doc('MohamedId')
          .collection('messages')
          .add(
            {
              'sender_id': 1,
              'message': message,
              'time': DateTime.now(),
            },
          )
          .then((value) => print("message Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('chats')
        .doc('MohamedId')
        .collection('messages')
        .orderBy('time')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('no data'),
                  );
                }
                return Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    children: snapshot.data!.docs.reversed
                        .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return MessageBubble(
                        message: data['message'],
                        isMe: data['sender_id'] == currentUserId,
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      decoration:  InputDecoration(
                        hintText: AppLocalizations.of(context)!.enter_msg_here,
                        hintStyle:const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        addMessage(messageController.text).then(
                          (value) {
                            messageController.clear();
                          },
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
