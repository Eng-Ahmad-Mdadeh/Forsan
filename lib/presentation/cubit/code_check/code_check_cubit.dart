import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeCheckState extends Equatable {
  const CodeCheckState({
    this.phone = '',
    this.dialCode = '+966',
    this.rememberMe = false,
    this.type = 'sms',
    required this.endDate,
  });

  final String phone;
  final String dialCode;
  final bool rememberMe;
  final String type;
  final DateTime endDate;

  @override
  List<Object?> get props => [phone, dialCode, rememberMe, type, endDate];
}

class CodeCheckCubit extends Cubit<CodeCheckState> {
  CodeCheckCubit()
    : super(CodeCheckState(endDate: DateTime.now().add(const Duration(minutes: 2))));

  bool get done => !state.endDate.isAfter(DateTime.now());
  bool get lessThan5 => state.endDate.difference(DateTime.now()).inSeconds < 5;

  void setPhone(String phone) => emit(_copy(phone: phone));
  void setType(String type, String dialCode) => emit(_copy(type: type, dialCode: dialCode));
  void endTime() => emit(_copy(endDate: DateTime.now()));
  void resetTime() => emit(_copy(endDate: DateTime.now().add(const Duration(minutes: 2))));

  CodeCheckState _copy({String? phone, String? dialCode, String? type, DateTime? endDate}) =>
      CodeCheckState(
        phone: phone ?? state.phone,
        dialCode: dialCode ?? state.dialCode,
        rememberMe: state.rememberMe,
        type: type ?? state.type,
        endDate: endDate ?? state.endDate,
      );
}
