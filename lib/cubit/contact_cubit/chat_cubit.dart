import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/cubit/contact_cubit/chat_states.dart';
import 'package:school_app/models/message_model.dart';
import 'package:url_launcher/url_launcher.dart';


class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  CollectionReference chats = FirebaseFirestore.instance
      .collection('chats')
      .doc('MohamedId')
      .collection('messages');
  var messageController = TextEditingController();

  List<MessageModel> messages = [];

  void addMessage() {
    MessageModel messageModel = MessageModel(
      dateTime: DateTime.now(),
      message: messageController.text,
      senderId: 1,
    );

    chats
        .add(
      messageModel.toMap(),
    )
        .then((value) {
      print("message Added");
      messageController.clear();
    }).catchError(
      (error) => print("Failed to add user: $error"),
    );
  }

  getMessage() {
    chats.orderBy('time',descending: true).snapshots().listen(
      (event) {
        messages.clear();
        for (var doc in event.docs) {
          print('doc is $doc');
          messages.add(MessageModel.fromJson(doc));
        }
        emit(ChatSuccessState());
      },
    );
  }

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
}
