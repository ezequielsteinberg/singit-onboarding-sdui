class EnglishJourneyModel {
  final String title;
  final String description;
  final String graphTitle;
  final String label1;
  final String label2;
  final String label3;
  final String xAxisStart;
  final String xAxisEnd;

  EnglishJourneyModel({
    required this.title,
    required this.description,
    required this.graphTitle,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.xAxisStart,
    required this.xAxisEnd,
  });

  factory EnglishJourneyModel.fromMap(Map<String, dynamic> map) {
    return EnglishJourneyModel(
      title: map['text1'] ?? '',
      description: map['text2'] ?? '',
      graphTitle: map['text3'] ?? 'English journey',
      label1: map['text4'] ?? '',
      label2: map['text5'] ?? '',
      label3: map['text6'] ?? '',
      xAxisStart: map['text7'] ?? 'Now',
      xAxisEnd: map['text8'] ?? '27 days',
    );
  }
}
