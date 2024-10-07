// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_code_controller.dart';

enum RegisterCodeStatus { initial, loading, failure, complete }

class RegisterCodeState extends Equatable {
  final RegisterCodeStatus status;
  final String? errorMessage;

  const RegisterCodeState._({
    required this.status,
    this.errorMessage,
  });

  const RegisterCodeState.initial()
      : this._(status: RegisterCodeStatus.initial);

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];

  RegisterCodeState copyWith({
    RegisterCodeStatus? status,
    String? errorMessage,
  }) {
    return RegisterCodeState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
