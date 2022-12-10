import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/widgets/appbars.dart';

class SelectSkillPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SelectSkillPageState();
  }
}

class SelectSkillPageState extends State<SelectSkillPage> {
  SkillCubit get _cubit => context.read<SkillCubit>();

  List<SkillEntity> selectedSkills = List<SkillEntity>.empty(growable: true);

  @override
  void initState() {
    callRestWithout();
    super.initState();
  }

  void callRestWithoutFiltered(String filtro) {
    if (filtro.isEmpty) {
      callRestWithout();
      return;
    }
    Filter filter = Filter();
    filter.filterOr = "name|like_insensitive|$filtro|string";
    filter.filterOr =
        "${filter.filterOr}&firstName|like_insensitive|$filtro|string";
    filter.filterOr =
        "${filter.filterOr}&lastName|like_insensitive|$filtro|string";
    _cubit.getSkillListByFilter(filter);
  }

  void callRestWithout() {
    _cubit.getSkillListByFilter(Filter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSenzaActions(context, "Cerca Mansione"),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              onChanged: (newValue) {
                callRestWithoutFiltered(newValue);
              },
            ),
            BlocBuilder<SkillCubit, SkillState>(builder: (_, state) {
              if (state is SkillListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SkillListLoaded) {
                return skillList(state.skillList);
              } else if (state is SkillListEmpty) {
                // @todo insert an empty state element
                return Container();
              } else {
                return const Center(child: Text('Errore di caricamento'));
              }
            }),
          ],
        ),
      ),
    );
  }

  bool contained(id) {
    for (var e in selectedSkills) {
      if (e.id == id) return true;
    }
    return false;
  }

  Widget skillList(List<SkillEntity> skillList) {
    List<SkillEntity> skillListDef =
        skillList.where((e) => !contained(e.id)).toList();

    return Expanded(
        child: Column(children: [
      Expanded(
          child: ListView.builder(
              itemCount: skillListDef.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    title: Text(skillListDef[index].name ?? ""),
                  ),
                  onTap: () {
                    setState(() {
                      _cubit.selectedEntity = skillListDef[index];
                      selectedSkills.add(skillListDef[index]);
                    });
                    Navigator.pop(context, skillListDef[index]);
                  },
                );
              })),
    ]));
  }
}
