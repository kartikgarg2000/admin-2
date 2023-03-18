part of 'group_cubit.dart';

@immutable
abstract class GroupState {}

class GroupInitial extends GroupState {}

class GroupLoading extends GroupState {}

class GroupError extends GroupState {
  String message;
  GroupError(this.message);
}

class GroupResponse extends GroupState {
  List<Datum> groupData;
  GroupResponse(this.groupData);
}
