import 'package:flutter/material.dart';
import 'package:winteam/widgets/appbars.dart';

class ListaCandidati extends StatefulWidget{
  @override
  State<ListaCandidati> createState() => ListaCandidatiState();
}


class ListaCandidatiState extends State<ListaCandidati> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSenzaActions(context, 'Lista candidati'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Eggbert'),
                    subtitle: Text('bert'),
                    leading: Text('Egg'),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Eggbert'),
                    subtitle: Text('bert'),
                    leading: Text('Egg'),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Eggbert'),
                    subtitle: Text('bert'),
                    leading: Text('Egg'),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Eggbert'),
                    subtitle: Text('bert'),
                    leading: Text('Egg'),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Eggbert'),
                    subtitle: Text('bert'),
                    leading: Text('Egg'),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Eggbert'),
                    subtitle: Text('bert'),
                    leading: Text('Egg'),
                  ),
                ],
              ),
            ),

          ],
        )
      ),
    );
  }

}