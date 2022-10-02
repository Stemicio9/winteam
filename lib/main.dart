import 'package:flutter/material.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/chips.dart';
import 'package:winteam/widgets/drawerWidget.dart';
import 'package:winteam/widgets/inputs.dart';
import 'package:winteam/widgets/texts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes: RouteConstants.route(context),
      initialRoute: '/',
 //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
        appBar: appbarConAction('Titolo Appbar',context),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ActionButton('Action Button',context,(){},250),
                InputWidget(labeltext: 'Input', hinttext: 'provaprova', controller: inputController),
                ChipsWidget(),
                Texth1(testo: 'Testo in h1',color: Colors.black,),
                Texth3(testo: 'Testo in h3',color: Colors.black,),
                Texth5(testo: 'Testo in h5',color: Colors.black,),
                ActionButton('Dashboard lavoratore', context, (){Navigator.pushNamed(context, '/dashboardlavoratore');},250)

              ]
          ),
        )
    );
  }

}
