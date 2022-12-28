import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
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

  List<Annuncio> annunci = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    annunci = dummyAnnunci();
    return W1NScaffold(
        title: DASHBOARD,
        backgroundColor: lightGrey,
        body: SingleChildScrollView(
            child: Padding(
                padding: getPadding(bottom: 30),
                child: Column(
                  children: [
                    AdsAutocomplete(filterController: filterController),
                    AdsHeader(),
                    ...annunci.map((e) => AdsCard(
                      onTap: () {
                        Navigator.pushNamed(context, RouteConstants.ads_detail);
                      },
                      title: e.title,
                      subtitle: e.subtitle,
                      position: e.position,
                      price: e.price,
                      date: e.date,
                      hours: e.hours,
                      image: e.image,
                      skillIcon: e.skillIcon,
                    ),)
                  ],
                ))));
  }

  List<Annuncio> dummyAnnunci(){
    List<Annuncio> result = List.empty(growable: true);
    for(int i = 0; i< 5; i++){
      result.add(
          const Annuncio(title: "Pizzaiolo", subtitle: 'Azienda srl', position: 'Cosenza',
              date: '24/12/2022', hours: '18:00 - 01:00', price: "70",
              skillIcon: 'assets/images/PizzaIcon.svg', image: 'assets/images/img_pexelsphotoby.png',
          )
      );
    }
    return result;
  }

}
