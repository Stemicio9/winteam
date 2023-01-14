import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/button_choose.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/candidates_list_dialog.dart';
import 'package:winteam/pages_v2/worker_pages/profile/worker_profile_v2.dart';
import 'package:winteam/utils/size_utils.dart';


class CandidateProfileChoose extends StatelessWidget {

  bool isVisible = true;


  CandidateProfileChoose();

  @override
  Widget build(BuildContext context) {

    try {
      final arguments = ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>;
      isVisible = arguments['isVisible'] == "true";
    }catch(e){
      isVisible = true;
    }

    return W1nScaffold(
      title: PROFILE,
      appBar: 1,
      body: SingleChildScrollView(
        child: Padding(
          padding: getPadding(bottom: 35),
          child: Column(
            children: [
              WorkerProfileV2(
                isOnlyView: true,
              ),

             isVisible ? Padding(
                  padding: getPadding(top: 20, left: 35, right: 35),
                  child: ButtonChoose(
                    maxWidth: MediaQuery.of(context).size.width,
                    choose: (){
                      showDialog(
                          context: context,
                          barrierColor: blackDialog,
                          builder: (ctx) => CandidatesListDialog(
                            cancelOnTap: (){Navigator.pop(context);},
                            confirmOnTap: (){Navigator.pushNamed(context, RouteConstants.candidatesList);},
                          )
                      );
                    },
                  )) : Container()
            ],
          ),
        ),
      ),
    );
  }
}
