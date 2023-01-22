part of 'annunci_cubit.dart';

@immutable
abstract class AnnunciState {}

class AnnunciLoading extends AnnunciState {}

class AnnunciLoaded extends AnnunciState {
  final List<AnnunciEntity> annunci;
  final bool loadingMore;
  final int currentPageNumber;

  AnnunciLoaded(
      {this.annunci = const [],
      this.loadingMore = false,
      this.currentPageNumber = 0});

  AnnunciLoaded copyWith(
      {List<AnnunciEntity>? annunci,
      bool? loadingMore,
      int? currentPageNumber}) {
    return AnnunciLoaded(
      annunci: annunci ?? this.annunci,
      loadingMore: loadingMore ?? this.loadingMore,
      currentPageNumber: currentPageNumber ?? this.currentPageNumber,
    );
  }
}

class AnnunciEmpty extends AnnunciState {}

class AnnunciError extends AnnunciState {}

class AnnunciPublishing extends AnnunciState {}

class AnnunciPublished extends AnnunciState {}

class AnnunciPublishingError extends AnnunciState {}
