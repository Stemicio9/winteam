

part of 'annunci_user_list_cubit.dart';

@immutable
abstract class AnnunciUserListState {}

class AnnunciUserListLoading extends AnnunciUserListState {}
class AnnunciUserListLoaded extends AnnunciUserListState {
  final List<UserEntity> utenti;
  AnnunciUserListLoaded(this.utenti);
}
class AnnunciUserListError extends AnnunciUserListState {}

class AnnunciListReloadAll extends AnnunciUserListState {}
