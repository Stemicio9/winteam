import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/widgets/card_annuncio.dart';
import 'package:winteam/widgets/chipsDatore.dart';
import 'package:winteam/widgets/drawerWidget.dart';

class AnnunciDatore extends StatefulWidget {
  @override
  State<AnnunciDatore> createState() => AnnunciDatoreState();
}

class AnnunciDatoreState extends State<AnnunciDatore>{

  AnnunciCubit get _cubit => context.read<AnnunciCubit>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body:
         Container(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: 20, left: 10),

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ChipsDatoreWidget()
                    ],
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(bottom: 15),
              ),

              BlocBuilder<AnnunciCubit, AnnunciState>(
                  builder: (_, state) {

                    if (state is AnnunciLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AnnunciLoaded) {
                       return
                       Expanded(
                           child: ListView.builder(
                               itemCount: state.Annunci.length,
                               itemBuilder: (context,index) => CardAnnuncioDatore(context, state.Annunci[index].advertisementStatus, "", "CITTA", state.Annunci[index].date, state.Annunci[index].hourSlot, state.Annunci[index].payment, "2KM")

                           )
                       );

                    } else if (state is AnnunciEmpty) {
                      // @todo insert an empty state element
                      return Container(
                        child: Center(
                          child: Text(
                            "NON CI SONO ANNUNCI"
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: Text('Errore di caricamento'));
                    }
                  }),



              /*

              CardAnnuncioDatore(context,'ATTIVO'),
              CardAnnuncioDatore(context,'STORICO'),
              CardAnnuncioDatore(context,'CHIUSO'),
              CardAnnuncioDatore(context,'ATTIVO'),
              CardAnnuncioDatore(context,'CHIUSO'),
              CardAnnuncioDatore(context,'STORICO'),
              CardAnnuncioDatore(context,'ATTIVO'),

              */

            ],

          ),
        ),


    );
  }




}