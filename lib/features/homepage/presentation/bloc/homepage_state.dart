part of 'homepage_bloc.dart';

class HomepageState extends Equatable {
  final StateStatus status;
  final int? itemValue;

  const HomepageState({
    this.status = StateStatus.initial,
    this.itemValue,
  });

  HomepageState copyWith({
    StateStatus? status,
    int? itemValue,
  }) {
    return HomepageState(
      status: status ?? this.status,
      itemValue: itemValue ?? this.itemValue,
    );
  }

  @override
  List<Object?> get props => [
        status,
        itemValue,
      ];
}
