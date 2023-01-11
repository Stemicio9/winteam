import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/employer_ads_choicechip.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_card.dart';
import 'package:winteam/utils/size_utils.dart';

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
  String message = 'Status annuncio: Attivo';
  String candidates = '100';

  @override
  void initState() {
    super.initState();
    inputData();
  }

  inputData() {
    _cubit.fetchAnnuncis('all');
  }

  @override
  Widget build(BuildContext context) {
    return W1nScaffold(
        appBar: 2,
        backgroundColor: lightGrey,
        title: POSTED_ADS,
        body: SingleChildScrollView(
          child: Container(
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
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is AnnunciLoaded) {
                    return Column(
                      children: [
                        ...state.annunci.map((e) => AdsCard(
                              isWorkerCard: false,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteConstants.employerAdsDetail);
                              },
                              skillIcon:
                                  e.skillDTO?.imageLink ??
                                      'assets/images/PizzaIcon.svg',
                              message: message,
                              candidates: candidates,
                              annunciEntity: e,
                              goToList: () {
                                Navigator.pushNamed(
                                    context, RouteConstants.candidatesList);
                              },
                            )).toList(),
                      ],
                    );
                  } else if (state is AnnunciEmpty) {
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
          ),
        ));
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
}
