part of 'group_create_cubit.dart';

enum CreateStatus { inital, submitting, sucess, error }

@immutable
class GroupCreateState {
  final String groupUserType;
  final String groupName;
  final String grouptype;
  final String moderator;
  final String message;
  final String trialPeriod;
  final String groupRules;
  const GroupCreateState(
      {required this.groupUserType,
      required this.groupName,
      required this.grouptype,
      required this.moderator,
      required this.message,
      required this.trialPeriod,
      required this.groupRules});
  factory GroupCreateState.intial() {
    return GroupCreateState(
        groupUserType: '',
        groupName: '',
        grouptype: '',
        moderator: '',
        message: '',
        trialPeriod: '',
        groupRules: '');
  }
  GroupCreateState copywith({
    String? groupUserType,
    String? groupName,
    String? grouptype,
    String? moderator,
    String? message,
    String? trialPeriod,
    String? groupRules,
  }) {
    return GroupCreateState(
        groupUserType: groupUserType ?? this.groupUserType,
        groupName: groupName ?? this.groupName,
        grouptype: grouptype ?? this.grouptype,
        moderator: moderator ?? this.moderator,
        message: message ?? this.message,
        trialPeriod: trialPeriod ?? this.trialPeriod,
        groupRules: groupRules ?? this.groupRules);
  }

  @override
  List<Object> get props => [
        groupUserType,
        groupName,
        grouptype,
        moderator,
        message,
        trialPeriod,
        groupRules,
      ];
}

// class GroupCreateInitial extends GroupCreateState {}
