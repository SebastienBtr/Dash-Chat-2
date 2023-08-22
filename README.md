<p align="center">
  <img src="https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/DashChat.png?alt=media&token=b1adb9b0-c601-4a33-89b7-2cb722647401" width="200"/>
  <h3 align="center">The most complete Chat UI for flutter</h3>
  <p align="center">
      Easy to use, highly customizable and fully featured
  </p>
</p>

<p align="center">
  <a href="https://github.com/SebastienBtr/Dash-Chat-2/blob/main/LICENSE">
    <img alt="License" src="https://img.shields.io/github/license/SebastienBtr/Dash-Chat-2?label=License" />
  </a>
  <a href="https://pub.dev/packages/dash_chat_2">
    <img alt="Pub version" src="https://img.shields.io/pub/v/dash_chat_2?color=blue" />
  </a>
  <a href="#contributors">
    <img alt="Contributors" src="https://img.shields.io/github/all-contributors/SebastienBtr/Dash-Chat-2/main" />
  </a>
</p>

<p align="center">
  <img src="https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/Screenshot1.png?alt=media&token=b77546dc-8fea-4aab-ac1b-3de5a2a90654" width="200"/>
  <img src="https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/Screenshot2.png?alt=media&token=2bf2ac8e-cb6e-44e7-876d-8c6a7959819e" width="200"/>
</p>

<h1></h1>

## Features

