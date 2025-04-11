import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/home/profile/profile_event.dart';
import 'package:secureshiksha_school/bloc/home/profile/profile_state.dart';
import 'package:secureshiksha_school/core/http_requests/get_request.dart';
import 'package:secureshiksha_school/model/esp32_model.dart';
import 'package:secureshiksha_school/model/school_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(InitialState()) {
    on<GetProfile>(
      (event, emit) async {
        emit(Loading());
        final result = await GetRequest.request("getProfile");
        final esp32Res = await GetRequest.request("getEsp32Data");
        List<Esp32Model> esp32List = [];
        esp32Res.fold(
          (l) {
            List list = l;
            for (var i in list) {
              esp32List.add(Esp32Model.fromJson(i));
            }
          },
          (r) {},
        );
        result.fold(
          (l) {
            emit(Successful(
              SchoolModel.fromJson(l, esp32List),
            ));
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
