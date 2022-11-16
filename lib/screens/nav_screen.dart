import 'package:fbanime/data/data.dart';
import 'package:fbanime/models/models.dart';
import 'package:fbanime/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/widgets.dart';
import '../screens/screens.dart';
import 'package:fbanime/theme/theme.dart';

bool isToggle = true;

class NavScreen extends StatefulWidget {
  const NavScreen({
    super.key,
  });

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    MyWidget(),
    Scaffold(),
    ProfileScreen(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        floatingActionButton: SpeedDial(
          spacing: 12,
          icon: Icons.add,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          animatedIcon: AnimatedIcons.add_event,
          children: [
            SpeedDialChild(
                onTap: () => showToast('Add post!'),
                child: const Icon(Icons.post_add),
                label: 'Add Post'),
            SpeedDialChild(
                child: const Icon(Icons.chat),
                label: 'Add Discussion',
                onTap: () => showToast('Add Discussion!')),
          ],
        ),
        //indexed stack better than page view as it doesn't lag likepageview
        //as well as you remain to the last scroll place u were when user gets
        //back to the page
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Card(
          color: (brightness == Brightness.light) ? Colors.transparent : null,
          elevation: 0,
          margin: const EdgeInsets.all(0),
          child: SafeArea(
            top: false,
            bottom: true,
            child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
          ),
        ),
      ),
    );
  }

  Future showToast(String message) async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        fontSize: 18,
        backgroundColor: AppColors.secondary,
        gravity: ToastGravity.TOP);
  }
}
