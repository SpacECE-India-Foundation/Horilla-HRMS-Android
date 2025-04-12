

import 'SubFaq.dart';

class FAQ {
  final String title;
  final String description;
  final List<SubFaq> subFaqList; // <-- Add this

  FAQ({
    required this.title,
    required this.description,
    required this.subFaqList,
  });
}
