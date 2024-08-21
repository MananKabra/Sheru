import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/auth/controllers/auth_controller.dart';
import 'package:get_flutter_fire/app/modules/home/view/home.dart';
import 'package:get_flutter_fire/app/modules/orders/views/orders.dart';
import 'package:get_flutter_fire/app/modules/profile/views/profile.dart';
import 'package:get_flutter_fire/app/modules/root/controllers/root_controller.dart';
import 'package:get_flutter_fire/app/modules/seller/views/seller.dart';
import 'package:get_flutter_fire/app/routes/app_routes.dart';
import 'package:get_flutter_fire/enums/enums.dart';
import 'package:get_flutter_fire/theme/app_theme.dart';

class RootView extends StatelessWidget {
  final AuthController authController;
  final RootController rootController;

  RootView({super.key})
      : authController = Get.find<AuthController>(),
        rootController = Get.put(RootController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.user == null) {
        Future.microtask(() => Get.offAllNamed(Routes.WELCOME));
        return const SizedBox.shrink();
      }
      final showAppBar = rootController.selectedIndex.value != 2;

      return Scaffold(
        appBar: showAppBar ? _buildAppBar() : null,
        body: _getTabContent(rootController.selectedIndex.value),
        bottomNavigationBar: _buildBottomNavigationBar(),
      );
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: _buildAppBarTitle(),
      backgroundColor: AppTheme.colorRed,
      actions: _buildAppBarActions(),
    );
  }

  Widget _buildAppBarTitle() {
    final user = authController.user!;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacingTiny),
      child: Row(
        children: [
          _getUserRoleIcon(user.userType),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome,',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
              Text(
                user.name,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          if (user.userType == UserType.seller) ...[
            const SizedBox(width: 10),
            const Icon(Icons.verified, color: Colors.yellowAccent),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {},
      ),
      if (authController.user!.userType == UserType.seller)
        IconButton(
          icon: const Icon(Icons.store, color: Colors.white),
          onPressed: () {
            // Navigate to seller-specific screens
          },
        ),
      IconButton(
        icon: const Icon(Icons.logout, color: Colors.white),
        onPressed: () {
          authController.clearUserData();
          Get.offAllNamed(Routes.WELCOME);
        },
      ),
    ];
  }

  Widget _getUserRoleIcon(UserType userType) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(
        userType == UserType.seller ? Icons.storefront : Icons.shopping_bag,
        color: AppTheme.colorRed,
        size: 28,
      ),
    );
  }

  Widget _getTabContent(int index) {
    final buyerTabs = <Widget>[
      const HomeScreen(),
      const OrdersScreen(),
      const ProfileScreen()
    ];

    final sellerTabs = <Widget>[
      const HomeScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
      SellerPage(),
      // const Center(
      //     child: Text(
      //         'Manage Products')),
    ];

    final userType = authController.user!.userType;

    return userType == UserType.seller ? sellerTabs[index] : buyerTabs[index];
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() {
      final items = _buildBottomNavItems();

      return Container(
        padding: const EdgeInsets.only(bottom: AppTheme.spacingTiny),
        decoration: BoxDecoration(
          color: AppTheme.colorWhite,
          boxShadow: AppTheme.bottomBoxShadow,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: items.map((item) {
                return Expanded(
                  child: CustomBottomNavigationBarItem(
                    icon: item.icon,
                    label: item.label!,
                    index: items.indexOf(item),
                    currentIndex: rootController.selectedIndex.value,
                    onTap: rootController.changeTabIndex,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppTheme.spacingTiny),
          ],
        ),
      );
    });
  }

  List<BottomNavigationBarItem> _buildBottomNavItems() {
    final items = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), label: 'Orders'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];

    if (authController.user!.userType == UserType.seller) {
      items.add(const BottomNavigationBarItem(
          icon: Icon(Icons.store), label: 'Sell'));
    }

    return items;
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Container(
              height: 4,
              width: 40,
              color: AppTheme.colorRed,
            ),
          const SizedBox(height: AppTheme.spacingTiny),
          IconTheme(
            data: IconThemeData(
              color: isSelected ? AppTheme.colorRed : AppTheme.greyTextColor,
              size: 28,
            ),
            child: icon,
          ),
          const SizedBox(height: AppTheme.spacingTiny),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppTheme.colorRed : AppTheme.greyTextColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
