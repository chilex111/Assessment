
import 'package:assesment_project/feature/explore/explore_page.dart';
import 'package:assesment_project/res/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../routing/not_found_screen.dart';
import 'dashboard_provider.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(selectedBottomNavIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          ExplorePage(), // Display ExplorePage for index 0
          NotFoundScreen(),
          NotFoundScreen(),
          NotFoundScreen(),
          NotFoundScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.tertiaryBlack,
        unselectedItemColor: AppColor.disabledColor,
        currentIndex: selectedIndex,
        onTap: (index){
          ref.read(selectedBottomNavIndexProvider.notifier).update((state) => index);
        },
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Portfolio"),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: "Earn"),
          BottomNavigationBarItem(icon: Icon(Icons.money_off), label: "Spend"),
          BottomNavigationBarItem(icon: Icon(Icons.connect_without_contact), label: "Connect"),
        ],
      ),
    );
  }


}

