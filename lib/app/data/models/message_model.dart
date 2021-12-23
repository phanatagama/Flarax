import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/values/constant.dart';

class MessageChat {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  MessageChat({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      Const.IDFROM: this.idFrom,
      Const.IDTO: this.idTo,
      Const.TIMESTAMP: this.timestamp,
      Const.CONTENT: this.content,
      Const.TYPE: this.type,
    };
  }

  factory MessageChat.fromDocument(DocumentSnapshot doc) {
    String idFrom = doc.get(Const.IDFROM);
    String idTo = doc.get(Const.IDTO);
    String timestamp = doc.get(Const.TIMESTAMP);
    String content = doc.get(Const.CONTENT);
    int type = doc.get(Const.TYPE);
    return MessageChat(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type);
  }
}
