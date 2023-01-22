import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/blocs/dashboard_tab_index_bloc/tab_index_bloc.dart';
import 'package:winteam/blocs/firebase_storage/firebase_storage_bloc.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/logout/logout_dialog.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

import '../utils/image_constant.dart';

class DrawerWidgetV2 extends StatefulWidget {
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
  State<DrawerWidgetV2> createState() => DrawerWidgetV2State();
}

class DrawerWidgetV2State extends State<DrawerWidgetV2> {
  UserAuthCubit get _authCubit => context.read<UserAuthCubit>();

  UserCubit get _userCubit => context.read<UserCubit>();

  FirebaseStorageCubit get _firebaseStorageCubit => context.read<FirebaseStorageCubit>();

  TabIndexCubit get _tabIndexCubit => context.read<TabIndexCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => UserAuthCubit(),
        child: ContentDrawerWidget(
            firebaseStorageCubit: _firebaseStorageCubit,
            authCubit: _authCubit,
            userCubit: _userCubit,
            tabIndexCubit: _tabIndexCubit,
            innerImageRadius: widget.innerImageRadius,
            innerImageWidth: widget.innerImageWidth,
            innerImageHeight: widget.innerImageHeight,
            imageWidth: widget.imageWidth,
            imageHeight: widget.imageHeight,
            customImageViewHeight: widget.customImageViewHeight,
            customImageViewWidth: widget.customImageViewWidth));
  }
}

class ContentDrawerWidget extends StatelessWidget {
  final UserAuthCubit authCubit;
  final UserCubit userCubit;
  final TabIndexCubit tabIndexCubit;
  final FirebaseStorageCubit firebaseStorageCubit;
  final double innerImageRadius; // 77
  final double innerImageWidth; // 90
  final double innerImageHeight; // 90
  final double imageWidth; // 90
  final double imageHeight; // 90
  final double customImageViewHeight; //26
  final double customImageViewWidth; //26

  List<String> elementList = List.empty(growable: true);

  ContentDrawerWidget(
      {required this.authCubit,
      required this.userCubit,
      required this.tabIndexCubit,
      required this.innerImageRadius,
      required this.innerImageWidth,
      required this.innerImageHeight,
      required this.imageWidth,
      required this.imageHeight,
      required this.customImageViewHeight,
      required this.customImageViewWidth,
      required this.firebaseStorageCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        return Drawer(
          //  width: 260,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                    padding: EdgeInsets.zero,
                    children: createElementList(context, state)),
              ),
              drawerFooter(context)
            ],
          ),
        );
      }
    );
  }

  drawerHeader(String username, String imageLink) {
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
                Expanded(
                  child: Container(
                    height: getSize(
                      imageHeight,
                    ),
                    width: getSize(
                      imageWidth,
                    ),
                    child: Stack(alignment: Alignment.bottomRight, children: [
                      CustomImageView(
                        onTap: () {},
                        url: imageLink,
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
                ),
                Padding(
                  padding: getPadding(bottom: 5),
                  child: Texth3V2(
                    testo: username,
                    color: white,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  createElementList(context, state) {
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

    var username = 'Username';
    var imageLink = '';
    if (state is UserLoaded) {
      var u = state.user;
      if(u.roleId == USER_LAVORATORE){
      username = '${u.firstName} ${u.lastName}';
      }else {
        username = u.companyName!;
      }
      if(username.isEmpty){
        //todo add here username not inserted
       // username =
      }
      imageLink = u.imageLink ?? '';
    }
    print("SONO NEL DRAWER");
    print(imageLink);


    lista.add(drawerHeader(username, imageLink));

    //  lista.add(createTile(comeFunziona, () {}, context, ImageConstant.imgComeFunziona, 22, 26));

    //  lista.add(createTile(contattaci, () {}, context, ImageConstant.imgContattaci, 25, 22));

    //  lista.add(createTile(privacyPolicy, () {}, context, ImageConstant.imgPrivacyPolicy, 26, 18));

    lista.add(createTile(rimuoviAccount, () {}, context,
        ImageConstant.imgRemoveAccount, 27, 26));

    lista.add(createTile(logout, () {
      showDialog(
          context: context,
          barrierColor: blackDialog,
          builder: (ctx) => LogoutDialog(
                cancelOnTap: () {
                  Navigator.pop(context);
                },
                confirmOnTap: () {
                  logoutFromAll();
                  Navigator.pushReplacementNamed(context, RouteConstants.login);
                },
              ));
    }, context, ImageConstant.imgLogout, 27, 19));
    elementList.clear();
    return lista;
  }

  void logoutFromAll() {
    FirebaseAuth.instance.signOut();
    userCubit.logout();
    globalUser = null;
    authCubit.logout();
    tabIndexCubit.setTabIndex(0);
    firebaseStorageCubit.clear();
    filterAnnunciLavoratore = FilterAnnunciLavoratore();
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
