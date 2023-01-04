import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/profile/widget/employer_name_header.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/image_profile.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_info.dart';
import 'package:winteam/utils/size_utils.dart';

class EmployerProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EmployerProfileState();
  }

}



class EmployerProfileState extends State<EmployerProfile>{

  final String name = "Azienda srl";
  final double rating = 4.0;
  final String headerDescription = "Società di servizi";
  final String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices ';
  final String phone = "+39 9876543210";
  final String email = "mario.rossinettini@libeotto.com";
  final String position = "Milan, Italy";
  XFile? imageFile;


  @override
  Widget build(BuildContext context) {
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

                 EmployerNameHeader(
                   rating: rating,
                   name: name,
                   description: headerDescription,
                   sectionHeight: 110,
                   buttonOntap: (){},
                   onTap: (){Navigator.pushNamed(context, RouteConstants.employerProfileEdit);}
                 ),

                ProfileDescription(
                  title: ABOUT_US,
                  description: description,
                ),
                ProfileInfo(
                  title: OUR_CONTACTS,
                  email: email,
                  position: position,
                  phone: phone,

                )
              ],
            ),
          ),
        )
    );

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