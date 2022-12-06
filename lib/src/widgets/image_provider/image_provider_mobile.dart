import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

ImageProvider getImageProvider(String url) {
  if (url.startsWith('http')) {
    return CachedNetworkImageProvider(url);
  } else if (url.startsWith('assets')) {
    return AssetImage(url);
  } else {
    return FileImage(
      File(url),
    );
  }
}
