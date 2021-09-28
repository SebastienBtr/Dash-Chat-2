part of dash_chat_2;

/// {@category Models}
class ChatMedia {
  ChatMedia({
    required this.url,
    required this.fileName,
    required this.type,
    this.isUploading = false,
    this.uploadedDate,
    this.customProperties,
  });

  /// URL of the media, can local (will use FileImage) or remote (will use NetworkImage)
  String url;

  /// Name of the file that will be shown in some cases
  String fileName;

  /// Type of media
  MediaType type;

  /// If the media is still uploading, usefull to add a visual feedback
  bool isUploading;

  /// Uploaded date of the media
  DateTime? uploadedDate;

  /// A list of custom properties to extend the existing ones
  /// in case you need to store more things.
  /// Can be useful to extend existing features
  Map<String, dynamic>? customProperties;
}

class MediaType {
  final String _value;
  const MediaType._internal(this._value);

  @override
  toString() => _value;

  static MediaType parse(String value) {
    switch (value) {
      case 'image':
        return MediaType.image;
      case 'video':
        return MediaType.video;
      case 'file':
        return MediaType.file;
      default:
        throw UnsupportedError('$value is not a valid MediaType');
    }
  }

  static const image = MediaType._internal('image');
  static const video = MediaType._internal('video');
  static const file = MediaType._internal('file');
}
