import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/logout/logout_dialog.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

import '../utils/image_constant.dart';

class DrawerWidgetV2 extends StatelessWidget {
  final double innerImageRadius; // 77
  final double innerImageWidth; // 90
  final double innerImageHeight; // 90
  final double imageWidth; // 90
  final double imageHeight; // 90
  final double customImageViewHeight; //26
  final double customImageViewWidth; //26

  List<String> elementList = List.empty(growable: true);

  //List<DrawerElement> elementList;

  // final String username;

  DrawerWidgetV2({
    super.key,
    this.innerImageRadius = 77,
    this.imageWidth = 90,
    this.imageHeight = 90,
    this.innerImageWidth = 90,
    this.innerImageHeight = 90,
    this.customImageViewHeight = 26,
    this.customImageViewWidth = 26,
    //  required this.username,
    //this.elementList = const []
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //  width: 260,

      child: Column(
        children: [
          Expanded(
            child: ListView(
                padding: EdgeInsets.zero, children: createElementList(context)),
          ),
          drawerFooter(context)
        ],
      ),
    );
  }

  drawerHeader() {
    return Padding(
      padding: getPadding(bottom: 20),
      child: DrawerHeader(
          decoration: const BoxDecoration(
            color: background,
          ),
          child: Padding(
            padding: getPadding(left: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: getSize(
                    imageHeight,
                  ),
                  width: getSize(
                    imageWidth,
                  ),
                  child: Stack(alignment: Alignment.bottomRight, children: [
                    CustomImageView(
                      onTap: () {},
                      imagePath: ImageConstant.imgPexelsphotoby,
                      height: getSize(
                        innerImageHeight,
                      ),
                      width: getSize(
                        innerImageWidth,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          innerImageRadius,
                        ),
                      ),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ]),
                ),
                Padding(
                  padding: getPadding(top: 20),
                  child: Texth3V2(
                    testo: 'Gianmario De Paolini',
                    color: white,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  createElementList(context) {
    String comeFunziona = COME_FUNZIONA;
    String contattaci = CONTATTACI;
    String privacyPolicy = POLICY_PRIVACY;
    String rimuoviAccount = REMOVE_ACCOUNT;
    String logout = LOGOUT;

    elementList.add(comeFunziona);
    elementList.add(contattaci);
    elementList.add(privacyPolicy);
    elementList.add(rimuoviAccount);
    elementList.add(logout);

    List<Widget> lista = List.empty(growable: true);

    lista.add(drawerHeader());

  //  lista.add(createTile(comeFunziona, () {}, context, ImageConstant.imgComeFunziona, 22, 26));

  //  lista.add(createTile(contattaci, () {}, context, ImageConstant.imgContattaci, 25, 22));

  //  lista.add(createTile(privacyPolicy, () {}, context, ImageConstant.imgPrivacyPolicy, 26, 18));

    lista.add(createTile(rimuoviAccount, () {}, context, ImageConstant.imgRemoveAccount, 27, 26));

    lista.add(createTile(logout, () {
      showDialog(
          context: context,
          barrierColor: blackDialog,
          builder: (ctx) => LogoutDialog(
            cancelOnTap: (){Navigator.pop(context);},
            confirmOnTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, RouteConstants.login);
              },
          ));
    }, context, ImageConstant.imgLogout, 27, 19));
    elementList.clear();
    return lista;
  }

  ListTile createTile(String testo, funzione, context, String svgPath,
      double height, double width) {
    return ListTile(
        horizontalTitleGap: 4,
        leading: Padding(
          padding: getPadding(left: 10),
          child: CustomImageView(
            svgPath: svgPath,
            height: getVerticalSize(
              height,
            ),
            width: getHorizontalSize(
              width,
            ),
          ),
        ),
        title: Text(
          testo,
          style: AppStyle.txtMontserratMediumBlack20,
        ),
        onTap: funzione);
  }

  drawerFooter(context) {
    return Container(
      width: 150,
      height: 150,
      padding: getPadding(bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLogo,
          ),
        ],
      ),
    );
  }
}
