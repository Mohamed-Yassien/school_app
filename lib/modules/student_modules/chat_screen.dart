import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/contact_cubit/chat_states.dart';
import 'package:school_app/shared/widgets/message_bubble.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../cubit/contact_cubit/chat_cubit.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    int currentUserId = 1;

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
            BlocBuilder<ChatCubit, ChatStates>(builder: (context, state) {
              var cubit = ChatCubit.get(context);

              return cubit.messages.isEmpty
                  ? Container()
                  : Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        itemBuilder: (context, index) {
                          return MessageBubble(
                            message: cubit.messages[index].message,
                            isMe:
                                cubit.messages[index].senderId == currentUserId,
                          );
                        },
                        itemCount: cubit.messages.length,
                      ),
                    );
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLines: 2,

                      controller:
                          BlocProvider.of<ChatCubit>(context).messageController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.enter_msg_here,
                        hintStyle: const TextStyle(
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
                        BlocProvider.of<ChatCubit>(context).addMessage();
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.teal,
                      size: 25,
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
