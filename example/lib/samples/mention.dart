import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:examples/data.dart';
import 'package:flutter/material.dart';

class MentionSample extends StatefulWidget {
  @override
  _MentionSampleState createState() => _MentionSampleState();
}

class _MentionSampleState extends State<MentionSample> {
  List<ChatMessage> messages = mentionSample;
  List<Mention> mentions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mention example'),
      ),
      body: DashChat(
        currentUser: user,
        onSend: (ChatMessage m) {
          m.mentions = mentions;
          setState(() {
            messages.insert(0, m);
            mentions = [];
          });
        },
        messages: messages,
        messageListOptions: MessageListOptions(
          onLoadEarlier: () async {
            await Future.delayed(const Duration(seconds: 3));
          },
        ),
        messageOptions: MessageOptions(
          onPressMention: (mention) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(mention.title),
                  content: Text(mention.customProperties.toString()),
                );
              },
            );
          },
        ),
        inputOptions: InputOptions(
          onMention: (String trigger, String value,
              void Function(String) onMentionClick) {
            // Here you would typically do a request to your backend
            // to get the correct results to show
            // according to the trigger and value
            return Future.delayed(
              const Duration(milliseconds: 500),
              () {
                return <Widget>[
                  ListTile(
                    leading: DefaultAvatar(user: user8),
                    title: Text(user8.getFullName()),
                    onTap: () {
                      onMentionClick(user8.getFullName());
                      mentions.add(
                        Mention(
                          title: trigger + user8.getFullName(),
                          customProperties: <String, dynamic>{
                            'userId': user8.id,
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: DefaultAvatar(user: user5),
                    title: Text(user5.getFullName()),
                    onTap: () {
                      onMentionClick(user5.getFullName());
                      mentions.add(
                        Mention(
                          title: trigger + user5.getFullName(),
                          customProperties: <String, dynamic>{
                            'userId': user5.id,
                          },
                        ),
                      );
                    },
                  )
                ];
              },
            );
          },
          onMentionTriggers: ['@', '#'],
        ),
      ),
    );
  }
}
