import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:secureshiksha_school/core/constants.dart';
import 'package:secureshiksha_school/core/error/failure.dart';
import 'package:secureshiksha_school/core/shared_objects.dart';

abstract class PostRequest {
  static Future<Either<Map<String, dynamic>, Failure>> request(
      String path, Map<String, dynamic> payload) async {
    try {
      String token = await secureStorage.getToken() ?? "";
      final request = await http.post(
        Uri.parse(serverUrl + path),
        headers: {
          "Authorization": token,
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          payload,
        ),
      );
      if (request.statusCode == 200) {
        return Left(
          jsonDecode(request.body),
        );
      } else {
        final mess = jsonDecode(
          request.body,
        ) as Map<String, dynamic>;
        return Right(
          Failure(
            mess["message"] as String,
          ),
        );
      }
    } catch (error) {
      return Right(
        Failure("Something went wrong!"),
      );
    }
  }
}
