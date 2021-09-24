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
  final String url;

  /// Name of the file that will be shown in some cases
  final String fileName;

  /// Type of media
  final MediaType type;

  /// If the media is still uploading, usefull to add a visual feedback
  final bool isUploading;

  /// Uploaded date of the media
  /// You can use DefaultTypingBuilder to only override some variables
  final DateTime? uploadedDate;

  /// A list of custom properties to extend the existing ones
  /// in case you need to store more things.
  /// Can be useful to extend existing features
  final Map<String, dynamic>? customProperties;
}

enum MediaType { image, video, file }
