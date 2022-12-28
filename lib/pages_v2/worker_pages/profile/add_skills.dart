import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/add_skills_autocomplete.dart';

class AddSkills extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AddSkillsState();
  }
}


class AddSkillsState extends State<AddSkills>{

  final TextEditingController skillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return W1NScaffoldSenzaAction(
      title: ADD_SKILLS,
      body: AddSkillsAutocomplete(
        skillsController: skillsController,
      )
    );
  }
}