import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages/login_section/register_form.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/inputs.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';


class ModificaProfiloDatoreWidget extends StatelessWidget {
  const ModificaProfiloDatoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: ModificaProfiloDatore(),
    );
  }
}

class ModificaProfiloDatore extends StatefulWidget{
  @override
  State<ModificaProfiloDatore> createState() => ModificaProfiloDatoreState();

}


String imageDefaultName = "profileImage";

class ModificaProfiloDatoreState extends State<ModificaProfiloDatore>{
  UserCubit get _cubit => context.read<UserCubit>();
  UserEntity? entity;
  final FirebaseAuth auth = FirebaseAuth.instance;
  XFile? imageFile;
  String uid = '';
  String email = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController indirizzoController = TextEditingController();
  TextEditingController nomeattivitaController = TextEditingController();
  TextEditingController descController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  inputData(UserEntity entity) {
    final User? user = auth.currentUser;
    uid = user?.uid ?? '';
    email = user?.email ?? "";
    print(entity);
    emailController.text = entity.email! ?? "";
    telefonoController.text = entity.phoneNumber! ?? "";
    indirizzoController.text = entity.address! ?? "";
    nomeattivitaController.text = entity.companyName! ?? "";
    descController.text = entity.description! ?? "";

  }



  openGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = image;
    });

    var file = File(imageFile!.path);
    Uint8List bytes = file.readAsBytesSync();

    var fileList = await FirebaseStorage.instance.ref('UID:$uid/image_profile/').listAll();
    if (fileList.items.isNotEmpty) {
      var fileesistente = fileList.items[0];
      fileesistente.delete();
    }

    FirebaseStorage.instance.ref('UID:$uid/image_profile/$imageDefaultName').putData(bytes);

    setState(() {});

    print('STAMPOOOOOOOOOOOOOOOO');
    print(FirebaseStorage.instance.ref('UID:$uid/image_profile/').listAll());

    Navigator.of(context).pop();
  }

  openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = image;
    });

    var file = File(imageFile!.path);
    Uint8List bytes = file.readAsBytesSync();

    var fileList =
    await FirebaseStorage.instance.ref('UID:$uid/image_profile/').listAll();
    if (fileList.items.isNotEmpty) {
      var fileesistente = fileList.items[0];
      fileesistente.delete();
    }

    FirebaseStorage.instance.ref('UID:$uid/image_profile/$imageDefaultName').putData(bytes);

    setState(() {});

    Navigator.of(context).pop();
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Carica foto da:',
                  style:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      child: MaterialButton(
                          onPressed: () {
                            openGallery();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.image,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              const Text(
                                'Galleria',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: MaterialButton(
                          onPressed: () {
                            openCamera();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.photo_camera,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              const Text(
                                'Fotocamera',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ));
        });
  }

  Future downloadUrlImage() async {
    var fileList = await FirebaseStorage.instance.ref('UID:$uid/image_profile/').listAll();

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
    return Scaffold(
      body:
      BlocBuilder<UserCubit, UserState>(
          builder: (_, state) {
            if (state is UserLoading) {
              return Center(child: loadingGif());
            } else if (state is UserLoaded) {
              inputData(state.user);
              return everyContent(state.user);
            } else if (state is UserEmpty) {
              // @todo insert an empty state element
              return Container();
            } else {
              return const Center(child: Text('Errore di caricamento'));
            }
          }),
    );
  }


  Widget everyContent(UserEntity entity) {
    return Scaffold(
      appBar: appbarSenzaActions(context, 'Modifica profilo'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(padding: const EdgeInsets.only(top: 20)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: azzurroscuro,
                              width: 3
                          ),
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
                                        ?  loadingGif()
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
                                    showModalBottomSheet<void>(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15),
                                        ),
                                      ),

                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(90)
                                          ),
                                          height: 150,
                                          child: Center(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[

                                                MaterialButton(
                                                      onPressed: () {
                                                        openGallery();
                                                      },
                                                    height: 60,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                              height: 50,
                                                              width: 50,
                                                              child:Card(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(80),
                                                                ),
                                                                color: Colors.white70,
                                                                child: const Icon(
                                                                  Icons.image,
                                                                  color: Colors.black,
                                                                  size: 25,
                                                                ),
                                                              )
                                                          ),

                                                          const Padding(padding: EdgeInsets.only(left: 10)),
                                                          const Text(
                                                            'Seleziona foto dalla galleria',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.normal),
                                                          ),
                                                        ],
                                                      )
                                                  ),



                                                 MaterialButton(
                                                      onPressed: () {
                                                        openCamera();
                                                      },
                                                     height: 60,
                                                     child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                              child: SizedBox(
                                                                  height: 50,
                                                                  width: 50,
                                                                  child:Card(
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(80),
                                                                    ),
                                                                    color: Colors.white70,
                                                                    child: const Icon(
                                                                      Icons.camera_alt_rounded,
                                                                      color: Colors.black,
                                                                      size: 25,
                                                                    ),
                                                                  )
                                                              )
                                                          ),

                                                          const Padding(padding: EdgeInsets.only(left: 10)),
                                                          const Text(
                                                            'Scatta una foto',
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.normal),
                                                          ),
                                                        ],
                                                      )
                                                  ),


                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },

                                  elevation: 2.0,
                                  fillColor: const Color(0xFFF5F6F9),
                                  padding: const EdgeInsets.all(5.0),
                                  shape: const CircleBorder(),
                                  child: const Icon(Icons.camera_alt_rounded, color: giallo),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(padding: const EdgeInsets.only(top: 30)),

                  InputWidget(labeltext: 'Nome attività', hinttext: 'Inserisci il nome della tua attività', controller: nomeattivitaController),

                  Container(padding: const EdgeInsets.only(top: 25)),

                  InputWidget(labeltext: 'Email', hinttext: 'Inserisci una email', controller: emailController,validator: validaemail),

                  Container(padding: const EdgeInsets.only(top: 25)),

                  InputWidget(labeltext: 'Telefono', hinttext: 'Inserisci un numero di telefono', controller: telefonoController,),

                  Container(padding: const EdgeInsets.only(top: 25)),

                  InputWidget(labeltext: 'Indirizzo', hinttext: 'Inserisci un indirizzo', controller: indirizzoController,),

                  Container(padding: const EdgeInsets.only(top: 25)),

                  InputWidget(labeltext: 'Descrizione', hinttext: 'Inserisci una descrizione', controller: descController,),

                  Container(padding: const EdgeInsets.only(top: 25)),

                  ActionButton('Salva cambiamenti', (){
                    _cubit.update(
                      entity.copyWith(
                        companyName: nomeattivitaController.text,
                        email: emailController.text,
                        phoneNumber: telefonoController.text,
                        address: indirizzoController.text,
                        description: descController.text,
                      )
                    );
                    Navigator.pop(context);
                    }, 200, azzurroscuro, Colors.white),
                ],
              ),
            ),
          ],
        )
      )
    );
  }



  String validaemail (String value) {
    if (value.isEmpty) {
      return 'Inserire username';
    }
    if(!value.isValidEmail()){
      return "Inserire un indirizzo email valido";
    }
    return null!;
  }
}