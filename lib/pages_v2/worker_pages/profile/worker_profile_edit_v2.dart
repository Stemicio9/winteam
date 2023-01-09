import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/profile/data/mansione.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/cancel_button.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/image_profile.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_header_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_info_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_skills_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/save_button.dart';
import 'package:winteam/utils/image_constant.dart';


class WorkerProfileEditV2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WorkerProfileEditV2State();
  }
}

class WorkerProfileEditV2State extends State<WorkerProfileEditV2> {


  final _formKey = GlobalKey<FormState>();
  var name = 'Mario Rossinettini';
  var headerDescription = 'Digital Creator';
  var phone = '+39 9876543210';
  var email = 'mario.rossinettini@libeotto.com';
  var position = 'Milan, Italy';
  var description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices ';



  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController headerDescriptionTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController positionTextController = TextEditingController();
  final TextEditingController descriptionTextController = TextEditingController();



  final List<Mansione> mansioni = List.empty(growable: true);


  @override
  void initState() {
    fillDummyMansioni();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nameTextController.text = name;
    headerDescriptionTextController.text = headerDescription;
    phoneTextController.text = phone;
    emailTextController.text = email;
    positionTextController.text = position;
    descriptionTextController.text = description;

    return W1nScaffold(
        appBar: 2,
        title: PROFILE,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 35),
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
                            headerDescriptionTextController: headerDescriptionTextController,
                        ),

                        ProfileSkillsEdit(
                          mansioni: mansioni,
                          deleteSkill: deleteDummySkill,
                          ontap:() {Navigator.pushNamed(context, RouteConstants.addSkills);},
                        ),


                        ProfileDescriptionEdit(
                          description: CHI_SONO,
                          hinttext: DESCRIPTION,
                          descriptionTextController: descriptionTextController,
                        ),


                        ProfileInfoEdit(
                          info: I_MIEI_DATI,
                          phoneController: phoneTextController,
                          emailController: emailTextController,
                          positionController: positionTextController,
                          emailValidator: validateIsEmail,
                        ),

                       CancelButton(onTap: (){Navigator.pop(context);}),

                       SaveButton(onTap: formSubmit)
                      ],
                    )
                )
            )
        )
    );
  }


  formSubmit() async {
    if (_formKey.currentState!.validate()) {
      {Navigator.pop(context);}
    }
  }


  fillDummyMansioni() {
    mansioni.clear();
    for (int i = 0; i < 4; i++) {
      mansioni.add(Mansione(icon: ImageConstant.imgBag, text: '$Mansione $i'));
    }
  }


  deleteDummySkill(int index){
      setState(() {
        mansioni.removeAt(index);
      });
  }

}
