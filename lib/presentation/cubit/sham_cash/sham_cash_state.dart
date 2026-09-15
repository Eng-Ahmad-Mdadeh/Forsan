import 'package:equatable/equatable.dart';

class ShamCashState extends Equatable {
  const ShamCashState({this.receiptImage});

  final String? receiptImage;

  ShamCashState copyWith({String? receiptImage, bool clearReceipt = false}) {
    return ShamCashState(
      receiptImage: clearReceipt ? null : receiptImage ?? this.receiptImage,
    );
  }

  @override
  List<Object?> get props => [receiptImage];
}
