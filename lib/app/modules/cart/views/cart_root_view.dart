import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/cart/controllers/cart_controller.dart';
import 'package:get_flutter_fire/app/modules/cart/views/checkout_view.dart';
import 'package:get_flutter_fire/app/modules/cart/views/select_address_view.dart';
import 'package:get_flutter_fire/app/modules/cart/views/select_payment_method_view.dart';
import 'package:get_flutter_fire/app/widgets/common/spacing.dart';
import 'package:get_flutter_fire/theme/app_theme.dart';

class CartRootView extends StatelessWidget {
  const CartRootView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const CheckoutView(),
      const SelectAddressView(),
      const SelectPaymentMethodView(),
    ];

    final cartController = Get.find<CartController>();

    return Obx(() => Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: AppTheme.paddingSmall,
              child: Column(
                children: [
                  const Spacing(size: AppTheme.spacingLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => cartController.changePageIndex(0),
                          child: Column(
                            children: [
                              Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  borderRadius: AppTheme.borderRadius,
                                  color: cartController.pageIndex >= 0
                                      ? AppTheme.colorRed
                                      : AppTheme.backgroundColor,
                                ),
                              ),
                              const Spacing(size: AppTheme.spacingTiny),
                              const Text("Checkout"),
                            ],
                          ),
                        ),
                      ),
                      const Spacing(
                          size: AppTheme.spacingTiny, isHorizontal: true),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => cartController.changePageIndex(1),
                          child: Column(
                            children: [
                              Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  borderRadius: AppTheme.borderRadius,
                                  color: cartController.pageIndex >= 1
                                      ? AppTheme.colorRed
                                      : AppTheme.backgroundColor,
                                ),
                              ),
                              const Spacing(size: AppTheme.spacingTiny),
                              const Text("Address"),
                            ],
                          ),
                        ),
                      ),
                      const Spacing(
                          size: AppTheme.spacingTiny, isHorizontal: true),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => cartController.changePageIndex(2),
                          child: Column(
                            children: [
                              Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  borderRadius: AppTheme.borderRadius,
                                  color: cartController.pageIndex == 2
                                      ? AppTheme.colorRed
                                      : AppTheme.backgroundColor,
                                ),
                              ),
                              const Spacing(size: AppTheme.spacingTiny),
                              const Text("Payment"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacing(size: AppTheme.spacingDefault),
                  if (cartController.pageIndex < 3)
                    pages[cartController.pageIndex],
                ],
              ),
            ),
          ),
          // bottomNavigationBar: CartBottomButton(
          //   bannerText: context.loc.cartUsp,
          //   input: formatCurrency(cartProvider.totalPrice),
          //   label: _getButtonLabel(),
          //   onPressed: _onBottomButtonPressed,
          // ),
        ));
  }
}
