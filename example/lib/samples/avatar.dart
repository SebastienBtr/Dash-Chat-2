import 'package:dash_chat/dash_chat.dart';
import 'package:examples/data.dart';
import 'package:flutter/material.dart';

class AvatarSample extends StatefulWidget {
  @override
  _AvatarSampleState createState() => _AvatarSampleState();
}

class _AvatarSampleState extends State<AvatarSample> {
  List<ChatMessage> messages = allUsersSample;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users example'),
      ),
      body: DashChat(
        currentUser: user,
        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });
        },
        messages: messages,
      ),
    );
  }
}
