part of 'skill_cubit.dart';

@immutable
abstract class SkillState {}

class SkillListLoading extends SkillState {}

class SkillListLoaded extends SkillState {
  final List<SkillEntity> skillList;
  SkillListLoaded(this.skillList);
}

class SkillListEmpty extends SkillState {}

class SkillListError extends SkillState {}
