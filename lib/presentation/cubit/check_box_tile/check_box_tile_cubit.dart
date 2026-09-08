import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxTileCubit extends Cubit<Map<String, bool>> {
  CheckBoxTileCubit() : super(const {});

  void toggleCheckboxTile(String key, bool value) => emit({...state, key: value});
}
