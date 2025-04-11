import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_event.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_state.dart';
import 'package:secureshiksha_school/core/http_requests/get_request.dart';
import 'package:secureshiksha_school/model/student_model.dart';

class GetStudentsListBloc
    extends Bloc<GetStudentsListEvent, GetStudentsListState> {
  GetStudentsListBloc() : super(InitialState()) {
    on<GetStudentsList>(
      (event, emit) async {
        emit(
          Loading(),
        );
        final result = await GetRequest.request(
          "getStudents/${event.stdDiv}",
        );

        result.fold(
          (l) {
            final List<StudentModel> list = [];
            for (var e in l) {
              list.add(StudentModel.fromJson(e));
            }

            emit(Successful(list));
          },
          (r) {
            emit(FailureState(r.message));
          },
        );
      },
    );
  }
}
