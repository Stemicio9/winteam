import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/ads/employer_ads.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/create_ads.dart';
import 'package:winteam/pages_v2/employer_pages/profile/employer_profile_v2.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/search_workers.dart';
import 'package:winteam/pages_v2/layout/widgets/bottom_bar_element.dart';
import 'package:winteam/pages_v2/worker_pages/ads/worker_ads_v2.dart';
import 'package:winteam/pages_v2/worker_pages/profile/worker_profile_v2.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  State<DashboardWidget> createState() => DashboardWidgetState();
}

class DashboardWidgetState extends State<DashboardWidget> {
  UserAuthCubit get _authCubit => context.read<UserAuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => UserListCubit(),
        child: BlocBuilder<UserCubit, UserState>(builder: (_, state) {
          if (state is UserEmpty) {
            // todo
            // here navigate to login
            return Container();
          } else if (state is UserLoaded) {
            // todo
            // navigare verso la pagina corretta
            _authCubit.persistAuthentication(state.user);
            return BlocBuilder<UserAuthCubit, UserAuthenticationState>(
                builder: (_, __) {
              return state.user.roleId == getCurrentLanguageValue(USER_DATORE)
                  ? DatoreLayout()
                  : LavoratoreLayout();
            });


          } else if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // UserErrorAuthentication
            // todo
            // restituire form con errori in evidenza
            return Container();
          }
        }));
  }
}

class DashboardLayout extends StatefulWidget {
  final List<Widget> pages;
  final List<BottomBarElement> buttons;
  final int maxCount;
  final bool datore; // true = datore, false = lavoratore

  //insert data to fill scaffold


  const DashboardLayout(
      {Key? key,
      required this.pages,
      required this.buttons,
      required this.maxCount,
      required this.datore})
      : super(key: key);

  @override
  DashboardLayoutState createState() {
    return DashboardLayoutState();
  }
}

class DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0);
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: W1nScaffold(
        body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.pages),
        bottomNavigationBar: widget.datore
            ? bottomNavigationDatore()
            : bottomNavigationLavoratore(),
      ),
    );
  }

  Widget bottomNavigationLavoratore() {
    return CircleNavBar(
      activeIcons: const [
        Icon(Icons.newspaper_rounded, color: white),
        Icon(Icons.person, color: white),
      ],
      inactiveIcons: [
        Texth4V2(testo: ADS, color: white),
        Texth4V2(testo: PROFILE, color: white),
      ],
      circleColor: green,
      color: background,
      height: 60,
      circleWidth: 60,
      activeIndex: tabIndex,
      onTap: (index) {
        tabIndex = index;
        _pageController.jumpToPage(tabIndex);
      },
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
      ),
      elevation: 0,
    );
  }

  Widget bottomNavigationDatore() {
    return CircleNavBar(
      activeIcons: const [
        Icon(Icons.newspaper_rounded, color: white),
        Icon(Icons.search_rounded, color: white),
        Icon(Icons.add_circle_outline_rounded, color: white),
        Icon(Icons.person, color: white),
      ],
      inactiveIcons: [
        Texth4V2(testo: ADS, color: white),
        Texth4V2(testo: SEARCH, color: white),
        Texth4V2(testo: CREATE, color: white),
        Texth4V2(testo: PROFILE, color: white),
      ],
      circleColor: green,
      color: background,
      height: 60,
      circleWidth: 60,
      activeIndex: tabIndex,
      onTap: (index) {
        tabIndex = index;
        _pageController.jumpToPage(tabIndex);
      },
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
      ),
      elevation: 0,
    );
  }
}

class LavoratoreLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var page3 = WorkerAdsV2();
    var page4 = WorkerProfileV2();

    var button3 = BottomBarElement(
      activeElement: Icon(Icons.newspaper_rounded, color: white),
      inactiveElement: Texth4V2(testo: ADS, color: white),
    );

    var button4 = BottomBarElement(
      activeElement: Icon(Icons.person, color: white),
      inactiveElement: Texth4V2(testo: PROFILE, color: white),
    );

    return DashboardLayout(
      datore: false,
      maxCount: 4,
      pages: [
        page3,
        page4,
      ],
      buttons: [
        button3,
        button4,
      ],
    );
  }
}

class DatoreLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var page1 = EmployerAds();
    var page2 = SearchWorkers();
    var page3 = CreateAds();
    var page4 = EmployerProfile();

    var button1 = BottomBarElement(
      activeElement: Icon(Icons.newspaper_rounded, color: white),
      inactiveElement: Texth4V2(testo: ADS, color: white),
    );

    var button2 = BottomBarElement(
      activeElement: Icon(Icons.search_rounded, color: white),
      inactiveElement: Texth4V2(testo: SEARCH, color: white),
    );

    var button3 = BottomBarElement(
      activeElement: Icon(Icons.add_circle_outline_rounded, color: white),
      inactiveElement: Texth4V2(testo: CREATE, color: white),
    );

    var button4 = BottomBarElement(
      activeElement: Icon(Icons.person, color: white),
      inactiveElement: Texth4V2(testo: PROFILE, color: white),
    );

    return DashboardLayout(
      datore: true,
      maxCount: 4,
      pages: [
        page1,
        page2,
        page3,
        page4,
      ],
      buttons: [
        button1,
        button2,
        button3,
        button4,
      ],
    );
  }
}
