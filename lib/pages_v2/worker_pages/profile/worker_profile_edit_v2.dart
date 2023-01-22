import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
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
  UserCubit get _userCubit => context.read<UserCubit>();

  UserEntity currentUser = UserEntity();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController headerDescriptionTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController positionTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  inputData() {
    nameTextController.text = '${currentUser.firstName}';
    lastNameTextController.text = '${currentUser.lastName}';
    headerDescriptionTextController.text = currentUser.brief ?? '';
    phoneTextController.text = currentUser.phoneNumber ?? '';
    emailTextController.text = currentUser.email ?? '';
    positionTextController.text = currentUser.address ?? '';
    descriptionTextController.text = currentUser.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    currentUser = (arguments['user'] as UserEntity).copyWith();
    inputData();

    return W1nScaffold(
        appBar: 1,
        title: PROFILE,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 35),
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
                            nameTextController: nameTextController,
                            lastNameTextController: lastNameTextController,
                            headerDescriptionTextController: headerDescriptionTextController,
                          ),
                          ProfileSkillsEdit(
                            mansioni: currentUser.skillList ?? [],
                            deleteSkill: deleteSkill,
                            ontap: () async {
                              var skill = await Navigator.pushNamed(context, RouteConstants.addSkills, arguments: {"user": currentUser}) as SkillEntity;
                              setState(() {
                                setArguments();
                                (arguments['user'] as UserEntity).skillList?.add(skill);
                              });
                            },
                          ),
                          ProfileDescriptionEdit(
                            description: CHI_SONO,
                            hinttext: DESCRIPTION,
                            descriptionTextController:
                                descriptionTextController,
                          ),
                          ProfileInfoEdit(
                            info: I_MIEI_DATI,
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
                ))));
  }

  formSubmit() async {
    if (_formKey.currentState!.validate()) {

      _userCubit.update(currentUser.copyWith(
          firstName: nameTextController.text,
          lastName: lastNameTextController.text,
          brief: headerDescriptionTextController.text,
          phoneNumber: phoneTextController.text,
          email: emailTextController.text,
          address: positionTextController.text,
          description: descriptionTextController.text));

      Navigator.pop(context);
    }
  }

  deleteSkill(int index) {
    print('delete skill $index');
    setState(() {
      setArguments();
      currentUser.skillList?.removeAt(index);
    });
  }

  setArguments(){
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    arguments['user'] = (arguments['user'] as UserEntity).copyWith(
        firstName: nameTextController.text,
        lastName: lastNameTextController.text,
        brief: headerDescriptionTextController.text,
        phoneNumber: phoneTextController.text,
        email: emailTextController.text,
        address: positionTextController.text,
        description: descriptionTextController.text);
  }
}
