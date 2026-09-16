import 'package:flutter_bloc/flutter_bloc.dart';

class FrequentlyAskedQuestionsCubit extends Cubit<int?> {
  FrequentlyAskedQuestionsCubit() : super(0);

  void toggleQuestion(int index) => emit(state == index ? null : index);
}
