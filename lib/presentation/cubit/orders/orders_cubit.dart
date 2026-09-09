import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<int> {
  OrdersCubit() : super(0);

  void selectStatus(int index) {
    if (index == state) return;

    emit(index);
  }
}
