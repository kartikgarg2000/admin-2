import 'package:agrishot_admin/Network/Repository/models/get_group_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../Network/Repository/get_groups_repository.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final GetGroupsRepository _repository;

  GroupCubit(this._repository) : super(GroupInitial());
  Future<void> fetchGroups() async {
    emit(GroupLoading());
    try {
      final response = await _repository.getGroups();
      emit(GroupResponse(response));
    } catch (e) {
      emit(GroupError(e.toString()));
    }
  }
}
