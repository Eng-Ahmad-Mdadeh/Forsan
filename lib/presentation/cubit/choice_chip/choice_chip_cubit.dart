import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceChipItem extends Equatable {
  const ChoiceChipItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  List<Object?> get props => [label, value];
}

class ChoiceChipState extends Equatable {
  const ChoiceChipState({required this.items, this.selectedValue});

  final List<ChoiceChipItem> items;
  final String? selectedValue;

  @override
  List<Object?> get props => [items, selectedValue];
}

class ChoiceChipCubit extends Cubit<ChoiceChipState> {
  ChoiceChipCubit({required List<ChoiceChipItem> items, String? initialValue})
    : super(ChoiceChipState(items: items, selectedValue: initialValue));

  void selectItem(String value) =>
      emit(ChoiceChipState(items: state.items, selectedValue: value));
}
