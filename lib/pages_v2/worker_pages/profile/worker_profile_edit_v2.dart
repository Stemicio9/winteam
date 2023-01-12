import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/profile/data/mansione.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/cancel_button.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/image_profile.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_header_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_info_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_skills_edit.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/save_button.dart';


class WorkerProfileEditV2 extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return WorkerProfileEditV2State();
  }
}

class WorkerProfileEditV2State extends State<WorkerProfileEditV2> {

  UserAuthCubit get _authCubit => context.read<UserAuthCubit>();
  UserEntity currentUser = UserEntity();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController headerDescriptionTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController positionTextController = TextEditingController();
  final TextEditingController descriptionTextController = TextEditingController();

  final List<SkillEntity> mansioni = List.empty(growable: true);


  @override
  void initState() {
    inputData();
    fillMansioni();
    super.initState();
  }

  inputData(){
    currentUser = (_authCubit.state as UserAuthenticated).user;
    nameTextController.text = '${currentUser.firstName} ${currentUser.lastName}';
    headerDescriptionTextController.text = currentUser.brief ?? '';
    phoneTextController.text = currentUser.phoneNumber ?? '';
    emailTextController.text = currentUser.email ?? '';
    positionTextController.text = currentUser.address ?? '';
    descriptionTextController.text = currentUser.description ?? '';
  }

  @override
  Widget build(BuildContext context) {


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
                          ontap:() async {
                            var newUser = await Navigator.pushNamed(context, RouteConstants.addSkills) as UserEntity;
                            setState(() {

                              currentUser = newUser;
                              fillMansioni();
                            });
                          },
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

                       SaveButton(onTap: formSubmit),
                       CancelButton(onTap: (){Navigator.pop(context);})
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


  fillMansioni() {
    mansioni.clear();
    //iterate over currentUser.skillList
    print(currentUser);
    if(currentUser.skillList != null){
      for (var skill in currentUser.skillList!) {
        mansioni.add(skill);
      }
    }
  }


  deleteDummySkill(int index){
      setState(() {
        var currentUser = (_authCubit.state as UserAuthenticated).user;
        currentUser.skillList!.removeAt(index);
        fillMansioni();
      });
  }

}
