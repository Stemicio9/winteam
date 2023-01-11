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
         Column(
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
                              itemCount: state.annunci.length,
                              itemBuilder: (context,index) =>
                                  CardAnnuncioDatore(annuncio: state.annunci[index])

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


           ],

         ),


    );
  }




}