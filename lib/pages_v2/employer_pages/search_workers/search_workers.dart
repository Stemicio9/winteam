import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/subscription_bloc/subscription_cubit.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/widget/search_workers_card.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_autocomplete.dart';
import 'package:winteam/utils/size_utils.dart';

class SearchWorkers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchWorkersState();
  }
}

class SearchWorkersState extends State<SearchWorkers> {
  UserListCubit get _userListCubit => context.read<UserListCubit>();

  SubscriptionCubit get _subscriptionCubit => context.read<SubscriptionCubit>();
  final TextEditingController filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userListCubit.searchUserFiltered('');
    _subscriptionCubit.cani("search");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(bottom: 30),
        child: Column(
          children: [
            AdsAutocomplete(
              paddingBottom: 30,
              filterController: filterController,
              optionSelected: onSelectedAutocomplete,
            ),
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder<UserListCubit, UserListState>(
                    builder: (_, userState) {
                      if (userState is UserListLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (userState is UserListLoaded) {
                        return BlocBuilder<SubscriptionCubit, SubscriptionState>(
                            builder: (_, state) {
                          if (state is SubscriptionLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is SubscriptionCanI) {
                            return Column(children: [
                              ...userState.users
                                  .map((e) => SearchWorkerCard(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            RouteConstants.candidateProfileChoose,
                                            arguments: {'isVisible': false, 'company': e});
                                      },
                                      user: e,
                                      skillIcon: 'assets/images/PizzaIcon.svg'))
                                  .toList()
                            ]);
                          } else if (state is SubscriptionCannotI) {
                            return Column(children: [
                              ...userState.users
                                  .map((e) => SearchWorkerCard(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            RouteConstants.candidateProfileChoose,
                                            arguments: {'isVisible': 'false', 'company': e});
                                      },
                                      user: e,
                                      skillIcon: 'assets/images/PizzaIcon.svg'))
                                  .toList()
                            ]);
                          } else {
                            return const Center(child: Text("Error"));
                          }
                        });
                      } else if (userState is UserListError) {
                        return const Center(child: Text("Error"));
                      } else {
                        return const Center(child: Text("Error"));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }

  void onSelectedAutocomplete(SkillEntity value) {
    print("Selected value ${value.name}");
  }
}
