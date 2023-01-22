import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/blocs/firebase_storage/firebase_storage_bloc.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
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
import 'package:winteam/widgets_v2/loading_gif.dart';

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
  FirebaseStorageCubit get _firebaseStorageCubit => context.read<FirebaseStorageCubit>();
  UserCubit get _userCubit => context.read<UserCubit>();

  XFile? imageFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isOnlyView) {
      return content(widget.currentUser?.imageLink ?? ImageConstant.placeholderUserUrl,
          widget.currentUser ?? UserEntity());
    } else {
      return BlocBuilder<UserCubit, UserState>(
          builder: (_, stateUser) {
            if (stateUser is UserLoaded) {
              return BlocBuilder<FirebaseStorageCubit, FirebaseStorageState>(
                builder: (_, state) {
                  if (state is FirebaseStorageLoaded) {
                    if (state.toUpload) {
                      _userCubit.update(stateUser.user.copyWith(imageLink: state.imageUrl));
                      _firebaseStorageCubit.uploaded(state.imageUrl);
                    }
                    //_authCubit.persistAuthentication(widget.currentUser!.copyWith(imageLink: state.imageUrl));
                    return content(state.imageUrl, stateUser.user);
                  } else {
                    return content(stateUser.user.imageLink ?? ImageConstant.placeholderUserUrl, stateUser.user);
                  }
                },
              );
            } else {
              return Center(child: loadingGif(logoBlue: true));
            }
          });
    }
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
            EmployerNameHeader(
                isOnlyView: widget.isOnlyView,
                message: 'Valutazione: ${user.rating?.toStringAsFixed(1) ?? 0}/5',
                rating: user.rating ?? 0,
                name: verifyValName(user.companyName ?? "",EMPTY_COMPANY_NAME,EMPTY_NAME_ONLYVIEW),
                description: verifyValName( user.brief ?? "",EMPTY_BRIEF,EMPTY_BRIEF_ONLYVIEW ),
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
                    description: verifyValName( user.description ?? "",EMPTY_DESCRIPTION,EMPTY_DESCRIPTION_ONLYVIEW ),

                  ),
                  ProfileInfo(
                    title: OUR_CONTACTS,
                    email: verifyValName( user.email ?? "",EMPTY_EMAIL,EMPTY_EMAIL_ONLYVIEW ),
                    position: verifyValName( user.address ?? "",EMPTY_POSITION,EMPTY_POSITION_ONLYVIEW ),
                    phone: verifyValName( user.phoneNumber ?? "",EMPTY_PHONE,EMPTY_PHONE_ONLYVIEW ),

                  )
                ],
              ),
            )
          ],
        ));
  }

  openGallery(String userId) {
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
    _firebaseStorageCubit.saveImageToFirebase(imageFile!, id);
  }


  // this method checks if a field is empty or not and if we are in
  // the view-only profile or not, and populates them.
  verifyValName(String? valName, String text, String textOnlyView){
    print("CIAO CIAO CIAO");
    String result = !widget.isOnlyView
        ? ((valName != null && valName.isNotEmpty) ? valName : text)
        : ((valName != null && valName.isNotEmpty) ? valName : textOnlyView);
    return result;
  }

}
