class ListComponentModel {
  final String title;
  final String? imageUrl;

  ListComponentModel({
    required this.title,
    this.imageUrl,
  });

  factory ListComponentModel.fromStep(
    Map<String, dynamic> content,
    Map<String, String>? assets,
  ) {
    const locale = 'en';
    return ListComponentModel(
      title: content[locale]?['text1'] ?? '',
      imageUrl: assets?['image1'],
    );
  }
}
