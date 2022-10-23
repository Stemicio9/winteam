
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/firebase_repository.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/blocs/annunci_user_list/annunci_user_list_cubit.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';
import 'package:winteam/blocs/subscription_bloc/subscription_cubit.dart';
import 'package:winteam/blocs/user_api_service/user_api_service.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/firebase_options.dart';
import 'package:winteam/pages/pagine_datore/dashboard_datore.dart';
import 'package:retrofit/retrofit.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  final auth = FirebaseAuth.instanceFor(app: Firebase.app(), persistence: Persistence.LOCAL);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(
            create: (context) => UserListCubit(),
        ),
          BlocProvider(
            create: (context) => SkillCubit(),
          ),
          BlocProvider(
            create: (context) => UserCubit(),
          ),
          BlocProvider(
            create: (context) => AnnunciCubit(),
          ),
          BlocProvider(
            create: (context) => AnnunciUserListCubit(),
          ),
          BlocProvider(
            create: (context) => SubscriptionCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          routes: RouteConstants.route(context) ,
          initialRoute: "/",
        )
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
  @override
  Widget build(BuildContext context) {
       logIn();
   //    create();
       return Scaffold(
         body:
               Container(
                 child: Center(
           //          child: UserListView()
                   child: DashboardDatore()
                 ),
               ),


       );
  }


  void create() async {

    var result = await createUser("s.miceli90@gmail.com", "123456");

  }


  void logIn() async {
    var result = await signIn("s.miceli90@gmail.com", "123456");
    var tok = await FirebaseAuth.instance.currentUser!.getIdToken();
    fetchUsers();
  }


  void fetchUsers() async {
    HttpResponse<dynamic> users = await userListApiService.getUserList();
    print("RISPOSTA = ");
    print(users.data);
  }
 
}
