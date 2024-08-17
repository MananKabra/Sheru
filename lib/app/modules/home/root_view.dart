import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/auth/controllers/auth_controller.dart';
import 'package:get_flutter_fire/app/modules/home/controllers/root_controller.dart';
import 'package:get_flutter_fire/app/modules/home/home_screen.dart';
import 'package:get_flutter_fire/app/routes/app_routes.dart';
import 'package:get_flutter_fire/models/user_model.dart';
import 'package:get_flutter_fire/theme/app_theme.dart';

class RootView extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final RootController rootController = Get.put(RootController());

  final List<Widget> _buyerTabs = [
    const HomeScreen(),
    const Center(child: Text('Cart')),
    const Center(child: Text('Profile')),
  ];

  final List<Widget> _sellerTabs = [
    const HomeScreen(),
    const Center(child: Text('Cart')),
    const Center(child: Text('Profile')),
    const Center(child: Text('Manage Products')),
  ];

  RootView({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = authController.user!;

    List<Widget> currentTabs =
        user.userType == UserType.seller ? _sellerTabs : _buyerTabs;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, ${user.name}',
          style: AppTheme.fontStyleMedium.copyWith(color: AppTheme.colorWhite),
        ),
        backgroundColor: AppTheme.colorRed,
        leading: null,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.clearUserData();
              Get.offAllNamed(Routes.WELCOME);
            },
          )
        ],
      ),
      body: Obx(() => currentTabs[rootController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: rootController.selectedIndex.value,
          onTap: (index) => rootController.changeTabIndex(index),
          backgroundColor: AppTheme.colorWhite,
          selectedItemColor: AppTheme.colorRed,
          unselectedItemColor: AppTheme.greyTextColor,
          selectedLabelStyle:
              AppTheme.fontStyleSmall.copyWith(color: AppTheme.colorRed),
          unselectedLabelStyle: AppTheme.fontStyleSmall,
          type: BottomNavigationBarType.fixed,
          items: _buildBottomNavItems(user.userType),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavItems(UserType userType) {
    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Cart',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];

    if (userType == UserType.seller) {
      items.add(const BottomNavigationBarItem(
        icon: Icon(Icons.store),
        label: 'Manage Products',
      ));
    }

    return items;
  }
}
