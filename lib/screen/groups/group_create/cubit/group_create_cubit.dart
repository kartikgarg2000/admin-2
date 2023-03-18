import 'package:agrishot_admin/Theme/border.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'group_create_state.dart';

class GroupCreateCubit extends Cubit<GroupCreateState> {
  GroupCreateCubit() : super(GroupCreateState.intial());
  void groupUserTypeChanged(String value) {
    emit(state.copywith(
      groupUserType: value,
    ));
  }
}
