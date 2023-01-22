import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/card_annuncio.dart';
import 'package:winteam/widgets/chips.dart';
import 'package:winteam/widgets/drawerWidget.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

class AnnunciLavoratore extends StatefulWidget {
  @override
  State<AnnunciLavoratore> createState() => AnnunciLavoratoreState();
}

class AnnunciLavoratoreState extends State<AnnunciLavoratore> {
  AnnunciCubit get _cubit => context.read<AnnunciCubit>();

  @override
  void initState() {
    super.initState();
    //_cubit.fetchAnnunciLavoratore(0, 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: appbarConAction('Annunci', context),
        drawer: DrawerWidget(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
            ),
            ActionButtonFiltri('Filtri', context, () {
              Navigator.pushNamed(
                  context, RouteConstants.filtriAnnunciLavoratore);
            }, 80, Icons.tune_rounded),
            Container(
              margin: EdgeInsets.only(bottom: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [ChipsWidget()],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
            ),
            BlocBuilder<AnnunciCubit, AnnunciState>(builder: (_, state) {
              if (state is AnnunciLoading) {
                return Center(child: loadingGif());
              } else if (state is AnnunciLoaded) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: state.annunci.length,
                        itemBuilder: (context, index) =>
                            //TODO se va bene cambiare nome al widget
                            CardAnnuncioDatore(
                                annuncio: state.annunci[index])));
              } else if (state is AnnunciEmpty) {
                // @todo insert an empty state element
                return Container(
                  child: Center(
                    child: Text("NON CI SONO ANNUNCI"),
                  ),
                );
              } else {
                return const Center(child: Text('Errore di caricamento'));
              }
            }),
          ],
        ));
  }
}
