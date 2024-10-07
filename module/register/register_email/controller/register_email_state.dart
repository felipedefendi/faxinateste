// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_email_controller.dart';

enum RegisterEmailStatus { initial, loading, complete, failure }

class RegisterEmailState extends Equatable {
  final RegisterEmailStatus status;
  final String? errorMessage;
  const RegisterEmailState._({
    required this.status,
    this.errorMessage,
  });

  const RegisterEmailState.initial()
      : this._(
          status: RegisterEmailStatus.initial,
        );

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];

  RegisterEmailState copyWith({
    RegisterEmailStatus? status,
    String? errorMessage,
  }) {
    return RegisterEmailState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
