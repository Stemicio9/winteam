import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/entities/user_entity.dart';
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
  final bool isOnlyView;
  final bool hasScaffold;

  WorkerProfileV2({this.isOnlyView = false, this.hasScaffold = true
  });

  @override
  State<StatefulWidget> createState() {
    return WorkerProfileV2State();
  }
}

class WorkerProfileV2State extends State<WorkerProfileV2> {

  UserAuthCubit get _authCubit => context.read<UserAuthCubit>();
  UserEntity currentUser = UserEntity();

  String name = "Mario Rossinettini";
  String headerDescription = "Digital Creator";
  String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices ';
  String phone = "+39 9876543210";
  String email = "mario.rossinettini@libeotto.com";
  String position = "Milan, Italy";
  final String mansione = "Mansione";
  XFile? imageFile;


  final List<SkillEntity> mansioni = List.empty(growable: true);

  @override
  void initState() {
    inputData();
    super.initState();
  }

  inputData(){
    currentUser = (_authCubit.state as UserAuthenticated).user;

    print(currentUser);
    name = '${currentUser.firstName} ${currentUser.lastName}';
    headerDescription = currentUser.brief ?? '';
    phone = currentUser.phoneNumber ?? '';
    email = currentUser.email ?? '';
    position = currentUser.address ?? '';
    description = currentUser.description ?? '';

    fillMansioni();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.hasScaffold ? content() :
        W1nScaffold(
            appBar: 2,
            title: PROFILE,
            body: content()
        );

  }

  fillMansioni() {
    mansioni.clear();
    for(int i = 0; i < currentUser.skillList!.length; i++){
      mansioni.add(currentUser.skillList![i]);
    }
  }

  openGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = image;
    });

    var file = File(imageFile!.path);
    Uint8List bytes = file.readAsBytesSync();

    Navigator.of(context).pop();
  }

  openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = image;
    });

    var file = File(imageFile!.path);
    Uint8List bytes = file.readAsBytesSync();

    Navigator.of(context).pop();
  }



  Widget content(){
    return SingleChildScrollView(
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
                    openCamera: widget.isOnlyView ? null : openCamera,
                    openGallery: openGallery,
                  ),
                  ProfileNameHeader(
                    isOnlyView: widget.isOnlyView,
                    name: name,
                    description: headerDescription,
                    sectionHeight: 100,
                    onTap: () {
                      Navigator.pushNamed(context, RouteConstants.workerProfileEdit);
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
                  ),

                ],
              ),
            ));
  }
}



