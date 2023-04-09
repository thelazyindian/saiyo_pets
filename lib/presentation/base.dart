import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:saiyo_pets/constants/dimens.dart';
import 'package:saiyo_pets/core/di/injectable.dart';
import 'package:saiyo_pets/presentation/history/history_page.dart';
import 'package:saiyo_pets/presentation/home/cubit/nav_cubit.dart';
import 'package:saiyo_pets/presentation/home/home_page.dart';
import 'package:saiyo_pets/presentation/liked/liked_page.dart';
import 'package:saiyo_pets/presentation/settings/settings_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<NavCubit, NavState>(
      bloc: getIt<NavCubit>(),
      listenWhen: (previous, current) => previous.route != current.route,
      listener: (context, state) {
        state.route.fold(
          () => null,
          (route) => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => route),
          ),
        );
      },
      builder: (context, navState) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: colorScheme.background,
          ),
          child: PersistentTabView(
            context,
            controller: _controller,
            screens: const [
              HomePage(),
              HistoryPage(),
              LikedPage(),
              SettingsPage(),
            ],
            items: _navBarsItems(),
            hideNavigationBar: navState.hideNavigationBar,
            confineInSafeArea: true,
            backgroundColor: colorScheme.background,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: false,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Dimens.rc16,
                topRight: Dimens.rc16,
              ),
              border: Theme.of(context).brightness == Brightness.dark
                  ? Border.all(
                      color: colorScheme.secondary,
                      width: 1.5,
                    )
                  : null,
              colorBehindNavBar: colorScheme.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style12,
          ),
        );
      },
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final colorScheme = Theme.of(context).colorScheme;

    return [
      PersistentBottomNavBarItem(
        icon: const Icon(EvaIcons.home),
        title: "Home",
        activeColorPrimary: colorScheme.primary,
        inactiveColorPrimary: colorScheme.onBackground,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(EvaIcons.list),
        title: "History",
        activeColorPrimary: colorScheme.primary,
        inactiveColorPrimary: colorScheme.onBackground,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(EvaIcons.heart),
        title: "Liked",
        activeColorPrimary: colorScheme.primary,
        inactiveColorPrimary: colorScheme.onBackground,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(EvaIcons.settings),
        title: "Settings",
        activeColorPrimary: colorScheme.primary,
        inactiveColorPrimary: colorScheme.onBackground,
      ),
    ];
  }
}
