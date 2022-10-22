import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';

import '../../constants/StateConstants.dart';
import '../../entities/skill_entity.dart';
import '../../widgets/appbars.dart';

class PubblicaAnnuncioDatore extends StatefulWidget {
  @override
  State<PubblicaAnnuncioDatore> createState() => PubblicaAnnuncioDatoreState();
}

class PubblicaAnnuncioDatoreState extends State<PubblicaAnnuncioDatore> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Expanded(
            child: Column(
      children: [
        MaterialButton(
            child: Text("Material Button Schiacciami"),
            onPressed: goToSelectSkill),
      ],
    )));
  }

  void goToSelectSkill() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SelectSkillPage()));
  }
}

class SelectSkillPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SelectSkillPageState();
  }
}

class SelectSkillPageState extends State<SelectSkillPage> {
  SkillCubit get _cubit => context.read<SkillCubit>();

  List<SkillEntity> selectedSkills = List<SkillEntity>.empty();

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
        body: SafeArea(
      child: Column(
        children: [
          MaterialButton(
              child: Text("refresh forte"),
              onPressed: () {
                callRestWithout();
              }),
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
    ));
  }

  Widget skillList(List<SkillEntity> skillList) {

    for (var e in skillList){
      for (var selectedSkill in selectedSkills){
        if(e.id==selectedSkill.id) skillList.remove(e);
      }
    }

    return Expanded(
        child: Container(
      child: ListView.builder(
          itemCount: skillList.length,
          itemBuilder: (context, index) {
            return Container(
              child: GestureDetector(
                child: Text(skillList[index].name ?? ""),
                onTap: (){
                  setState(() {
                    selectedSkills.add(skillList[index]);
                  });
                },
              )
            );
          }),
    ));
  }
}
