import 'package:flutter/cupertino.dart';
import 'package:maybe_app/domain/entity/message.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> messagesList = [
    Message(text: 'Hello', fromWho: FromWho.mine),
    Message(text: 'Are you there?', fromWho: FromWho.mine),
    Message(text: 'yes I am', fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String textMessage) async {
    final newMessage = Message(text: textMessage, fromWho: FromWho.mine);
    messagesList.add(newMessage);
    notifyListeners();
  }
}
