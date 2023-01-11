import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/add_skills_autocomplete.dart';

class AddSkills extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddSkillsState();
  }
}

class AddSkillsState extends State<AddSkills> {
  UserAuthCubit get _authCubit => context.read<UserAuthCubit>();

  final TextEditingController skillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return W1nScaffold(
        appBar: 1,
        title: ADD_SKILLS,
        body: AddSkillsAutocomplete(
            skillsController: skillsController, onSelection: saveNewSkill));
  }

  saveNewSkill(SkillEntity skill) {
    var currentUser = (_authCubit.state as UserAuthenticated).user;
    if (currentUser.skillList == null) {
      currentUser.skillList = List.empty(growable: true);
      currentUser.skillList?.add(skill);
    } else {
      currentUser.skillList?.add(skill);
    }
    _authCubit.persistAuthentication(currentUser);
    Navigator.pop(context, currentUser);
  }
}
