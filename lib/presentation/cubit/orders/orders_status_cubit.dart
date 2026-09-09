import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersStatusCubit extends Cubit<int> {
  OrdersStatusCubit() : super(0);

  void selectStatus(int index) {
    if (index != state) emit(index);
  }
}
