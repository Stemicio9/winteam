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
                  var matched = state.utenti.where((element) => element.id == annuncio.matchedUserId).toList();


                  return Column(
                    children: [
                      Visibility(
                        visible: matched.isNotEmpty,
                        child: SearchWorkerCard(
                          isSelected: widget.isSelected,
                          view: () {
                            Navigator.pushNamed(context,
                                RouteConstants.candidateProfileChoose,
                                arguments: {'company': matched[0], 'isVisible': "false"});
                          },
                          choose: () {
                          },
                          isChoosenUser: true,
                          isCandidatesList: false,
                          isSearch: false,
                          user: matched[0],
                          skillIcon: '',
                        ),
                      ),
                      Visibility(
                        visible: matched.isNotEmpty && state.utenti.length > 1,
                        child: Padding(
                          padding: getPadding(top: 5, bottom: 5),
                          child: Text(
                            getCurrentLanguageValue(OTHER_CANDIDATES)!,
                            style: TextStyle(
                                color: darkGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      ...state.utenti.map((e) => Visibility(
                        visible: e.id != annuncio.matchedUserId,
                        child: SearchWorkerCard(
                              isSelected: matched.isNotEmpty,
                              view: () {
                                String isVisible = matched.isNotEmpty ? "false" : "true";
                                Navigator.pushNamed(context,
                                    RouteConstants.candidateProfileChoose,
                                    arguments: {'company': e, 'isVisible': isVisible});
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
                            ),
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
