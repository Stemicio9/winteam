
part of 'annunci_lavoratore_cubit.dart';

@immutable
abstract class AnnunciLavoratoreState {}

class AnnunciLavoratoreLoading extends AnnunciLavoratoreState {}
class AnnunciLavoratoreLoaded extends AnnunciLavoratoreState {
  final List<AnnunciEntity> annunci;
  AnnunciLavoratoreLoaded(this.annunci);
}

class AnnunciLavoratoreEmpty extends AnnunciLavoratoreState {}
class AnnunciLavoratoreError extends AnnunciLavoratoreState {}

class AnnunciLavoratoreReloadAll extends AnnunciLavoratoreState {}
