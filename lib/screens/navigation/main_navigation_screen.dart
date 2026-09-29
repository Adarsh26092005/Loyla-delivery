import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../const/app_colors.dart';
import '../home/home_screen.dart';
import '../orders/orders_screen.dart';
import '../earnings/earnings_screen.dart';
import '../profile/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key, this.pageIndex});

  final int? pageIndex;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _page = widget.pageIndex ?? 0;

  static const _tabLabel = TextStyle(
    color: Colors.white,
    fontSize: 7,
    fontWeight: FontWeight.bold,
  );

  static const _icons = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.house, color: Colors.white),
        Text('Home', style: _tabLabel),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.receipt, color: Colors.white),
        Text('Orders', style: _tabLabel),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.wallet, color: Colors.white),
        Text('Earnings', style: _tabLabel),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(FontAwesomeIcons.user, color: Colors.white),
        Text('Profile', style: _tabLabel),
      ],
    ),
  ];

  static const _screens = [
    HomeScreen(),
    OrdersScreen(),
    EarningsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Positioned.fill(child: _screens[_page]),
      bottomNavigationBar: SafeArea(
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          height: 65,
          color: AppColors.primary,
          onTap: (index) => setState(() => _page = index),
          index: _page,
          items: _icons,
        ),
      ),
    );
  }
}
