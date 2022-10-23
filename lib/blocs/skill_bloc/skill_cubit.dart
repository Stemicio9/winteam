import 'dart:convert';

import 'package:retrofit/retrofit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/StateConstants.dart';
import '../../entities/skill_entity.dart';
import '../skill_api_service/skill_api_service.dart';

part 'skill_cubit_state.dart';

class SkillCubit extends Cubit<SkillState> {
  SkillCubit() : super(SkillListLoading());

  SkillEntity selectedEntity = SkillEntity();

  final SkillEntity _skill = SkillEntity();
  SkillEntity get skill => _skill;

  void getSkillListByFilter(Filter filter) async {
    emit(SkillListLoading());
    try {
      HttpResponse<dynamic> result = await skillListApiService.getSkillListByFilter(filter);
      var encoded = jsonEncode(result.data);
      print(encoded);
      var json = (jsonDecode(encoded) as List)
          .map((data) => SkillEntity.fromJson(data))
          .toList();

      emit(SkillListLoaded(json));

    } catch (e) {
      print(e.toString());
      emit(SkillListError());
    }
  }





}