class Esp32Model {
  String id;
  DateTime dateOfIssue;
  Esp32Model({
    required this.id,
    required this.dateOfIssue,
  });

  factory Esp32Model.fromJson(Map<String, dynamic> json) {
    return Esp32Model(
      id: json['esp32_id'],
      dateOfIssue: DateTime.parse(json['date_of_issue']),
    );
  }
}
