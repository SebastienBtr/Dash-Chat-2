import 'package:dash_chat/dash_chat_library.dart';

// We have all the possibilities for users
ChatUser user = ChatUser(id: '0');
ChatUser user1 = ChatUser(id: '1');
ChatUser user2 = ChatUser(id: '2', firstName: 'Toto Clark');
ChatUser user3 = ChatUser(id: '3', lastName: 'Clark');
ChatUser user4 = ChatUser(id: '4', profileImage: 'Clark');
ChatUser user5 = ChatUser(id: '5', firstName: 'Charles', lastName: 'Leclerc');
ChatUser user6 = ChatUser(id: '6', firstName: 'Max', profileImage: 'Vestappen');
ChatUser user7 = ChatUser(id: '7', lastName: 'Toto', profileImage: 'Clark');
ChatUser user8 = ChatUser(
    id: '8', firstName: 'Toto', lastName: 'Toto', profileImage: 'Clark');

List<ChatMessage> basicSample = <ChatMessage>[
  ChatMessage(
    text: "Oh what's up guys?",
    user: user2,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'How you doin?',
    user: user1,
    createdAt: DateTime(2021, 01, 30, 16, 34),
  ),
  ChatMessage(
    text: 'Hey!',
    user: user,
    createdAt: DateTime(2021, 01, 30, 15, 50),
  ),
];
