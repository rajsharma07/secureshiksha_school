import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:secureshiksha_school/core/constants.dart';
import 'package:secureshiksha_school/core/error/failure.dart';
import 'package:http/http.dart' as http;
import 'package:secureshiksha_school/core/shared_objects.dart';

abstract class GetRequest {
  static Future<Either<dynamic, Failure>> request(String path) async {
    try {
      String token = await secureStorage.getToken() ?? "";
      final response = await http.get(
        Uri.parse(serverUrl + path),
        headers: {"Authorization": token, "Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        return Left(
          jsonDecode(
            response.body,
          ),
        );
      } else {
        return Right(
          Failure(
            jsonDecode(response.body)["message"],
          ),
        );
      }
    } catch (error) {
      return Right(Failure("Something went wrong!"));
    }
  }
}