- Fully customizable components
- Multi-line TextInput
- Touchable links using [flutter_parsed_text](https://pub.dev/packages/flutter_parsed_text)
- Avatar as user's initials or profile picture
- Quick Reply messages
- Load earlier messages
- Scroll to bottom Widget
- Multiple media support (Audio support: WIP)
- @ Mention users (or anything else)
- Typing users
- Reply to messages - WIP
- Message status - WIP

You need another feature? you can use the `customProperties` field of the models, it allows you to pass other data to the library that you can then use inside custom builders to implement any feature you need.

Of course, if you think this feature can be useful to other people, feel free to open an issue/pull-request to discuss including it "natively" in the package.

## Basic Usage

```dart
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class Basic extends StatefulWidget {
  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  ChatUser user = ChatUser(
    id: '1',
    firstName: 'Charles',
    lastName: 'Leclerc',
  );

  List<ChatMessage> messages = <ChatMessage>[
    ChatMessage(
      text: 'Hey!',
      user: user,
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic example'),
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
```

You can run the [example](example) project to see more complex ways of using the package

## Parameters of DashChat

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;"><a href="https://pub.dev/documentation/dash_chat_2/latest/dash_chat_2/ChatUser-class.html">ChatUser</a> currentUser</span> - <span style="color:#FF3F3F">required</span>: Basically "you", we need to know who is the current user to put their messages to right side

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;">Function(<a href="https://pub.dev/documentation/dash_chat_2/latest/dash_chat_2/ChatMessage-class.html">ChatMessage</a> message) onSend</span> - <span style="color:#FF3F3F">required</span>: Function to call when the user sends a message, that's where you handle the logic to send the message to your backend and append the list of `messages`

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;">List<<a href="https://pub.dev/documentation/dash_chat_2/latest/dash_chat_2/ChatMessage-class.html">ChatMessage</a>> messages</span> - <span style="color:#FF3F3F">required</span>: The list of messages of the channel, you would usually not load all the messages at once but use the `onLoadEarlier` param of `MessageListOptions` to trigger a lazy loading

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;"><a href="https://pub.dev/documentation/dash_chat_2/latest/dash_chat_2/InputOptions-class.html">InputOptions</a> inputOptions</span> - <span style="color:#FFB23F">optional</span>: Options to customize the behaviour and design of the chat input

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;"><a href="https://pub.dev/documentation/dash_chat_2/latest/dash_chat_2/MessageOptions-class.html">MessageOptions</a> messageOptions</span> - <span style="color:#FFB23F">optional</span>: Options to customize the behaviour and design of the messages

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;"><a href="https://pub.dev/documentation/dash_chat_2/latest/dash_chat_2/MessageListOptions-class.html">MessageListOptions</a> messageListOptions</span> - <span style="color:#FFB23F">optional</span>: Options to customize the behaviour and design of the overall list of message

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;"><a href="https://pub.dev/documentation/dash_chat_2/latest/dash_chat_2/QuickReplyOptions-class.html">QuickReplyOptions</a> quickReplyOptions</span> - <span style="color:#FFB23F">optional</span>: Options to customize the behaviour and design of the quick replies

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;"><a href="https://pub.dev/documentation/dash_chat_2/latest/dash_chat_2/ScrollToBottomOptions-class.html">ScrollToBottomOptions</a> scrollToBottomOptions</span> - <span style="color:#FFB23F">optional</span>: Options to customize the behaviour and design of the scroll-to-bottom button

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;">readOnly</span> - <span style="color:#FFB23F">optional</span> (default to false): Option to make the chat read only, it will hide the input field

- <span style="color:#24292E; background-color:#F3F4F4; padding: .2em .4em;; border-radius: 6px;">List<<a href="https://pub.dev/documentation/dash_chat_2/latest/dash_chat_2/ChatUser-class.html">ChatUser</a>> typingUsers</span> - <span style="color:#FFB23F">optional</span>: List of users currently typing in the chat

## Full documentation

You can browse the full Dart documentation here: [Documentation](https://pub.dev/documentation/dash_chat_2/latest/)

## Found this project useful?

If you found this project useful, then please consider giving it a ⭐️ on Github: [https://github.com/SebastienBtr/Dash-Chat-2](https://github.com/SebastienBtr/Dash-Chat-2)

## Issues and feedback

If you have any suggestions for including a feature or if something doesn't work, feel free to open a Github [issue](https://github.com/SebastienBtr/Dash-Chat-2/issues) or to open a [pull request](https://github.com/SebastienBtr/Dash-Chat-2/pulls), you are more than welcome to contribute!

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/SebastienBtr"><img src="https://avatars.githubusercontent.com/u/18089010?v=4?s=100" width="100px;" alt="SebastienBtr"/><br /><sub><b>SebastienBtr</b></sub></a><br /><a href="https://github.com/SebastienBtr/Dash-Chat-2/commits?author=SebastienBtr" title="Code">💻</a> <a href="#design-SebastienBtr" title="Design">🎨</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/chuusungmin"><img src="https://avatars.githubusercontent.com/u/17997403?v=4?s=100" width="100px;" alt="chuusungmin"/><br /><sub><b>chuusungmin</b></sub></a><br /><a href="https://github.com/SebastienBtr/Dash-Chat-2/commits?author=chuusungmin" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/fufesou"><img src="https://avatars.githubusercontent.com/u/13586388?v=4?s=100" width="100px;" alt="fufesou"/><br /><sub><b>fufesou</b></sub></a><br /><a href="https://github.com/SebastienBtr/Dash-Chat-2/commits?author=fufesou" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/farmery"><img src="https://avatars.githubusercontent.com/u/56759256?v=4?s=100" width="100px;" alt="Nwachi ifeanyichukwu Victor"/><br /><sub><b>Nwachi ifeanyichukwu Victor</b></sub></a><br /><a href="https://github.com/SebastienBtr/Dash-Chat-2/commits?author=farmery" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/kaedeee"><img src="https://avatars.githubusercontent.com/u/55743370?v=4?s=100" width="100px;" alt="Kaede Games"/><br /><sub><b>Kaede Games</b></sub></a><br /><a href="https://github.com/SebastienBtr/Dash-Chat-2/commits?author=kaedeee" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/derekpitts28"><img src="https://avatars.githubusercontent.com/u/83979577?v=4?s=100" width="100px;" alt="Derek Pitts"/><br /><sub><b>Derek Pitts</b></sub></a><br /><a href="https://github.com/SebastienBtr/Dash-Chat-2/commits?author=derekpitts28" title="Code">💻</a></td>
    </tr>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/LegendAF"><img src="https://avatars.githubusercontent.com/u/825344?v=4?s=100" width="100px;" alt="Alex Fernandez"/><br /><sub><b>Alex Fernandez</b></sub></a><br /><a href="https://github.com/SebastienBtr/Dash-Chat-2/commits?author=LegendAF" title="Code">💻</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

## Credits

Thanks to [Fayeed](https://github.com/fayeed) who created the v1 of this package: [https://github.com/fayeed/dash_chat](https://github.com/fayeed/dash_chat) and made that possible!
