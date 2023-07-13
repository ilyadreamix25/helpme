import 'package:flutter/material.dart';
import 'package:helpme/home/chats/home_chats_screen.dart';
import 'package:helpme/home/feed/home_feed_screen.dart';
import 'package:helpme/home/home_bottom_content.dart';
import 'package:helpme/home/profile/home_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget> _screens;
  late int _currentScreen;

  @override
  void initState() {
    super.initState();
    _screens = const [
      HomeChatsScreen(),
      HomeFeedScreen(),
      HomeProfileScreen()
    ];
    _currentScreen = 0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: IndexedStack(
          key: ObjectKey(_screens[0].hashCode),
          index: _currentScreen,
          children: _screens,
        ),
      ),
      bottomNavigationBar: HomeBottomContent(
        bottomPadding: mediaQuery.padding.bottom,
        onClick: (screen) {
          setState(() {
            _currentScreen = screen;
          });
        },
      ),
    );
  }
}
