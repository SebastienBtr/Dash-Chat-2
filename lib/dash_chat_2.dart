library dash_chat_2;

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart' as vp;

import 'src/widgets/image_provider/image_provider.dart';

export 'package:flutter_parsed_text/flutter_parsed_text.dart';

part 'src/dash_chat.dart';
part 'src/models/chat_media.dart';
part 'src/models/chat_message.dart';
part 'src/models/chat_user.dart';
part 'src/models/cursor_style.dart';
part 'src/models/input_options.dart';
part 'src/models/mention.dart';
part 'src/models/message_list_options.dart';
part 'src/models/message_options.dart';
part 'src/models/quick_reply.dart';
part 'src/models/quick_reply_options.dart';
part 'src/models/scroll_to_bottom_options.dart';
part 'src/widgets/input_toolbar/default_input_decoration.dart';
part 'src/widgets/input_toolbar/default_send_button.dart';
part 'src/widgets/input_toolbar/input_toolbar.dart';
part 'src/widgets/message_list/default_date_separator.dart';
part 'src/widgets/message_list/default_scroll_to_bottom.dart';
part 'src/widgets/message_list/message_list.dart';
part 'src/widgets/message_row/default_avatar.dart';
part 'src/widgets/message_row/default_message_decoration.dart';
part 'src/widgets/message_row/default_message_text.dart';
part 'src/widgets/message_row/default_parse_patterns.dart';
part 'src/widgets/message_row/default_user_name.dart';
part 'src/widgets/message_row/media_container.dart';
part 'src/widgets/message_row/message_row.dart';
part 'src/widgets/message_row/text_container.dart';
part 'src/widgets/message_row/video_player.dart';
part 'src/widgets/quick_replies/default_quick_reply.dart';
part 'src/widgets/quick_replies/quick_replies.dart';
part 'src/widgets/typing_users/default_typing_builder.dart';
part 'src/widgets/typing_users/typing_indicator.dart';
