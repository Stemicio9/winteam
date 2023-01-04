import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/profile/data/mansione.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/image_profile.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_info.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_name_header.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_skills.dart';
import 'package:winteam/utils/image_constant.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:winteam/utils/size_utils.dart';

class WorkerProfileV2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WorkerProfileV2State();
  }
}

class WorkerProfileV2State extends State<WorkerProfileV2> {
  final String name = "Mario Rossinettini";
  final String headerDescription = "Digital Creator";
  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices ';
  final String phone = "+39 9876543210";
  final String email = "mario.rossinettini@libeotto.com";
  final String position = "Milan, Italy";
  final String mansione = "Mansione";
  XFile? imageFile;

  final List<Mansione> mansioni = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    fillDummyMansioni();

    return W1nScaffold(
        appBar: 2,
        title: PROFILE,
        body: SingleChildScrollView(
            child: Padding(
             padding: getPadding(bottom: 35),
             child: Column(
               children: [
               ImageProfile(
                imageHeight: 200,
                imageWidth: 200,
                innerImageHeight: 190,
                innerImageWidth: 190,
                innerImageRadius: 100,
                topMargin: 46,
                iconHeight: 45,
                iconWidth: 45,
                openCamera: openCamera,
                openGallery: openGallery,
              ),
              ProfileNameHeader(
                name: name,
                description: headerDescription,
                sectionHeight: 100,
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteConstants.workerProfileEdit);
                },
              ),
              ProfileSkill(
                mansioni: mansioni,
              ),
              ProfileDescription(
                title: CHI_SONO,
                description: description,
              ),
              ProfileInfo(
                title: I_MIEI_DATI,
                phone: phone,
                email: email,
                position: position,
              )
            ],
          ),
        )));
  }

  fillDummyMansioni() {
    mansioni.clear();
    for (int i = 0; i < 4; i++) {
      mansioni.add(Mansione(icon: ImageConstant.imgBag, text: '$Mansione $i'));
    }
  }

  openGallery() async{
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = image;
    });

    var file = File(imageFile!.path);
    Uint8List bytes = file.readAsBytesSync();

    Navigator.of(context).pop();
  }


  openCamera() async{
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = image;
    });

    var file = File(imageFile!.path);
    Uint8List bytes = file.readAsBytesSync();

    Navigator.of(context).pop();
  }
}
