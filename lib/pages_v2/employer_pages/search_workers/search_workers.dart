import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/widget/search_workers_card.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/widget/subscription_dialog.dart';
import 'package:winteam/pages_v2/worker_pages/ads/data/annuncio.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_autocomplete.dart';
import 'package:winteam/utils/size_utils.dart';

class SearchWorkers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchWorkersState();
  }
}

class SearchWorkersState extends State<SearchWorkers> {
  final TextEditingController filterController = TextEditingController();
  List<Annuncio> annunci = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    annunci = dummyAnnunci();

    return W1nScaffold(
        appBar: 2,
        backgroundColor: lightGrey,
        title: SEARCH_WORKER,
        body: SingleChildScrollView(
          child: Padding(
            padding: getPadding(bottom: 30),
            child: Column(
              children: [

                AdsAutocomplete(
                    paddingBottom: 30,
                    filterController: filterController,
                    optionSelected: onSelectedAutocomplete,
                ),

                ...annunci.map((e) => SearchWorkerCard(
                  onTap: () { Navigator.pushNamed(context, RouteConstants.candidateProfileChoose, arguments:{
                  'isVisible':'false',
                  });



                   /* showDialog(
                        context: context,
                        barrierColor: blackDialog,
                        builder: (ctx) => SubscriptionDialog()
                    ); */
                  },
                  title: e.title,
                  subtitle: e.subtitle,
                  position: e.position,
                  email: e.email,
                  phone: e.phone,
                  image: e.image,
                  skillIcon: e.skillIcon,

                )),


              ],
            ),
          ),
        ));
  }


  void onSelectedAutocomplete(SkillEntity value){
    print("Selected value ${value.name}");
  }


  List<Annuncio> dummyAnnunci(){
    List<Annuncio> result = List.empty(growable: true);
    for(int i = 0; i< 5; i++){
      result.add(
          const Annuncio(
              title: "Gianmario", subtitle: 'Pizzaiolo', position: 'Bisignano(CS)',
              date: '', hours: '', price: "", skillIcon: 'assets/images/PizzaIcon.svg',
              image: 'assets/images/img_pexelsphotoby.png',
              email: 'gianmariodepaoletti@gmail.com', phone: '+39 1234567890'

          )
      );
    }
    return result;
  }

}
