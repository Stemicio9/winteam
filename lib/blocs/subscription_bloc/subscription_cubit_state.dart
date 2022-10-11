
part of 'subscription_cubit.dart';



@immutable
abstract class SubscriptionState {}

class SubscriptionLoading extends SubscriptionState {}

class SubscriptionLoaded extends SubscriptionState {
  final Subscription subscription;
  SubscriptionLoaded(this.subscription);
}

class SubscriptionEmpty extends SubscriptionState {}

class SubscriptionError extends SubscriptionState {}


class SubscriptionCanI extends SubscriptionState {}
class SubscriptionCannotI extends SubscriptionState {}
