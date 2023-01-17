import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/blocs/dashboard_tab_index_bloc/tab_index_bloc.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/ads/employer_ads.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/create_ads.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/search_workers.dart';
import 'package:winteam/pages_v2/layout/widgets/bottom_bar_element.dart';
import 'package:winteam/pages_v2/worker_pages/ads/worker_ads_applicant.dart';
import 'package:winteam/pages_v2/worker_pages/ads/worker_ads_v2.dart';
import 'package:winteam/pages_v2/worker_pages/profile/worker_profile_v2.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';
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
            return Center(child: loadingGif());
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

  final List<Color> backgroundColors;
  final List<String> titles;

  const DashboardLayout(
      {Key? key,
      required this.pages,
      required this.buttons,
      required this.maxCount,
      required this.datore,
      required this.titles,
        required this.backgroundColors
      })
      : super(key: key);

  @override
  DashboardLayoutState createState() {
    return DashboardLayoutState();
  }
}

class DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {

  TabIndexCubit get _tabIndexCubit => context.read<TabIndexCubit>();

  var _pageController;

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
    return BlocBuilder<TabIndexCubit, TabIndexState>(
      builder: (context, state) {
        _pageController = PageController(initialPage: state.index);
        return WillPopScope(
          onWillPop: () async => false,

          child: W1nScaffold(
            title: widget.titles[state.index],
            backgroundColor: widget.backgroundColors[state.index],
            appBar: 2,
            body: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: widget.pages),
            bottomNavigationBar: widget.datore
                ? bottomNavigationDatore(state.index)
                : bottomNavigationLavoratore(state.index),
          ),
        );
      },
    );
  }

  Widget bottomNavigationLavoratore(int currentTabIndex) {
    return CircleNavBar(
      activeIcons: const [
        Icon(Icons.newspaper_rounded, color: white),
        Icon(Icons.ads_click, color: white),
        Icon(Icons.person, color: white),
      ],
      inactiveIcons: [
        Texth4V2(testo: ADS, color: white),
        Texth4V2(testo: WORKER_PERSONAL_ADS, color: white),
        Texth4V2(testo: PROFILE, color: white),
      ],
      circleColor: green,
      color: background,
      height: 60,
      circleWidth: 60,
      activeIndex: currentTabIndex,
      onTap: (index) {
        _tabIndexCubit.setTabIndex(index);
        _pageController.jumpToPage(index);
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

  Widget bottomNavigationDatore(int currentTabIndex) {
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
      activeIndex: currentTabIndex,
      onTap: (index) {
        _tabIndexCubit.setTabIndex(index);
        _pageController.jumpToPage(index);
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
    var workerAds = WorkerAdsV2();
    var workerProfile = WorkerProfileV2Widget();
    var workerPersonalAds = WorkerAdsApplicant();
    var workwerPersonalAdsTitle = WORKER_PERSONAL_ADS;
    var workwerAdsTitle = ADS;
    var workerProfileTitle = PROFILE;
    var workwerAdsColor = lightGrey;
    var workerProfileColor = white;

    var button3 = BottomBarElement(
      activeElement: const Icon(Icons.newspaper_rounded, color: white),
      inactiveElement: Texth4V2(testo: ADS, color: white),
    );

    var button4 = BottomBarElement(
      activeElement: const Icon(Icons.person, color: white),
      inactiveElement: Texth4V2(testo: PROFILE, color: white),
    );

    var button5 = BottomBarElement(
      activeElement: const Icon(Icons.ads_click, color: white),
      inactiveElement: Texth4V2(testo: WORKER_PERSONAL_ADS, color: white),
    );

    return DashboardLayout(
      datore: false,
      maxCount: 4,
      titles: [
        workwerAdsTitle,
        workwerPersonalAdsTitle,
        workerProfileTitle,
      ],
      pages: [
        workerAds,
        workerPersonalAds,
        workerProfile,
      ],
      buttons: [
        button3,
        button5,
        button4,
      ],
      backgroundColors: [
        workwerAdsColor,
        workwerAdsColor,
        workerProfileColor,
      ],
    );
  }
}

class DatoreLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var employerAds = EmployerAds();
    var searchWorkers = SearchWorkers();
    var createAds = CreateAdsWidget();
    var employerProfile = WorkerProfileV2Widget(datore: true);

    var employerAdsTitle = POSTED_ADS;
    var searchWorkersTitle = SEARCH_WORKER;
    var createAdsTitle = CREATE_ADS;
    var employerProfileTitle = PROFILE;

    var employerAdsColor = lightGrey;
    var searchWorkersColor = lightGrey;
    var createAdsColor = white;
    var employerProfileColor = white;


    var button1 = BottomBarElement(
      activeElement: const Icon(Icons.newspaper_rounded, color: white),
      inactiveElement: Texth4V2(testo: ADS, color: white),
    );

    var button2 = BottomBarElement(
      activeElement: const Icon(Icons.search_rounded, color: white),
      inactiveElement: Texth4V2(testo: SEARCH, color: white),
    );

    var button3 = BottomBarElement(
      activeElement: const Icon(Icons.add_circle_outline_rounded, color: white),
      inactiveElement: Texth4V2(testo: CREATE, color: white),
    );

    var button4 = BottomBarElement(
      activeElement: const Icon(Icons.person, color: white),
      inactiveElement: Texth4V2(testo: PROFILE, color: white),
    );

    return DashboardLayout(
      datore: true,
      maxCount: 4,
      titles: [
        employerAdsTitle,
        searchWorkersTitle,
        createAdsTitle,
        employerProfileTitle,
      ],
      backgroundColors: [
        employerAdsColor,
        searchWorkersColor,
        createAdsColor,
        employerProfileColor,
      ],
      pages: [
        employerAds,
        searchWorkers,
        createAds,
        employerProfile,
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
