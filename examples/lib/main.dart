import 'package:dash_chat/dash_chat_library.dart';
import 'package:examples/basic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ChatUser user1;
  late ChatUser user2;
  late ChatUser user3;
  late List<ChatMessage> messages;

  @override
  void initState() {
    user1 = ChatUser(id: '1');
    user2 = ChatUser(id: '2');
    user3 = ChatUser(id: '3', firstName: 'Toto', lastName: 'Clark');
    messages = <ChatMessage>[
      ChatMessage(
        text: 'How you doin?',
        user: user3,
        createdAt: DateTime.now(),
        quickReplies: <QuickReply>[
          QuickReply(title: 'Great!'),
          QuickReply(title: 'Awesome'),
        ],
      ),
      ChatMessage(
        medias: <ChatMedia>[
          ChatMedia(
            url:
                'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
            type: MediaType.image,
            fileName: 'image.png',
          ),
          ChatMedia(
            url:
                'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
            type: MediaType.image,
            fileName: 'image.png',
          ),
          ChatMedia(
            url:
                'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/chat_medias%2F2GFlPkj94hKCqonpEdf1%2F20210526_162318.mp4?alt=media&token=01b814b9-d93a-4bf1-8be1-cf9a49058f97',
            type: MediaType.video,
            fileName: 'video.mp4',
            isUploading: false,
          ),
          ChatMedia(
            url:
                'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
            type: MediaType.file,
            fileName: 'image.png',
          ),
          ChatMedia(
            url:
                'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
            type: MediaType.image,
            fileName: 'image.png',
          )
        ],
        user: user3,
        createdAt: DateTime.now(),
      ),
      ChatMessage(
        text: 'Did you see the news?',
        user: user3,
        createdAt: DateTime(2021, 01, 30, 15, 34),
      ),
      ChatMessage(
        text: "Oh what's up guys?",
        user: user3,
        createdAt: DateTime(2021, 01, 30, 14, 34),
      ),
      ChatMessage(
        text: 'How you doin?',
        user: user1,
        createdAt: DateTime(2021, 01, 29, 18, 34),
      ),
      ChatMessage(
        text: 'Hey!',
        user: user2,
        createdAt: DateTime.now(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dash Chat Demo'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => push(Basic()),
            child: const Text('Basic example'),
          ),
        ],
      ),
    );
  }

  void push(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }
}


// DashChat(
//         currentUser: user1,
//         onSend: (ChatMessage m) {
//           setState(() {
//             messages.insert(0, m);
//           });
//         },
//         messages: messages,
//         typingUsers: <ChatUser>[user3],
//         messageOptions: const MessageOptions(showTime: true),
//         messageListOptions: MessageListOptions(
//           loadEarlierBuilder: Center(
//             child: ElevatedButton(
//               onPressed: () {},
//               child: const Text('toto'),
//             ),
//           ),
//           separatorFrequency: SeparatorFrequency.hours
//         ),
//         quickReplyOptions: QuickReplyOptions(onTapQuickReply: (QuickReply r) {
//           final ChatMessage m = ChatMessage(
//             user: user1,
//             text: r.value ?? r.title,
//             createdAt: DateTime.now(),
//           );
//           setState(() {
//             messages.insert(0, m);
//           });
//         }),
//       ),