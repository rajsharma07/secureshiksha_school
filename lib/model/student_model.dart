class StudentModel {
  final String fullName;
  final String rollNumber;
  final String email;
  final bool currentStatus;
  final String address;

  StudentModel(
      {required this.fullName,
      required this.rollNumber,
      required this.email,
      required this.currentStatus,
      required this.address});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      fullName: json['full_name'],
      rollNumber: json['roll_number'],
      email: json['email'],
      currentStatus: json['current_status'] == 1,
      address:
          "${json['address']}, ${json['landmark']}, ${json['district']}, ${json['city']}, ${json['state']}",
    );
  }
}
