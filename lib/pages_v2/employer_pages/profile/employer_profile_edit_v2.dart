import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/cancel_button.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/image_profile.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_header_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_info_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/save_button.dart';
import 'package:winteam/utils/size_utils.dart';

class EmployerProfileEditV2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployerProfileV2EditState();
  }
}

class EmployerProfileV2EditState extends State<EmployerProfileEditV2> {
  final _formKey = GlobalKey<FormState>();
  var name = 'Azienda srl';
  var headerDescription = 'Società di servizi';
  var phone = '+39 9876543210';
  var email = 'mario.rossinettini@libeotto.com';
  var position = 'Milan, Italy';
  var description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices ';

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController headerDescriptionTextController =
      TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController positionTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameTextController.text = name;
    headerDescriptionTextController.text = headerDescription;
    phoneTextController.text = phone;
    emailTextController.text = email;
    positionTextController.text = position;
    descriptionTextController.text = description;
    return W1nScaffold(
        title: PROFILE,
        appBar: 1,
        body: SingleChildScrollView(
          child: Padding(
            padding: getPadding(bottom: 35),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const ImageProfile(
                    imageHeight: 200,
                    imageWidth: 200,
                    innerImageHeight: 190,
                    innerImageWidth: 190,
                    innerImageRadius: 100,
                    topMargin: 46,
                    iconHeight: 45,
                    iconWidth: 45,
                  ),
                  ProfileHeaderEdit(
                    nameTextController: nameTextController,
                    headerDescriptionTextController:
                        headerDescriptionTextController,
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
            ),
          ),
        ));
  }

  formSubmit() async {
    if (_formKey.currentState!.validate()) {
      {Navigator.pop(context);}
    }
  }
}
