import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';
import 'package:winteam/blocs/subscription_bloc/subscription_cubit.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/enums.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/widget/search_workers_card.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_autocomplete.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

import 'widget/cannot_search_workers.dart';

class SearchWorkers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchWorkersState();
  }
}

class SearchWorkersState extends State<SearchWorkers> {
  UserListCubit get _userListCubit => context.read<UserListCubit>();

  SkillCubit get _skillCubit => context.read<SkillCubit>();

  SubscriptionCubit get _subscriptionCubit => context.read<SubscriptionCubit>();

  final TextEditingController filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userListCubit.searchUserFiltered('');
    _subscriptionCubit.cani(SubscriptionRequests.search.name);
    _skillCubit.getSkillList();
    //tutte le mansioni e tutte le aziende, arrivano e le formatto come <type, image, name>
    //se clicco su una qualsiasi voce dell'autocomplete, mentre la clicco al click effettuo una chiamata che mi permette di ottenere tutti gli utenti con quella mansione
    //se il tipo di tile cliccata è una tile di tipo mansione, altrimenti se è una tile di tipo azienda allora devo fare una chiamata che mi permette di ottenere tutti
    // gli utenti con quella annunci di quella azienda
    //TODO in questo punto, essendo datore, non serve l'azienda perché sto cercando utenti ma solo poter cercare attraverso la mansione
    //TODO quando sono un lavoratore e cerco gli annunci di lavoro potrei cercare gli annunci di lavoro di una certa azienda o di una certa mansione
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(bottom: 30),
        child: Column(
          children: [
            BlocBuilder<SkillCubit, SkillState>(builder: (_, state) {
              if (state is SkillListLoading) {
                return loadingGif();
              } else if (state is SkillListLoaded) {
                return AdsAutocomplete(
                  paddingBottom: 30,
                  filterController: filterController,
                  optionSelected: onSelectedAutocomplete,
                  onFieldSubmitted: onSubmittedAutocomplete,
                  type: AutocompleteSearchType.userSearch,
                  kOptions: state.skillList,
                );
              } else {
                //Todo
                return Container();
              }
            }),
            Expanded(
              child: ListView(
                children: [
                  BlocBuilder<UserListCubit, UserListState>(
                    builder: (_, userState) {
                      if (userState is UserListLoading) {
                        return Center(child: loadingGif());
                      } else if (userState is UserListLoaded) {
                        return BlocBuilder<SubscriptionCubit,
                            SubscriptionState>(builder: (_, state) {
                          if (state is SubscriptionLoading) {
                            return Center(child: loadingGif());
                          } else if (state is SubscriptionCanI) {
                            return Column(children: [
                              ...userState.users
                                  .map((e) => SearchWorkerCard(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context,
                                            RouteConstants.candidateProfileChoose,
                                            arguments: {
                                              'isVisible': false,
                                              'company': e
                                            });
                                      },
                                      user: e,
                                      skillIcon: 'assets/images/PizzaIcon.svg'))
                                  .toList()
                            ]);
                          } else if (state is SubscriptionCannotI) {
                            return Column(children: [
                              CannotSearchWorkersWidget(),
                              ...userState.users
                                  .map((e) => SearchWorkerCard(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context,
                                            RouteConstants.candidateProfileChoose,
                                            arguments: {
                                              'isVisible': 'false',
                                              'company': e
                                            });
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
        ));
  }

  void onSelectedAutocomplete(SkillEntity value) {
    print("Selected value ${value.name}");
  }

  onSubmittedAutocomplete(String skillSelected) {
    _userListCubit.searchUserFiltered(skillSelected);
  }
}
