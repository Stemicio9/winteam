import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/widget/search_workers_card.dart';
import 'package:winteam/pages_v2/worker_pages/ads/data/annuncio.dart';
import 'package:winteam/utils/size_utils.dart';

class CandidatesList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CandidatesListState();
  }

}


class CandidatesListState extends State<CandidatesList>{

  List<Annuncio> annunci = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    annunci = dummyAnnunci();

    return W1nScaffold(
        appBar:1,
        title: CANDIDATES_LIST,
        backgroundColor: lightGrey,
        body: SingleChildScrollView(
          child: Padding(
            padding: getPadding(bottom: 15,top: 35),
            child: Column(
              children: [
                ...annunci.map((e) => SearchWorkerCard(
                  isCandidatesList: true,
                  isSearch: false,
                  title: e.title,
                  subtitle: e.subtitle,
                  position: e.position,
                  email: e.email,
                  phone: e.phone,
                  image: e.image,
                  skillIcon: e.skillIcon,
                  view: (){},
                  hire: (){},
                )),
              ],
            ),
          ),
        )
    );
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