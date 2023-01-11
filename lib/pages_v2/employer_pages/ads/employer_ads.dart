import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/employer_ads_choicechip.dart';
import 'package:winteam/pages_v2/worker_pages/ads/data/annuncio.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_card.dart';
import 'package:winteam/utils/size_utils.dart';

class EmployerAds extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EmployerAdsState();
  }

}



class EmployerAdsState extends State<EmployerAds>{


  List<Annuncio> annunci = List.empty(growable: true);
  List<bool> indexes = [true, false, false, false];
  List<String> texts = ['Tutto', 'Attivi', 'Accettati', 'Storico'];
  String message = 'Status annuncio: Attivo';
  String candidates = '100';

  @override
  Widget build(BuildContext context) {
    annunci = dummyAnnunci();
    return W1nScaffold(
        appBar: 2,
        backgroundColor: lightGrey,
        title: POSTED_ADS,
        body:SingleChildScrollView(
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



                ...annunci.map((e) => AdsCard(
                  isWorkerCard: false,
                  onTap: () {
                    Navigator.pushNamed(context, RouteConstants.employerAdsDetail);
                  },
                  title: e.title,
                  subtitle: e.subtitle,
                  position: e.position,
                  price: e.price,
                  date: e.date,
                  hours: e.hours,
                  image: e.image,
                  skillIcon: e.skillIcon,
                  message: message,
                  candidates:candidates ,
                  state: e.state ?? '',
                  goToList: (){Navigator.pushNamed(context, RouteConstants.candidatesList);},

                ),),

              ],
            ),
          ),
        )
    );
  }


  void selectElement(int index, bool value) {
    if(!value){
      return;
    }
    indexes = [false, false, false, false];
    setState(() {
      indexes[index] = value;
    });

  }


  List<Annuncio> dummyAnnunci(){
    List<Annuncio> result = List.empty(growable: true);
    for(int i = 0; i< 2; i++){
      result.add(
          const Annuncio(
            title: "Pizzaiolo", subtitle: 'Azienda srl', position: 'Cosenza',
            date: '24/12/2022', hours: 'Mattina', price: "70",
            skillIcon: 'assets/images/PizzaIcon.svg', image: 'assets/images/img_pexelsphotoby.png',
            phone: '',email: '', state: 'Active'

          )
      );
    }
    for(int i = 0; i< 1; i++){
      result.add(
          const Annuncio(
              title: "Pizzaiolo", subtitle: 'Azienda srl', position: 'Cosenza',
              date: '24/12/2022', hours: 'Mattina', price: "70",
              skillIcon: 'assets/images/PizzaIcon.svg', image: 'assets/images/img_pexelsphotoby.png',
              phone: '',email: '', state: 'History'
          )
      );
    }
    for(int i = 0; i< 3; i++){
      result.add(
          const Annuncio(
            title: "Pizzaiolo", subtitle: 'Azienda srl', position: 'Cosenza',
            date: '24/12/2022', hours: 'Mattina', price: "70",
            skillIcon: 'assets/images/PizzaIcon.svg', image: 'assets/images/img_pexelsphotoby.png',
            phone: '',email: '', state: 'Accepted'
          )
      );
    }
    return result;
  }
}