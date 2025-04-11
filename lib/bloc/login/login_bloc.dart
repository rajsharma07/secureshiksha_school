import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/login/login_event.dart';
import 'package:secureshiksha_school/bloc/login/login_sate.dart';
import 'package:secureshiksha_school/core/constants.dart';
import 'package:secureshiksha_school/core/http_requests/post_request.dart';
import '../../core/shared_objects.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(UninitilizedState()) {
    on<Login>(
      (event, emit) async {
        emit(
          LoadingState(),
        );
        final result = await PostRequest.request(
          "login",
          {
            "schoolId": event.id,
            "passcode": event.password,
          },
        );
        Map<String, dynamic>? m;
        result.fold(
          (l) {
            m = l;
          },
          (r) => emit(
            FailureState(
              r.message ?? "",
            ),
          ),
        );
        if (m != null) {
          await secureStorage
              .addToken(
            m![tokenKey] ?? "",
          )
              .whenComplete(
            () {
              emit(
                LoggedInState(),
              );
            },
          );
        }
      },
    );
    on<LogOut>(
      (event, emit) async {
        await secureStorage.removeToken();
        emit(
          LoggedOutState(),
        );
      },
    );
    on<InitializeEvent>(
      (event, emit) async {
        emit(
          LoadingState(),
        );
        final String? token = await secureStorage.getToken();
        if (token == null) {
          emit(
            LoggedOutState(),
          );
        } else {
          emit(
            LoggedInState(),
          );
        }
      },
    );
  }
}
