import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:examples/data.dart';
import 'package:flutter/material.dart';

class ThemeSample extends StatefulWidget {
  @override
  State<ThemeSample> createState() => ThemeSampleState();
}

class ThemeSampleState extends State<ThemeSample> {
  List<ChatMessage> messages = basicSample;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xff00ff9f),
          titleTextStyle: TextStyle(
            color: Color(0xff001eff),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Color(0xff001eff),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Theming Example'),
        ),
        body: Container(
          color: const Color(0xff001eff),
          child: DashChat(
            currentUser: user,
            onSend: (ChatMessage m) {
              setState(() {
                messages.insert(0, m);
              });
            },
            inputOptions: InputOptions(
              inputTextStyle: const TextStyle(
                color: Color(0xff001eff),
              ),
              inputDecoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: const Color(0xff00b8ff),
                contentPadding: const EdgeInsets.only(
                  left: 18,
                  top: 10,
                  bottom: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
            messages: messages,
            messageOptions: const MessageOptions(
              containerColor: Color(0xffd600ff),
              currentUserContainerColor: Color(0xffbd00ff),
              currentUserTextColor: Color(0xfffbf665),
              currentUserTimeTextColor: Color.fromRGBO(73, 0, 100, 1),
              messagePadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
              showTime: true,
              spaceWhenAvatarIsHidden: 6,
              textColor: Color(0xfffbf665),
              timeFontSize: 8,
              timePadding: EdgeInsets.only(top: 2),
              timeTextColor: Color.fromRGBO(73, 0, 100, 1),
            ),
            messageListOptions: MessageListOptions(
              dateSeparatorBuilder: (date) => DefaultDateSeparator(
                date: date,
                textStyle: const TextStyle(
                  color: Color(0xff00ff9f),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onLoadEarlier: () async {
                await Future.delayed(const Duration(seconds: 3));
              },
            ),
          ),
        ),
      ),
    );
  }
}
