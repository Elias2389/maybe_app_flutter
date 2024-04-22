import 'package:flutter/cupertino.dart';
import 'package:maybe_app/domain/entity/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();

  final List<Message> messagesList = [
    Message(text: 'Hello', fromWho: FromWho.mine),
    Message(text: 'Are you there?', fromWho: FromWho.mine),
    Message(text: 'yes I am', fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String textMessage) async {
    if (textMessage.isEmpty) return;
    final newMessage = Message(text: textMessage, fromWho: FromWho.mine);
    messagesList.add(newMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
