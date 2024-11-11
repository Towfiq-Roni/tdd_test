import 'package:equatable/equatable.dart';

class RefreshTokenRequest extends Equatable {
  final String? refreshToken;

  const RefreshTokenRequest({required this.refreshToken});

  Map<String, dynamic> toJson() {
    return {
      "token": refreshToken,
    };
  }

  @override
  List<Object?> get props => [
        refreshToken,
      ];
}
