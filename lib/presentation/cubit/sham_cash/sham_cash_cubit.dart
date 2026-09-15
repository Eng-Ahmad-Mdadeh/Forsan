import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/helper/media_picker_helper.dart';
import 'package:forsan/presentation/cubit/sham_cash/sham_cash_state.dart';

class ShamCashCubit extends Cubit<ShamCashState> {
  ShamCashCubit({MediaPickerHelper? mediaPickerHelper})
      : _mediaPickerHelper = mediaPickerHelper ?? MediaPickerHelper(),
        super(const ShamCashState());

  final MediaPickerHelper _mediaPickerHelper;

  Future<void> pickReceipt(BuildContext context) async {
    final image = await _mediaPickerHelper.pickImage(context);
    if (image == null || isClosed) return;

    emit(state.copyWith(receiptImage: image));
  }

  void removeReceipt() {
    if (state.receiptImage == null) return;
    emit(state.copyWith(clearReceipt: true));
  }
}
