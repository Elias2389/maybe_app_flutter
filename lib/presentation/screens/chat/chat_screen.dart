import 'package:flutter/material.dart';
import 'package:maybe_app/presentation/provider/chat_provider.dart';
import 'package:maybe_app/presentation/screens/widgets/chat/my_message_bubble.dart';
import 'package:provider/provider.dart';

import '../../../domain/entity/message.dart';
import '../widgets/chat/her_message_bubble.dart';
import '../widgets/share/message_field_bix.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('User '),
        centerTitle: false,
        leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.stylist.co.uk/images/app/uploads/2019/11/05103335/the_morning_show_unit_photo_04-1120x1120.jpg?auto=format%2Ccompress&fit=max&fm=webp&monochrome=29000000&q=75&w=1400'),
            )),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: chatProvider.messagesList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messagesList[index];
                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(message: message.text,)
                        : MyMessageBubble(message: message.text,);
                    // return MyMessageBubble();
                  })),
          MessageFieldBox( onValue: (value) {
            chatProvider.sendMessage(value);
          },)
        ]),
      ),
    );
  }
}
