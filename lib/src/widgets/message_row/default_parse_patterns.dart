part of dash_chat_2;

@Deprecated('Use defaultParsePatterns instead')
List<MatchText> defaultPersePatterns = defaultParsePatterns;

/// {@category Default widgets}
List<MatchText> defaultParsePatterns = <MatchText>[
  MatchText(
    type: ParsedType.EMAIL,
    style: const TextStyle(
      decoration: TextDecoration.underline,
    ),
    onTap: (String email) {
      String url = 'mailto:$email';
      openLink(url);
    },
  ),
  MatchText(
    type: ParsedType.URL,
    style: const TextStyle(
      decoration: TextDecoration.underline,
    ),
    onTap: (String url) {
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        url = 'http://$url';
      }
      openLink(url);
    },
  ),
  MatchText(
    type: ParsedType.PHONE,
    style: const TextStyle(
      decoration: TextDecoration.underline,
    ),
    onTap: (String phone) {
      String url = 'tel:$phone';
      openLink(url);
    },
  ),
];
