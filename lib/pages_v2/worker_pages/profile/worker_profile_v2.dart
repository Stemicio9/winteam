import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/blocs/firebase_storage/firebase_storage_bloc.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/employer_pages/profile/employer_profile_v2.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/image_profile.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_info.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_name_header.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_skills.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

class WorkerProfileV2Widget extends StatelessWidget {
  final bool isOnlyView;
  final bool datore;

  const WorkerProfileV2Widget({super.key, this.isOnlyView = false, this.datore = false});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    UserEntity company = arguments['company'] ?? UserEntity();
    if (isOnlyView) {
      if(!datore) {
        return WorkerProfileV2(isOnlyView: isOnlyView, currentUser: company);
      }else{
        return EmployerProfile(isOnlyView: isOnlyView, currentUser: company);
      }
    } else {
      if(!datore) {
        return WorkerProfileV2(isOnlyView: isOnlyView);
      }else{
        return EmployerProfile(isOnlyView: isOnlyView);
      }
    }
  }
}

class WorkerProfileV2 extends StatefulWidget {
  final bool isOnlyView;
  UserEntity? currentUser;

  WorkerProfileV2({super.key, this.isOnlyView = false, this.currentUser});

  @override
  State<StatefulWidget> createState() {
    return WorkerProfileV2State();
  }
}

class WorkerProfileV2State extends State<WorkerProfileV2> {
  FirebaseStorageCubit get _firebaseStorageCubit =>
      context.read<FirebaseStorageCubit>();

  XFile? imageFile;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (widget.isOnlyView) {
      return content(widget.currentUser?.imageLink ?? '',
          widget.currentUser ?? UserEntity());
    } else {
      return BlocBuilder<UserAuthCubit, UserAuthenticationState>(
          builder: (_, stateUser) {
        if (stateUser is UserAuthenticated) {
          return BlocBuilder<FirebaseStorageCubit, FirebaseStorageState>(
            builder: (_, state) {
              if (state is FirebaseStorageLoaded) {
                if (state.toUpload) {
                  _firebaseStorageCubit.update(
                      stateUser.user.copyWith(imageLink: state.imageUrl));
                }
                //_authCubit.persistAuthentication(widget.currentUser!.copyWith(imageLink: state.imageUrl));
                return content(state.imageUrl, stateUser.user);
              } else {
                return content(stateUser.user.imageLink ?? '', stateUser.user);
              }
            },
          );
        } else {
          return const Center(child: Text("ERRORE DI AUTENTICAZIONE"));
        }
      });
    }
  }

  openGallery(String userId){
    print("APRO LA GALLERY");
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      print("IMAGE PICKATA");
      setState(() {
        imageFile = value;
      });
      print("INIZIO A SALVARE SU FIREBASE");
      saveImageToFirebase(userId);
      Navigator.of(context).pop();
    });
  }

  openCamera(String userId) {
    ImagePicker().pickImage(source: ImageSource.camera).then((value) {
      setState(() {
        imageFile = value;
      });
      saveImageToFirebase(userId);
      Navigator.of(context).pop();
    });
  }

  saveImageToFirebase(String id) {
    _firebaseStorageCubit.saveImageToFirebase(
        imageFile!, id);
  }

  Widget content(String imageLink, UserEntity user) {
    return Padding(
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
            urlImage: imageLink,
            userId: user.id ?? '',
          ),
          ProfileNameHeader(
            isOnlyView: widget.isOnlyView,
            name: '${user.firstName} ${user.lastName}',
            description: user.brief ?? '',
            sectionHeight: 100,
            onTap: () {
              Navigator.pushNamed(context, RouteConstants.workerProfileEdit);
            },
          ),
          Expanded(
            child: ListView(
              children: [
                ProfileSkill(
                  mansioni: user.skillList ?? [],
                ),
                ProfileDescription(
                  title: CHI_SONO,
                  description: user.description ?? '',
                ),
                ProfileInfo(
                  title: I_MIEI_DATI,
                  phone: user.phoneNumber ?? '',
                  email: user.email ?? '',
                  position: user.address ?? '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
