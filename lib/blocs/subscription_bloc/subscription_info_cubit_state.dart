
part of 'subscription_info_cubit.dart';




@immutable
abstract class SubscriptionInfoState {}

class SubscriptionInfoLoading extends SubscriptionInfoState {}

class SubscriptionInfoLoaded extends SubscriptionInfoState {
  final Subscription subscription;
  SubscriptionInfoLoaded(this.subscription);
}

class SubscriptionInfoEmpty extends SubscriptionInfoState {}

class SubscriptionInfoError extends SubscriptionInfoState {}



