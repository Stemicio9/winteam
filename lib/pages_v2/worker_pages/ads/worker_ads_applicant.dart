import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_lavoratore_bloc/annunci_lavoratore_cubit.dart';
import 'package:winteam/constants/page_constants.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/employer_ads_choicechip.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_card.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

class WorkerAdsApplicant extends StatefulWidget {
  @override
  State<WorkerAdsApplicant> createState() => WorkerAdsApplicantState();
}

class WorkerAdsApplicantState extends State<WorkerAdsApplicant> {

  AnnunciLavoratoreCubit get _annunciLavoratoreCubit => context.read<AnnunciLavoratoreCubit>();

  List<bool> indexes = [true, false, false, false];
  List<String> texts = ['All', 'Current', 'Accepted', 'History'];
  List<String> _choicesListQuery = ['all', 'current', 'accepted', 'history'];
  String message = '';

  @override
  void initState() {
    super.initState();
    inputData();
  }

  inputData(){
    _annunciLavoratoreCubit.fetchAnnunciLavoratore('all', PageConstants.INIT_PAGE_NUMBER, PageConstants.PAGE_SIZE);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: getPadding(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EmployerAdsChoiceChip(
            valueSelected: selectElement,
            indexes: indexes,
            texts: texts,
          ),
          BlocBuilder<AnnunciLavoratoreCubit, AnnunciLavoratoreState>(builder: (_, state) {
            if (state is AnnunciLavoratoreLoading) {
              return Center(child: loadingGif());
            } else if (state is AnnunciLavoratoreLoaded) {
              return Expanded(
                child: RefreshIndicator(
                    onRefresh: () {
                      return inputData();
                    },
                    child: ListView(
                      children: [
                        ...state.annunci.map((e) =>
                            AdsCard(
                              goToProfile: () {
                                Navigator.of(context).pushNamed(
                                    RouteConstants
                                        .employerProfileOnlyView,
                                    arguments: {
                                      'company':
                                      e.publisherUserDTO
                                    });
                              },
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    RouteConstants.adsDetail,
                                    arguments: {
                                      'annuncio': e.id
                                    });
                              },
                              isVisible: false,
                              annunciEntity: e,
                            ))
                            .toList()

                            /*AdsCard(
                          onTap: () {
                            Navigator.pushNamed(context, RouteConstants.employerAdsDetail, arguments: {'annuncio': e.id});
                          },
                          message: message,
                          candidates: e.candidateUserList.length.toString(),
                          annunciEntity: e,
                          goToList: () {
                            Navigator.pushNamed(context, RouteConstants.candidatesList, arguments: {'annuncio': e});
                          },
                        )).toList(),*/
                      ],
                    )),
              );
            } else if (state is AnnunciLavoratoreEmpty) {
              // @todo insert an empty state element
              return const Center(
                child: Text("NON CI SONO ANNUNCI"),
              );
            } else {
              return const Center(child: Text('Errore di caricamento'));
            }
          }),
        ],
      ),
    );
  }

  void selectElement(int index, bool value) {
    if (!value) {
      return;
    }
    _annunciLavoratoreCubit.fetchAnnunciLavoratore(_choicesListQuery[index], PageConstants.INIT_PAGE_NUMBER, PageConstants.PAGE_SIZE);
    indexes = [false, false, false, false];
    setState(() {
      indexes[index] = value;
    });
  }
}
