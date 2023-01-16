import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';
import 'package:winteam/constants/enums.dart';
import 'package:winteam/constants/page_constants.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_autocomplete.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_card.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_header.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

class WorkerAdsV2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WorkerAdsV2State();
  }
}

class WorkerAdsV2State extends State<WorkerAdsV2> {
  AnnunciCubit get _cubit => context.read<AnnunciCubit>();
  SkillCubit get _skillCubit => context.read<SkillCubit>();
  final TextEditingController filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    inputData();
  }

  inputData() {
    _skillCubit.getSkillList();
    _cubit.fetchAnnunciLavoratore(
        PageConstants.INIT_PAGE_NUMBER, PageConstants.PAGE_SIZE);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(bottom: 35),
        child: Column(
          children: [
            BlocBuilder<SkillCubit, SkillState>(builder: (_, state){
              if(state is SkillListLoading){
                return loadingGif();
              }else if(state is SkillListLoaded){
                return AdsAutocomplete(
                  paddingBottom: 30,
                  filterController: filterController,
                  optionSelected: onSelectedAutocomplete,
                  onFieldSubmitted: onSubmittedAutocomplete,
                  type: AutocompleteSearchType.adSearch,
                  kOptions: state.skillList,
                );
              }else{
                //Todo
                return Container();
              }
            }),
            BlocBuilder<AnnunciCubit, AnnunciState>(
              builder: (context, state) {
                if (state is AnnunciLoading) {
                  return Center(
                    child: loadingGif(),
                  );
                } else if (state is AnnunciLoaded) {
                  return Expanded(
                    child: RefreshIndicator(
                        onRefresh: () {
                          return inputData();
                        },
                        child: ListView(
                          children: [
                            AdsHeader(
                              offers: state.annunci.length,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteConstants.adsFilter);
                              },
                            ),
                            ...state.annunci
                                .map((annuncio) => AdsCard(
                                      goToProfile: () {
                                        Navigator.of(context).pushNamed(
                                            RouteConstants
                                                .employerProfileOnlyView,
                                            arguments: {
                                              'company':
                                                  annuncio.publisherUserDTO
                                            });
                                      },
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            RouteConstants.adsDetail,
                                            arguments: {
                                              'annuncio': annuncio.id
                                            });
                                      },
                                      isVisible: false,
                                      annunciEntity: annuncio,
                                    ))
                                .toList()
                          ],
                        )),
                  );
                } else if (state is AnnunciError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ],
        ));
  }

  void onSelectedAutocomplete(value) {
    print("Selected value ${value.name}");
  }

  onSubmittedAutocomplete(String skill) {
    _cubit.fetchAnnuncioBySkill(skill);
  }
}
