import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:octbs_ui/controller/api/userDetails.dart';
import 'package:octbs_ui/screens/users/Customer/customer_chatlist_screen.dart';
import 'package:octbs_ui/screens/users/Customer/customer_favorite_screen.dart';
import 'package:octbs_ui/screens/users/Customer/customer_issue_list_screen_api.dart';
import 'package:octbs_ui/screens/users/Customer/customer_issue_topbar.dart';
import 'package:octbs_ui/screens/users/Customer/customer_profile_settings.dart';
import 'package:octbs_ui/screens/users/Customer/home/customer_home_screen.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'customer_issues_list_screen.dart';

class CustomerNavBar extends StatefulWidget {
  // CustomerNavBar({Key? key}) : super(key: key);


  @override
  State<CustomerNavBar> createState() => _CustomerNavBarState();
}


class _CustomerNavBarState extends State<CustomerNavBar> {


  List<Widget> _buildScreens() {
    user_details=Get.arguments[0];
    return [
      CustomerHomeScreen(),
      // IssueListApi(),
      CustomerIssuesTopBar(),
      // CustomerIssuesListScreen(),
      CustomerFavoriteScreen(),
      CustomerChatListScreen(),
      Setting(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ('home'.tr),
        activeColorPrimary: Color(0xffFF5A01),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.wrench),
        title: ('issues'.tr),
        activeColorPrimary: Color(0xffFF5A01),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ('favorite'.tr),
        activeColorPrimary: Color(0xffFF5A01),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat_sharp),
        title: ("chats".tr),
        activeColorPrimary: Color(0xffFF5A01),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("settings".tr),
        activeColorPrimary: Color(0xffFF5A01),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

// _controller = PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;
    return PersistentTabView(
      context,
      controller: _controller,
      bottomScreenMargin: screenHeight * 0.075,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: false,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
