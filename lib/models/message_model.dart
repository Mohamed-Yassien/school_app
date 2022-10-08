import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final int senderId;
  final String message;
  final DateTime dateTime;

  const MessageModel({
    required this.dateTime,
    required this.message,
    required this.senderId,
  });

  factory MessageModel.fromJson(QueryDocumentSnapshot<Object?> json) =>
      MessageModel(
        dateTime: DateTime.fromMillisecondsSinceEpoch(
            json['time'].millisecondsSinceEpoch),
        message: json['message'],
        senderId: json['sender_id'] as int,
      );

  Map<String, dynamic> toMap() {
    return {
      'time': dateTime,
      'sender_id': senderId,
      'message': message,
    };
  }

  @override
  List<Object> get props => [senderId, message, dateTime];
}
