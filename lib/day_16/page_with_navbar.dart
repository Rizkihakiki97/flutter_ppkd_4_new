import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_15/googlepage.dart';
import 'package:flutter_ppkd_4_new/day_15/homescreen.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

class PageWithNavbar extends StatefulWidget {
  const PageWithNavbar({super.key});

  @override
  State<PageWithNavbar> createState() => _PageWithNavbarState();
}

class _PageWithNavbarState extends State<PageWithNavbar>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  final int _selectedIndex = 0;
  final List<BottomNavigationBarItem> _navbarItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: "Description",
    ),
  ];

  // TabController _tabController;

  @override
  void initState() {
    super.initState();

    //// Use normal tab controller
    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();

    // _tabController.dispose();
    _motionTabBarController!.dispose();
  }

  // provides a simple custom icon widget for the MotionTabBar; replace with your SVG rendering if needed
  Widget _generateCustomIcon(String svgString) {
    // If you use flutter_svg package you could return SvgPicture.string(svgString);
    // For now return a placeholder icon.
    return const Icon(Icons.circle);
  }

  static const List<Widget> _page = [Homescreen(), Googlepage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   items: _navbarItem,
      //   onTap: (value) {
      //     setState(() {
      //       _selectedIndex = value;
      //     });
      //   },
      // ),
      body: TabBarView(
        physics:
            NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        // controller: _tabController,
        controller: _motionTabBarController,
        children: <Widget>[
          const Center(child: Text("")),
          const Center(child: Text("Home")),
          const Center(child: Text("Profile")),
          const Center(child: Text("Settings")),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller:
            _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "Home",
        useSafeArea: true, // default: true, apply safe area wrapper
        labelAlwaysVisible:
            true, // default: false, set to "true" if you need to always show labels
        labels: const ["Dashboard", "Home", "Profile", "Settings"],

        //// use default icon (with IconData)
        // icons: const [
        //   Icons.dashboard,
        //   Icons.home,
        //   Icons.people_alt,
        //   Icons.settings,
        // ],

        // use custom widget as display Icon
        iconWidgets: [
          _generateCustomIcon('<svgString>'),
          _generateCustomIcon('<svgString>'),
          _generateCustomIcon('<svgString>'),
          _generateCustomIcon('<svgString>'),
        ],

        // optional badges, length must be same with labels
        badges: [
          // Default Motion Badge Widget
          const MotionBadgeWidget(
            text: '99+',
            textColor: Colors.white, // optional, default to Colors.white
            color: Colors.blue, // optional, default to Colors.red
            size: 18, // optional, default to 18
          ),

          // custom badge Widget
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(2),
            child: const Text(
              '48',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),

          // allow null
          null,

          // Default Motion Badge Widget with indicator only
          const MotionBadgeWidget(
            isIndicator: true,
            color: Colors.blue, // optional, default to Colors.red
            size: 5, // optional, default to 5,
            show: true, // true / false
          ),
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        // tabIconColor: Colors.blue[600],
        tabIconSize: 28.0,
        tabIconSelectedSize: 32.0,
        tabSelectedColor: Colors.white,
        tabIconSelectedColor: Colors.black,
        tabBarColor: Colors.orange,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
    );
  }
}
