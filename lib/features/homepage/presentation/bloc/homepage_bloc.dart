import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/core/status/state_status.dart';
import 'package:tdd_test/res/routes/route_paths.dart';
import 'package:tdd_test/services/navigation/navigation_service.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(const HomepageState()) {
    on<GetItemValueEvent>(_getItemValue);
    on<NavigateEvent>(_navigate);
  }

  void _getItemValue(GetItemValueEvent event, Emitter<HomepageState> emit) {
    emit(state.copyWith(itemValue: event.itemValue));
    add(NavigateEvent());
  }

  Future<void> _navigate(
      NavigateEvent event, Emitter<HomepageState> emit) async {
    NavigationService.navigateTo(RoutePaths.listScreen);
  }
}
