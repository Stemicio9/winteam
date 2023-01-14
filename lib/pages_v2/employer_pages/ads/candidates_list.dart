import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_user_list/annunci_user_list_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/candidates_list_dialog.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/widget/search_workers_card.dart';
import 'package:winteam/utils/size_utils.dart';

class CandidatesList extends StatefulWidget {
  late bool isSelected;

  CandidatesList({this.isSelected = false});

  @override
  State<StatefulWidget> createState() {
    return CandidatesListState();
  }
}

class CandidatesListState extends State<CandidatesList> {
  AnnunciUserListCubit get _cubit => context.read<AnnunciUserListCubit>();
  late AnnunciEntity annuncio;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    annuncio = arguments['annuncio'];
    _cubit.listCandidati(annuncio.id ?? "");

    return W1nScaffold(
        appBar: 1,
        title: CANDIDATES_LIST,
        backgroundColor: lightGrey,
        body: SingleChildScrollView(
          child: Padding(
              padding: getPadding(bottom: 15, top: 35),
              child: BlocBuilder<AnnunciUserListCubit, AnnunciUserListState>(
                  builder: (_, state) {
                if (state is AnnunciUserListLoading) {
                  return const CircularProgressIndicator();
                } else if (state is AnnunciUserListError) {
                  return Container();
                } else if (state is AnnunciUserListLoaded) {
                  return Column(
                    children: [
                      ...state.utenti.map((e) => SearchWorkerCard(
                            isSelected: widget.isSelected,
                            view: () {
                              Navigator.pushNamed(context,
                                  RouteConstants.candidateProfileChoose,
                                  arguments: {'company': e});
                            },
                            choose: () {
                              showDialog(
                                  context: context,
                                  barrierColor: blackDialog,
                                  builder: (ctx) => CandidatesListDialog(
                                        cancelOnTap: () {
                                          Navigator.pop(context);
                                        },
                                        confirmOnTap: () {
                                          //todo chiamata api per match user in candidate list
                                          _cubit.matchUser(e.id ?? '', annuncio.id ?? '');
                                          widget.isSelected = true;
                                          Navigator.pop(context);
                                        },
                                      ));
                            },
                            isCandidatesList: true,
                            isSearch: false,
                            user: e,
                            skillIcon: '',
                          )),
                    ],
                  );
                } else {
                  return Container();
                }
              })),
        ));
  }
}
