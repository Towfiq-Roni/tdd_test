import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/core/status/state_status.dart';
import 'package:tdd_test/features/list/domain/entity/post_list_entity.dart';
import 'package:tdd_test/features/list/domain/usecase/get_post_list.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final GetPostList getPostList;

  ListBloc(this.getPostList) : super(const ListState()) {
    on<GetListEvent>(_getListEvent);
  }

  Future<void> _getListEvent(
      GetListEvent event, Emitter<ListState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));
    try {
      var getList = await getPostList();
      if (getList?.postList == null || getList!.postList!.isEmpty) {
        emit(state.copyWith(
            status: StateStatus.error, message: INVALID_MESSAGE));
      }
      emit(state.copyWith(
        postList: getList,
        status: StateStatus.loaded,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(status: StateStatus.error, message: INVALID_MESSAGE));
    }
  }
}

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_MESSAGE = 'Invalid Output';
