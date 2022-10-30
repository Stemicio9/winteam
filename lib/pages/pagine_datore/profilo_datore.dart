import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/blocs/subscription_bloc/subscription_info_cubit.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/subscription.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages/pagine_datore/subscription_info_widget.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/texts.dart';

import '../../constants/colors.dart';


class ProfiloDatoreWidget extends StatelessWidget {
  const ProfiloDatoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => UserCubit(),
          ),
          BlocProvider(
            create: (_) => SubscriptionInfoCubit(),
          ),
        ],
        child:
        ProfiloDatore()
    );
  }
}


class ProfiloDatore extends StatefulWidget {

  @override
  State<ProfiloDatore> createState() => ProfiloDatoreState();

}



String imageDefaultName = "profileImage";

class ProfiloDatoreState extends State<ProfiloDatore> {

  UserCubit get _cubit => context.read<UserCubit>();
  SubscriptionInfoCubit get _subscription_info_cubit => context.read<SubscriptionInfoCubit>();

  UserEntity? entity;
  final FirebaseAuth auth = FirebaseAuth.instance;
  XFile? imageFile;
  String uid = '';
  String email = '';

  @override
  void initState() {
    _cubit.me();
    super.initState();
    inputData();
  }


  inputData() async {
    final User? user = auth.currentUser;
    uid = user!.uid;
    email = user.email!;
    entity = await _cubit.me();
  }

  Future downloadUrlImage() async {
    var fileList =
    await FirebaseStorage.instance.ref('UID:$uid/image_profile/').listAll();

    if (fileList.items.isEmpty) {
      var fileList = await FirebaseStorage.instance.ref('default_profile_image/').listAll();
      var file = fileList.items[0];
      var result = await file.getDownloadURL();
      return result;
    }

    var file = fileList.items[0];
    var result = await file.getDownloadURL();
    return result;
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return content(state.user,context);
          } else if (state is UserEmpty) {
            // @todo insert an empty state element
            return Container();
          } else {
            return const Center(child: Text('Errore di caricamento'));
          }
        });
  }


  Widget content(UserEntity entity, BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
                children: [
                  Container(padding: const EdgeInsets.only(top: 20)),
                  header(),
                  Container(padding: const EdgeInsets.only(top: 10)),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Texth1(
                      testo: entity.companyName!,
                      color: Colors.black,
                    ),
                  ]),
                  Container(padding: const EdgeInsets.only(top: 10)),
                  rating(),
                  Container(padding: const EdgeInsets.only(top: 10)),

                  ActionButton(getCurrentLanguageValue(GESTISCI_ABBONAMENTO)!,
                          () {

                             },
                      200,
                      azzurroscuro, Colors.white),



                  Container(padding: const EdgeInsets.only(top: 20)),
                  Row(
                    children: [
                      const Icon(Icons.info, color: azzurroscuro),
                      Container(
                        padding: const EdgeInsets.only(right: 7),
                      ),
                       Text(
                         getCurrentLanguageValue(INFORMAZIONI_DI_CONTATTO)!,
                        style: const TextStyle(color: azzurroscuro, fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  personalInfo(),

                  const Padding(padding: EdgeInsets.only(top: 20)),

                  footer(),
                ]
            ),
          ),
        ],
      ),
    );
  }


  Widget subscriptionSection(){
    return BlocBuilder<SubscriptionInfoCubit,SubscriptionInfoState>(
    builder: (_, state) {
      if (state is SubscriptionInfoLoading) {
        //@todo non va bene il circular progress qui,
        // shimmer effect per il caricamento del pulsante delle subscription
        return const Center(child: CircularProgressIndicator());
      } else if (state is SubscriptionInfoLoaded) {
        return SubscriptionInfoWidget(subscription: state.subscription);
      } else {
        return Center(child: Text(getCurrentLanguageValue(CANNOT_LOAD_SUBSCRIPTION_INFO)!));
      }
    });
  }


  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: azzurroscuro, width: 3),
            shape: BoxShape.circle,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48), // Image radius
                  child: FutureBuilder(
                    future: downloadUrlImage(),
                    builder: (context, snapshot) {
                      var result = (snapshot.data);
                      return result == null
                          ? const CircularProgressIndicator()
                          : Image.network(result, fit: BoxFit.cover);
                    },
                  ),
                ),
              ),
              Positioned(
                  bottom: -5,
                  right: -20,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          RouteConstants.modificaProfiloDatore);
                    },
                    elevation: 2.0,
                    fillColor: const Color(0xFFF5F6F9),
                    padding: const EdgeInsets.all(5.0),
                    shape: const CircleBorder(),
                    child: const Icon(Icons.edit_rounded,
                        color: giallo),
                  )),
            ],
          ),
        )
      ],
    );
  }


  Widget rating(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          itemSize: 30,
          initialRating: 3.5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star_rate_rounded,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {

          },
        )
      ],
    );
  }

  Widget personalInfo(){
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 8)),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(
            Icons.attach_email_outlined,
            color: giallo,
          ),
          Container(
            padding: const EdgeInsets.only(right: 7),
          ),
          Text(email),
        ]),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(
            Icons.phone,
            color: giallo,
          ),
          Container(
            padding: const EdgeInsets.only(right: 7),
          ),
          Text(entity!.phoneNumber!,
              style: const TextStyle(
                fontSize: 16,
              ))
        ]),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(
            Icons.home_work_outlined,
            color: giallo,
          ),
          Container(
            padding: const EdgeInsets.only(right: 7),
          ),
          const Text(
              'entity.address!',
              style: TextStyle(
                fontSize: 16,
              )
          ),
        ]),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(
            Icons.location_on_outlined,
            color: giallo,
          ),
          Container(
            padding: const EdgeInsets.only(right: 7),
          ),
          const Text(
              'Rende',
              style: TextStyle(
                fontSize: 16,
              )
          ),
        ]),
      ],
    );
  }


  Widget footer(){
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.speaker_notes, color: azzurroscuro),
            Container(
              padding: const EdgeInsets.only(right: 7),
            ),
            Text(
              getCurrentLanguageValue(CHI_SIAMO)!,
              style: const TextStyle(
                  color: azzurroscuro,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Row(
          children: [
            Text(
                entity!.description!,
                style: const TextStyle(
                  fontSize: 16,
                )
            )
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),

      ],
    );
  }


}


