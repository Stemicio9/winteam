import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/employer_ads_choicechip.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_card.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/empty_message.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

class EmployerAdsWidget extends StatelessWidget {
  const EmployerAdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AnnunciCubit(),
      child: EmployerAds(),
    );
  }
}

class EmployerAds extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployerAdsState();
  }
}

class EmployerAdsState extends State<EmployerAds> {
  AnnunciCubit get _cubit => context.read<AnnunciCubit>();

  List<bool> indexes = [true, false, false, false];
  List<String> texts = ['Tutti', 'Attivi', 'Accettati', 'Storico'];
  List<String> _choicesListQuery = ['all', 'active', 'accepted', 'history'];
  String message = 'Stato annuncio: Attivo';
  String candidates = '100';

  @override
  void initState() {
    super.initState();
    inputData();
  }

  inputData() {
    _cubit.fetchAnnuncis(_choicesListQuery[calculateCurrentIndex()]);
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
                BlocBuilder<AnnunciCubit, AnnunciState>(builder: (_, state) {
                  if (state is AnnunciLoading) {
                    return Center(child: loadingGif());
                  } else if (state is AnnunciLoaded) {
                    if(state.annunci.isEmpty) {
                      return Padding(
                        padding:getPadding(left: 10,right: 10),
                        child: EmptyMessage(text: EMPTY_MESSAGE),
                      );

                    }
                      return Expanded(
                      child: RefreshIndicator(
                          onRefresh: () {
                            return inputData();
                          },
                          child: ListView(
                            children: [
                              ...state.annunci.map((e) => AdsCard(
                                isWorkerCard: false,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.employerAdsDetail, arguments: {'annuncio': e.id});
                                },
                                message: message,
                                candidates: e.candidateUserList.length.toString(),
                                annunciEntity: e,
                                goToList: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.candidatesList, arguments: {'annuncio': e.id});
                                },
                              )).toList(),
                            ],
                          )),
                    );
                  }
                   else {
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
    _cubit.fetchAnnuncis(_choicesListQuery[index]);
    indexes = [false, false, false, false];
    setState(() {
      indexes[index] = value;
    });
  }

  int calculateCurrentIndex(){
    for(int i = 0; i < indexes.length; i++){
      if(indexes[i]){
        return i;
      }
    }
    return -1;
  }
}
