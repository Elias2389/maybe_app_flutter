import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maybe_app/presentation/screens/widgets/chat/my_message_bubble.dart';

import '../widgets/chat/her_message_bubble.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
            // return MyMessageBubble();
          })),
          const Text('Hola')
        ]),
      ),
    );
  }
}
