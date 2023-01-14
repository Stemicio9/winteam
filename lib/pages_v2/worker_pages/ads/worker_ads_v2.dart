import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/page_constants.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/ads/data/annuncio.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_autocomplete.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_card.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_header.dart';
import 'package:winteam/utils/size_utils.dart';

class WorkerAdsV2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WorkerAdsV2State();
  }
}

class WorkerAdsV2State extends State<WorkerAdsV2> {
  AnnunciCubit get _cubit => context.read<AnnunciCubit>();

  final TextEditingController filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputData();
  }

  inputData() {
    _cubit.fetchAnnunciLavoratore(
        PageConstants.INIT_PAGE_NUMBER, PageConstants.PAGE_SIZE);
  }

  @override
  Widget build(BuildContext context) {
    return W1nScaffold(
        appBar: 2,
        title: ADS,
        backgroundColor: lightGrey,
        body: SingleChildScrollView(
            child: Padding(
                padding: getPadding(bottom: 35),
                child: Column(
                  children: [
                    AdsAutocomplete(
                      filterController: filterController,
                      optionSelected: onSelectedAutocomplete,
                    ),
                    BlocBuilder<AnnunciCubit, AnnunciState>(
                      builder: (context, state) {
                        if (state is AnnunciLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is AnnunciLoaded) {
                          return Column(
                            children: [
                              AdsHeader(
                                offers: state.annunci.length,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.adsFilter);
                                },
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.annunci.length,
                                itemBuilder: (context, index) {
                                  return AdsCard(
                                    goToProfile: () {
                                      Navigator.of(context).pushNamed(
                                          RouteConstants
                                              .employerProfileOnlyView, arguments: {'company': state.annunci[index].publisherUserDTO});
                                    },
                                    onTap: () {

                                      Navigator.of(context).pushNamed(RouteConstants.adsDetail, arguments: {
                                        'annuncio': state.annunci[index]
                                      });
                                    },
                                    isVisible: false,
                                    annunciEntity: state.annunci[index],
                                    skillIcon: null,
                                  );
                                },
                              ),
                            ],
                          );
                        } else if (state is AnnunciError) {
                          return Container();
                        } else {
                          return Container();
                        }
                      },
                    ),
                    // ...annunci.map(
                    //   (e) => AdsCard(
                    //     goToProfile: () {
                    //       Navigator.pushNamed(
                    //           context, RouteConstants.employerProfileOnlyView);
                    //     },
                    //     onTap: () {
                    //       Navigator.pushNamed(
                    //           context, RouteConstants.adsDetail);
                    //     },
                    //     isVisible: false,
                    //     annunciEntity: e, skillIcon: null,
                    //   ),
                    // )
                  ],
                ))));
  }

  void onSelectedAutocomplete(value) {
    print("Selected value ${value.name}");
  }

}
