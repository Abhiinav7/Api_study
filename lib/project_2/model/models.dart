class NumberModel {
  String text;
  int number;
  bool found;
  String type;

  NumberModel({
    required this.text,
    required this.number,
    required this.found,
    required this.type,
  });

  factory NumberModel.fromJson(Map<String, dynamic> json) =>
      NumberModel(
        text: json["text"],
        number: json["number"],
        found: json["found"],
        type: json["type"],
      );
}
