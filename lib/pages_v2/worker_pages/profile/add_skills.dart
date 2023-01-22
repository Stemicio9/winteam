import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/add_skills_autocomplete.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

class AddSkills extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddSkillsState();
  }
}

class AddSkillsState extends State<AddSkills> {
  SkillCubit get _skillCubit => context.read<SkillCubit>();

  final TextEditingController skillsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _skillCubit.getSkillList();
  }

  @override
  Widget build(BuildContext context) {
    return W1nScaffold(
        appBar: 1,
        title: ADD_SKILLS,
        body: BlocBuilder<SkillCubit, SkillState>(builder: (_, state) {
          if (state is SkillListLoading) {
            return Center(child: loadingGif());
          } else if (state is SkillListLoaded) {
            return AddSkillsAutocomplete(
              skillsController: skillsController,
              onSelection: saveNewSkill,
              kOptions: formatSkillForSelection(state.skillList),
            );
          } else if (state is SkillListError) {
            return const Center(child: Text('Errore nel caricamento skill.'));
          } else {
            return const Center(
                child: Text('Stato non definito nel caricamento skill.'));
          }
        }));
  }


  saveNewSkill(SkillEntity skill) {
    Navigator.pop(context, skill);
  }



  List<SkillEntity> formatSkillForSelection(List<SkillEntity> skills){
    print("CIAO AAAA");
    print(ModalRoute.of(context)?.settings.arguments);
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    var currentUser = (arguments['user'] as UserEntity).copyWith();
    List<SkillEntity> userSkillList = currentUser.skillList ?? [];
    List<SkillEntity> result = skills.where((element) => !userSkillList.contains(element)).toList();
    return result;
  }
}
