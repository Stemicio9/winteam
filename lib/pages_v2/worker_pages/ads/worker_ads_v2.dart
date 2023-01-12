import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
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
  final TextEditingController filterController = TextEditingController();

  List<AnnunciEntity> annunci = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    annunci = dummyAnnunci();
    return W1nScaffold(
        appBar: 2,
        title: ADS,
        backgroundColor: lightGrey,
        body: SingleChildScrollView(
            child: Padding(
                padding: getPadding(bottom: 35),
                child: Column(
                  children: [
                    AdsAutocomplete(filterController: filterController,  optionSelected: onSelectedAutocomplete,),
                    AdsHeader(
                      onTap: () {
                        Navigator.pushNamed(context, RouteConstants.adsFilter);
                      },
                    ),
                    ...annunci.map(
                      (e) => AdsCard(
                        goToProfile: () {
                          Navigator.pushNamed(
                              context, RouteConstants.employerProfileOnlyView);
                        },
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteConstants.adsDetail);
                        },
                        isVisible: false,
                        annunciEntity: e, skillIcon: null,
                      ),
                    )
                  ],
                ))));
  }

  void onSelectedAutocomplete(value){
    print("Selected value ${value.name}");
  }


  List<AnnunciEntity> dummyAnnunci() {
    List<AnnunciEntity> result = List.empty(growable: true);
    for (int i = 0; i < 5; i++) {
      result.add(AnnunciEntity(
          title: "Pizzaiolo",
          description: 'Azienda srl',
          position: 'Cosenza',
          date: '24/12/2022',
          payment: "70",
          image: 'assets/images/img_pexelsphotoby.png',
          advertisementStatus: 'active',
          hourSlot: 'Mattina',
          matchedUserId: '',
          skillId: '', publisherUserId: '', candidateUserList: []));
    }
    return result;
  }
}
