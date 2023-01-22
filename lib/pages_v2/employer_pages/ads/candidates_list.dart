import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_user_list/annunci_user_list_cubit.dart';
import 'package:winteam/blocs/annuncio_detail.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/candidates_list_dialog.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/widget/search_workers_card.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

class CandidatesList extends StatefulWidget {


  const CandidatesList();

  @override
  State<StatefulWidget> createState() {
    return CandidatesListState();
  }
}

class CandidatesListState extends State<CandidatesList> {

  AnnunciUserListCubit get _annunciUserListCubit => context.read<AnnunciUserListCubit>();
  AnnuncioDetailCubit get _annuncioDetailCubit => context.read<AnnuncioDetailCubit>();

  late String annuncioId;
  late AnnunciEntity currentAd;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    annuncioId = arguments['annuncio'];
    _annunciUserListCubit.listCandidati(annuncioId);
    _annuncioDetailCubit.getAnnuncioById(annuncioId);

    return W1nScaffold(
        appBar: 1,
        title: CANDIDATES_LIST,
        backgroundColor: lightGrey,
        body: SingleChildScrollView(
          child: Padding(
              padding: getPadding(bottom: 15, top: 35),
              child: BlocBuilder<AnnuncioDetailCubit, AnnuncioDetailState>(
                  builder: (_, detailState) {
                if (detailState is AnnuncioDetailLoading) {
                  return Center(child: loadingGif());
                } else if (detailState is AnnuncioDetailLoaded) {
                  return BlocBuilder<AnnunciUserListCubit,
                      AnnunciUserListState>(builder: (_, state) {
                    if (state is AnnunciUserListLoading) {
                      return Center(child: loadingGif());
                    } else if (state is AnnunciUserListError) {
                      return Container();
                    } else if (state is AnnunciUserListLoaded) {
                      var matched = state.utenti
                          .where((element) =>
                              element.id == detailState.annuncio.matchedUser?.id)
                          .toList();
                      return Column(
                        children: [
                          Visibility(
                            visible: matched.isNotEmpty,
                            child: SearchWorkerCard(
                              isSelected: matched.isNotEmpty,
                              view: () {
                                Navigator.pushNamed(context,
                                    RouteConstants.candidateProfileChoose,
                                    arguments: {
                                      'company': matched[0],
                                      'isVisible': "false",
                                      "annuncio": detailState.annuncio
                                    }).then((value) => setState(() {}));
                              },
                              choose: () {},
                              isChoosenUser: true,
                              isCandidatesList: false,
                              isSearch: false,
                              user: matched.isNotEmpty
                                  ? matched[0]
                                  : UserEntity(),
                              skillIcon: '',
                            ),
                          ),
                          Visibility(
                            visible: matched.isNotEmpty &&
                                state.utenti.isNotEmpty &&
                                state.utenti.length > 1,
                            child: Padding(
                              padding: getPadding(top: 5, bottom: 5),
                              child: Text(
                                getCurrentLanguageValue(OTHER_CANDIDATES)!,
                                style: const TextStyle(
                                    color: darkGrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          ...state.utenti.map((e) => Visibility(
                                visible:
                                    e.id != detailState.annuncio.matchedUser?.id,
                                child: SearchWorkerCard(
                                  isSelected: matched.isNotEmpty,
                                  view: () {
                                    String isVisible =
                                        matched.isNotEmpty ? "false" : "true";
                                    Navigator.pushNamed(context,
                                        RouteConstants.candidateProfileChoose,
                                        arguments: {
                                          'company': e,
                                          'isVisible': isVisible,
                                          "annuncio": detailState.annuncio
                                        }).then((value) => setState(() {}));
                                  },
                                  choose: () {
                                    showDialog(
                                        context: context,
                                        barrierColor: blackDialog,
                                        builder: (ctx) => CandidatesListDialog(
                                              cancelOnTap: () {
                                                Navigator.pop(context);
                                              },
                                              confirmOnTap: () async  {
                                                var a = await _annunciUserListCubit.matchUser(e.id ?? '', detailState.annuncio.id ?? '');
                                                //widget.isSelected = true;
                                                 Navigator.pop(context);
                                              },
                                            )).then((value) => setState(() {

                                            }));
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
                  });
                } else {
                  return const Text('error');
                }
              })),
        ));
  }
}
