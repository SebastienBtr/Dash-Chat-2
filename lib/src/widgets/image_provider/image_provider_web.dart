import 'package:flutter/material.dart';

ImageProvider getImageProvider(String url) {
  if (url.startsWith('http')) {
    return NetworkImage(url);
  } else {
    return const AssetImage(
      'assets/placeholder.png',
      package: 'dash_chat_2',
    );
  }
}
