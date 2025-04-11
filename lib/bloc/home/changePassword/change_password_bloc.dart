import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/home/changePassword/change_password_event.dart';
import 'package:secureshiksha_school/bloc/home/changePassword/change_password_state.dart';
import 'package:secureshiksha_school/core/http_requests/post_request.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(InitialState()) {
    on<ChangePassword>(
      (event, emit) async {
        emit(
          Loading(),
        );
        final result = await PostRequest.request(
          "changePassword",
          {
            "newPassword": event.newPassword,
          },
        );
        result.fold(
          (l) {
            emit(
              Successful(),
            );
          },
          (r) {
            emit(
              FailureState(r.message),
            );
          },
        );
      },
    );
  }
}
