import 'package:equatable/equatable.dart';

class BankTransferState extends Equatable {
  const BankTransferState({this.receiptImage});

  final String? receiptImage;

  BankTransferState copyWith({String? receiptImage, bool clearReceipt = false}) {
    return BankTransferState(
      receiptImage: clearReceipt ? null : receiptImage ?? this.receiptImage,
    );
  }

  @override
  List<Object?> get props => [receiptImage];
}
