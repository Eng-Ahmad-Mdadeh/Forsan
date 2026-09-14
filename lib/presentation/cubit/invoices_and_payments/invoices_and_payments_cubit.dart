import 'package:flutter_bloc/flutter_bloc.dart';

class InvoicesAndPaymentsCubit extends Cubit<int> {
  InvoicesAndPaymentsCubit() : super(0);

  void selectTab(int index) {
    if (index == state) return;

    emit(index);
  }
}
