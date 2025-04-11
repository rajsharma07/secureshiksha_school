import 'package:flutter/widgets.dart';
import 'package:secureshiksha_school/core/http_requests/get_request.dart';

class NumberOfStudentsProvider extends ChangeNotifier {
  int _numberOfStudents = 0;

  int getNumberOfStudents() => _numberOfStudents;

  void refreashNumber() async {
    int temp = _numberOfStudents;
    _numberOfStudents = -1;
    notifyListeners();
    final result = await GetRequest.request("numberOfStudents");
    result.fold(
      (l) {
        _numberOfStudents = l["count"] ?? 0;
        notifyListeners();
      },
      (r) {
        _numberOfStudents = temp;
        notifyListeners();
      },
    );
  }
}
