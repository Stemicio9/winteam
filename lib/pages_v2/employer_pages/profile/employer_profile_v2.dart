import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/profile/widget/employer_name_header.dart';
import 'package:winteam/pages_v2/employer_pages/profile/widget/manage_subscription_dialog.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/image_profile.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_info.dart';
import 'package:winteam/utils/size_utils.dart';

class EmployerProfile extends StatefulWidget {
  final bool isOnlyView;

  EmployerProfile({this.isOnlyView = false});

  @override
  State<StatefulWidget> createState() {
    return EmployerProfileState();
  }
}

class EmployerProfileState extends State<EmployerProfile> {
  UserAuthCubit get _authCubit => context.read<UserAuthCubit>();
  UserEntity currentUser = UserEntity();

  String ratingMessage = 'Valutazione: 4/5';
  String name = "Azienda srl";
  double rating = 4.5;
  String headerDescription = "Società di servizi";
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices ';
  String phone = "+39 9876543210";
  String email = "mario.rossinettini@libeotto.com";
  String position = "Milan, Italy";
  XFile? imageFile;

  @override
  void initState() {
    super.initState();
  }

  inputData(UserEntity company) {
    if (widget.isOnlyView) {
      currentUser = company;
    } else {
      currentUser = (_authCubit.state as UserAuthenticated).user;
    }

    print(currentUser);
    name = '${currentUser.companyName}';
    headerDescription = currentUser.brief ?? '';
    phone = currentUser.phoneNumber ?? '';
    email = currentUser.email ?? '';
    position = currentUser.address ?? '';
    description = currentUser.description ?? '';
    rating = currentUser.rating ?? 0.0;
    ratingMessage = 'Valutazione: ${rating.toStringAsFixed(1)}/5';
  }

  @override
  Widget build(BuildContext context) {

    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    UserEntity company = arguments['company'] ?? UserEntity();
    inputData(company);

    return W1nScaffold(
        appBar: widget.isOnlyView ? 1 : 2,
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
                  openCamera: widget.isOnlyView ? null : openCamera,
                  openGallery: openGallery,
                ),
                EmployerNameHeader(
                    isOnlyView: widget.isOnlyView,
                    message: ratingMessage,
                    rating: rating,
                    name: name,
                    description: headerDescription,
                    sectionHeight: 110,
                    buttonOntap: () {
                      showDialog(
                          context: context,
                          barrierColor: blackDialog,
                          builder: (ctx) => ManageSubscriptionDialog());
                    },
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteConstants.employerProfileEdit);
                    }),
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
        ));
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
}
