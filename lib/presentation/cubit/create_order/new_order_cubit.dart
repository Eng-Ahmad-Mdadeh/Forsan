import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  NewOrderCubit() : super(const NewOrderState());

  static const int lastStep = 2;

  void changeStep(int step) {
    if (step < 0 || step > lastStep || step == state.currentStep) return;

    emit(state.copyWith(currentStep: step));
  }

  void selectEstablishmentType(String type) {
    if (type == state.establishmentType) return;

    emit(state.copyWith(establishmentType: type));
  }
}
