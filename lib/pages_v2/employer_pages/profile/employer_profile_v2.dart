import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/blocs/firebase_storage/firebase_storage_bloc.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/employer_pages/profile/widget/employer_name_header.dart';
import 'package:winteam/pages_v2/employer_pages/profile/widget/manage_subscription_dialog.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/image_profile.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_info.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';

class EmployerProfile extends StatefulWidget {
  final bool isOnlyView;
  UserEntity? currentUser;

  EmployerProfile({this.isOnlyView = false, this.currentUser});

  @override
  State<StatefulWidget> createState() {
    return EmployerProfileState();
  }
}

class EmployerProfileState extends State<EmployerProfile> {
  FirebaseStorageCubit get _firebaseStorageCubit =>
      context.read<FirebaseStorageCubit>();
  UserEntity currentUser = UserEntity();

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
                    return content(stateUser.user.imageLink ?? ImageConstant.placeholderUserUrl, stateUser.user);
                  }
                },
              );
            } else {
              return const Center(child: Text("ERRORE DI AUTENTICAZIONE"));
            }
          });
    }
  }


  Widget content(String imageLink, UserEntity user){

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
            EmployerNameHeader(
                isOnlyView: widget.isOnlyView,
                message: 'Valutazione: ${user.rating?.toStringAsFixed(1) ?? 0}/5',
                rating: user.rating ?? 0,
                name: user.companyName ?? '',
                description: user.brief ?? '',
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
            Expanded(
              child: ListView(
                children: [

                  ProfileDescription(
                    title: ABOUT_US,
                    description: user.description ?? '',
                  ),
                  ProfileInfo(
                    title: OUR_CONTACTS,
                    email: user.email ?? '',
                    position: user.address ?? '',
                    phone: user.phoneNumber ?? '',
                  )
                ],
              ),
            )

          ],
        )
    );
  }

  openGallery(String userId){

    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {

      setState(() {
        imageFile = value;
      });

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
}
