import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:examples/data.dart';
import 'package:flutter/material.dart';

class TypingUsersSample extends StatefulWidget {
  @override
  State<TypingUsersSample> createState() => TypingUsersSampleState();
}

class TypingUsersSampleState extends State<TypingUsersSample> {
  List<ChatMessage> messages = basicSample;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typing user example'),
      ),
      body: DashChat(
        currentUser: user,
        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });
        },
        typingUsers: <ChatUser>[user3],
        messages: messages,
      ),
    );
  }
}
