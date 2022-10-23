
part of 'annunci_cubit.dart';



@immutable
abstract class AnnunciState {}

class AnnunciLoading extends AnnunciState {}

class AnnunciLoaded extends AnnunciState {
  final List<AnnunciEntity> Annunci;
  AnnunciLoaded(this.Annunci);
}

class AnnunciEmpty extends AnnunciState {}

class AnnunciError extends AnnunciState {}


class AnnunciPublishing extends AnnunciState {}
class AnnunciPublished extends AnnunciState {}
class AnnunciPublishingError extends AnnunciState {}


