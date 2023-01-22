import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/constants/enums.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_autocomplete.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_card.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_header.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/empty_message.dart';
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
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  bool showLoadingMoreGif = false;
  late AnimatedGif gif;

  @override
  void initState() {
    super.initState();
    gif =  AnimatedGif(visible: false, key: UniqueKey());
    inputData();
    scrollController.addListener(scrollManager);
  }

  inputData() {
    _skillCubit.getSkillList();
    _cubit.fetchAnnunciLavoratore(firstCall: true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: getPadding(bottom: 0),
        child: Column(
          children: [
            BlocBuilder<SkillCubit, SkillState>(builder: (_, state) {
              if (state is SkillListLoading) {
                return loadingGif();
              } else if (state is SkillListLoaded) {
                return AdsAutocomplete(
                  filterController: filterController,
                  optionSelected: onSelectedAutocomplete,
                  onFieldSubmitted: onSubmittedAutocomplete,
                  type: AutocompleteSearchType.adSearch,
                  kOptions: state.skillList,
                );
              } else {
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
                }
                else if (state is AnnunciLoaded) {
                  if (state.annunci.isEmpty) {
                    return Column(
                      children: [
                        AdsHeader(
                          filterText: filterAnnunciLavoratore.isFiltered()
                              ? FILTER_ACTIVE
                              : FILTER,
                          offers: state.annunci.length,
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteConstants.adsFilter);
                          },
                        ),
                        Padding(
                          padding: getPadding(left: 10, right: 10),
                          child: EmptyMessage(
                            text: EMPTY_MESSAGE,
                          ),
                        )
                      ],
                    );
                  }
                  return Expanded(
                    child: Stack(
                      children: [
                        refreshableList(state),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: gif
                        )
                      ],
                    ),
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


  Widget refreshableList(AnnunciLoaded state){
    return RefreshIndicator(
        onRefresh: () {
          return inputData();

        },
        child: ListView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            AdsHeader(
              filterText: filterAnnunciLavoratore.isFiltered()
                  ? FILTER_ACTIVE
                  : FILTER,
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
                      annuncio.publisherUser
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
                .toList(),

          ],
        ));
  }


  void onSelectedAutocomplete(value) {
    print("Selected value ${value.name}");
  }

  onSubmittedAutocomplete(String skill) {
    _cubit.fetchAnnuncioBySkill(skill, 0, 20);
  }

  void scrollManager() {
    print('ciao');
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(_cubit.state is AnnunciLoaded){
        if(!(_cubit.state as AnnunciLoaded).loadingMore){
          gif = AnimatedGif(visible: true, key: UniqueKey());
          _cubit.fetchAnnunciLavoratore();
        }
      }

    }
  }


}



class AnimatedGif extends StatefulWidget {
  bool visible;


  AnimatedGif({super.key, required this.visible});

  @override
  AnimatedGifState createState() {
    return AnimatedGifState();
  }

}

class AnimatedGifState extends State<AnimatedGif> {

  late bool visibility;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    visibility = widget.visible;
    timer = Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        visibility = false;
      });

    });
  }


  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
       //   color: lightGrey,
          child: loadingGif(height: 75.0, width: 75.0)
      ),
    );
  }
}