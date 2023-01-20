import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/cancel_button.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/image_profile.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_header_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_info_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/save_button.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';

class EmployerProfileEditV2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployerProfileV2EditState();
  }
}

class EmployerProfileV2EditState extends State<EmployerProfileEditV2> {

  UserAuthCubit get _authCubit => context.read<UserAuthCubit>();
  UserCubit get _userCubit => context.read<UserCubit>();

  UserEntity currentUser = UserEntity();

  final _formKey = GlobalKey<FormState>();
  var name = 'Azienda srl';
  var headerDescription = 'Società di servizi';
  var phone = '+39 9876543210';
  var email = 'mario.rossinettini@libeotto.com';
  var position = 'Milan, Italy';
  var description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices ';

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController headerDescriptionTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController positionTextController = TextEditingController();
  final TextEditingController descriptionTextController = TextEditingController();


  inputData(){
    currentUser = (_authCubit.state as UserAuthenticated).user;

    print(currentUser);
    nameTextController.text = currentUser.companyName ?? '';
    headerDescriptionTextController.text = currentUser.brief ?? '';
    phoneTextController.text = currentUser.phoneNumber ?? '';
    emailTextController.text = currentUser.email ?? '';
    positionTextController.text = currentUser.address ?? '';
    descriptionTextController.text = currentUser.description ?? '';
  }

  @override
  void initState() {
    super.initState();
    inputData();
  }

  @override
  Widget build(BuildContext context) {

    return W1nScaffold(
        title: PROFILE,
        appBar: 1,
        body: Padding(
            padding: getPadding(bottom: 35),
            child: Form(
              key: _formKey,
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
                    urlImage: currentUser.imageLink ?? ImageConstant.placeholderUserUrl,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ProfileHeaderEdit(
                          isWorkwerProfile: false,
                          nameTextController: nameTextController,
                          headerDescriptionTextController: headerDescriptionTextController,
                        ),
                        ProfileDescriptionEdit(
                          description: ABOUT_US,
                          hinttext: DESCRIPTION,
                          descriptionTextController: descriptionTextController,
                        ),
                        ProfileInfoEdit(
                          info: OUR_CONTACTS,
                          phoneController: phoneTextController,
                          emailController: emailTextController,
                          positionController: positionTextController,
                          emailValidator: validateIsEmail,
                        ),
                        SaveButton(
                          onTap: formSubmit,
                        ),
                        CancelButton(onTap: () {
                          Navigator.pop(context);
                        }),
                      ],
                    ),
                  )


                ],
              ),
            ),
          ),
        );
  }

  formSubmit() async {
    if (_formKey.currentState!.validate()) {

      _userCubit.update(currentUser.copyWith(
        companyName: nameTextController.text,
        brief: headerDescriptionTextController.text,
        phoneNumber: phoneTextController.text,
        email: emailTextController.text,
        address: positionTextController.text,
        description: descriptionTextController.text
      ));

      Navigator.pop(context);
    }
  }
}
