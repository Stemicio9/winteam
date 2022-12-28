import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/texts.dart';
import '../../constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfiloLavoratoreWidget extends StatelessWidget {
  const ProfiloLavoratoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: ProfiloLavoratore(),
    );
  }
}

class ProfiloLavoratore extends StatefulWidget {
  @override
  State<ProfiloLavoratore> createState() => ProfiloLavoratoreState();
}

String imageDefaultName = "profileImage";

class ProfiloLavoratoreState extends State<ProfiloLavoratore> {
  UserCubit get _cubit => context.read<UserCubit>();
  UserEntity? entity;
  final FirebaseAuth auth = FirebaseAuth.instance;
  XFile? imageFile;
  String uid = '';
  String email = '';

  @override
  void initState() {
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
      var fileList = await FirebaseStorage.instance
          .ref('default_profile_image/')
          .listAll();
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
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      if (state is UserLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UserLoaded) {
        return everyContent();
      } else if (state is UserEmpty) {
        // @todo insert an empty state element
        return Container();
      } else {
        return const Center(child: Text('Errore di caricamento'));
      }
    });
  }

  Widget everyContent() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(padding: EdgeInsets.only(top: 20)),
              Row(
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
                            size: Size.fromRadius(48), // Image radius
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
                                      RouteConstants.modificaProfiloLavoratore);
                                },
                                elevation: 2.0,
                                fillColor: Color(0xFFF5F6F9),
                                padding: EdgeInsets.all(5.0),
                                shape: CircleBorder(),
                                child:
                                    Icon(Icons.edit_rounded, color: giallo)
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(padding: EdgeInsets.only(top: 10)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Texth1(testo: entity!.firstName!, color: Colors.black),
                Container(
                  padding: EdgeInsets.only(right: 7),
                ),
                Texth1(testo: entity!.lastName!, color: Colors.black),
              ]),
              Container(padding: EdgeInsets.only(top: 10)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                RatingBar.builder(
                  itemSize: 30,
                  initialRating: 3.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ]),
              Container(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 10,
                        children: [
                          ActionButton('Add Mansione', () async {
                            var a = await Navigator.pushNamed(context, RouteConstants.aggiungiSkill);
                            setState(() {
                              entity!.skillList!.add(a as SkillEntity);
                            });
                          }, MediaQuery.of(context).size.width / 3, grigioopaco,
                              grigio),
                          Container(
                              height: 48,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: entity!.skillList!.length,
                                itemBuilder: (context, index) {
                                  return
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Chip(
                                          labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                          label: Text(
                                              entity!.skillList![index].name!,
                                              style: TextStyle(
                                                  color: HexColor(entity!
                                                      .skillList![index]
                                                      .hexColorText!))),
                                          avatar: ClipOval(
                                            child: SizedBox.fromSize(
                                                size: Size.fromRadius(48),
                                                // Image radius
                                                child: Image.asset(
                                                    'assets/images/avatar_image.png',
                                                    fit: BoxFit.cover)),
                                          ),
                                          backgroundColor: HexColor(entity!
                                              .skillList![index]
                                              .hexColorBackground!),
                                          shape: StadiumBorder(
                                              side: BorderSide(
                                                  color: HexColor(entity!
                                                      .skillList![index]
                                                      .hexColorText!))),
                                        ),
                                      );

                                },
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(padding: EdgeInsets.only(top: 20)),
              Row(
                children: [
                  Icon(Icons.info, color: azzurroscuro),
                  Container(
                    padding: EdgeInsets.only(right: 7),
                  ),
                  const Text(
                    'I miei dati',
                    style: TextStyle(
                        color: azzurroscuro,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Icon(
                      Icons.attach_email_outlined,
                      color: giallo,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 7),
                    ),
                    Text(email),
                  ]),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Icon(
                      Icons.phone,
                      color: giallo,
                    ),
                    Container(padding: EdgeInsets.only(right: 7)),
                    Text(entity!.phoneNumber!),
                  ]),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.speaker_notes, color: azzurroscuro),
                  Container(
                    padding: EdgeInsets.only(right: 7),
                  ),
                  const Text(
                    'Chi sono',
                    style: TextStyle(
                        color: azzurroscuro,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(entity!.description!),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
