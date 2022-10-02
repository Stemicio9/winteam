import 'package:flutter/material.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/action_buttons.dart';import 'package:winteam/widgets/drawerWidget.dart';

class AnnunciLavoratore extends StatefulWidget {
  @override
  State<AnnunciLavoratore> createState() => AnnunciLavoratoreState();
}

class AnnunciLavoratoreState extends State<AnnunciLavoratore>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: appbarConAction('Annunci', context),
      drawer: DrawerWidget(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButton('Filtri', context, (){Navigator.pushNamed(context, RouteConstants.filtriAnnunciLavoratore);}, 100)
                  ],
                ),
                Card(
                  elevation: 10,
                  child: ListTile(
                    title: Text('Titolo'),
                    subtitle: Text('Sottotitolo'),
                  )
                ),
                Card(
                  elevation: 10,
                    child: ListTile(
                      title: Text('Titolo'),
                      subtitle: Text('Sottotitolo'),
                    )
                ),
                Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text('Titolo'),
                      subtitle: Text('Sottotitolo'),
                    )
                ),
                Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text('Titolo'),
                      subtitle: Text('Sottotitolo'),
                    )
                ),
                Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text('Titolo'),
                      subtitle: Text('Sottotitolo'),
                    )
                ),
                Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text('Titolo'),
                      subtitle: Text('Sottotitolo'),
                    )
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }

}