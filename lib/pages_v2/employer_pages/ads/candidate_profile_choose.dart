import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_user_list/annunci_user_list_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/button_choose.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/candidates_list_dialog.dart';
import 'package:winteam/pages_v2/worker_pages/profile/worker_profile_v2.dart';
import 'package:winteam/utils/size_utils.dart';

class CandidateProfileChoose extends StatelessWidget {
  bool isVisible = true;
  late AnnunciEntity annuncio;
  late UserEntity visiting;

  CandidateProfileChoose();

  @override
  Widget build(BuildContext context) {
    AnnunciUserListCubit cubit = context.read<AnnunciUserListCubit>();

    try {
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;
      isVisible = arguments['isVisible'] == "true";
      annuncio = arguments['annuncio'];
      visiting = arguments['company'] ?? UserEntity();
    } catch (e) {}

    return W1nScaffold(
        title: PROFILE,
        appBar: 1,
        body: Padding(
          padding: getPadding(bottom: 35),
          child: Column(
            children: [
              const Expanded(
                child: WorkerProfileV2Widget(
                  isOnlyView: true,
                ),
              ),
              Visibility(
                  visible: isVisible,
                  child: Padding(
                      padding: getPadding(top: 20, left: 35, right: 35),
                      child: ButtonChoose(
                        maxWidth: MediaQuery.of(context).size.width,
                        choose: () {
                          showDialog(
                              context: context,
                              barrierColor: blackDialog,
                              builder: (ctx) => CandidatesListDialog(
                                    cancelOnTap: () {
                                      Navigator.pop(context);
                                    },
                                    confirmOnTap: () {
                                      cubit.matchUser(
                                          visiting.id!, annuncio.id!);
                                      Navigator.popUntil(
                                          context,
                                          ModalRoute.withName(
                                              RouteConstants.candidatesList));
                                    },
                                  ));
                        },
                      )))
            ],
          ),
        ));
  }
}
