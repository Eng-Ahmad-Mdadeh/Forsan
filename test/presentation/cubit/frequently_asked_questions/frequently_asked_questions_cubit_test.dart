import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/presentation/cubit/frequently_asked_questions/frequently_asked_questions_cubit.dart';

void main() {
  group('FrequentlyAskedQuestionsCubit', () {
    test('starts with the first question expanded', () {
      final cubit = FrequentlyAskedQuestionsCubit();

      expect(cubit.state, 0);

      cubit.close();
    });

    test('expands a question and collapses it when selected again', () {
      final cubit = FrequentlyAskedQuestionsCubit();

      cubit.toggleQuestion(2);
      expect(cubit.state, 2);

      cubit.toggleQuestion(2);
      expect(cubit.state, isNull);

      cubit.close();
    });
  });
}
