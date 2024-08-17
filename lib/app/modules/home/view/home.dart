import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter_fire/app/modules/auth/controllers/auth_controller.dart';
import 'package:get_flutter_fire/app/modules/home/controllers/home_controller.dart';
import 'package:get_flutter_fire/app/widgets/common/overlay_loader.dart';
import 'package:get_flutter_fire/app/widgets/common/secondary_button.dart';
import 'package:get_flutter_fire/app/widgets/common/spacing.dart';
import 'package:get_flutter_fire/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const LoadingWidget();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildCarousel(homeController),
                _buildCategories(homeController),
                _buildOffers(homeController),
                // ElevatedButton(
                //   onPressed: () async {
                //     final offer = OfferModel(
                //       id: 'offer2thane', // Generate or provide a unique ID
                //       title: 'Thanekar special',
                //       description: 'Enjoy a special discount in Jaipur.',
                //       imageUrl: '',
                //       city: 'Thane',
                //       validFrom: DateTime.now(),
                //       validTo: DateTime.now().add(
                //           const Duration(days: 30)), // Example validity period
                //     );

                //     // Assuming you have a method to upload the offer to Firestore
                //     await firestore.collection('offers').add(offer.toMap());

                //     Get.snackbar('Success', 'Offer uploaded successfully');
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.blue, // Customize the button color
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 20, vertical: 15),
                //     textStyle: const TextStyle(fontSize: 16),
                //   ),
                //   child: const Text('Upload Offer for Mumbai'),
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Welcome, ${Get.find<AuthController>().user!.name}',
                    style: AppTheme.fontStyleLarge.copyWith(
                      color: AppTheme.colorBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _buildCarousel(HomeController homeController) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
      items: homeController.banners.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(banner.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCategories(HomeController homeController) {
    return Padding(
      padding: AppTheme.paddingDefault,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: AppTheme.fontStyleLarge.copyWith(
                  color: AppTheme.colorBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SecondaryButton(
                label: "See All",
                onPressed: () {},
              ),
            ],
          ),
          const Spacing(size: AppTheme.fontSizeDefault),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homeController.categories.length,
              itemBuilder: (context, index) {
                final category = homeController.categories[index];
                return Column(
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(category.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      category.name,
                      style: AppTheme.fontStyleDefault.copyWith(
                        color: AppTheme.colorBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOffers(HomeController homeController) {
    return Padding(
      padding: AppTheme.paddingDefault,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Offers For You",
                style: AppTheme.fontStyleLarge.copyWith(
                  color: AppTheme.colorBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SecondaryButton(
                label: "See All",
                onPressed: () {},
              ),
            ],
          ),
          const Spacing(size: AppTheme.fontSizeDefault),
          Obx(() {
            // Check if offers list is empty
            if (homeController.offers.isEmpty) {
              return Text(
                "No offers available at the moment.",
                style: AppTheme.fontStyleDefault.copyWith(
                  color: AppTheme.colorBlack,
                ),
              );
            }

            return CarouselSlider.builder(
              itemCount: homeController.offers.length,
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  homeController.onPageChanged(index, reason);
                },
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final offer = homeController.offers[index];
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150.0,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(offer.imageUrl),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Flexible(
                      child: Text(
                        offer.title,
                        style: AppTheme.fontStyleDefault.copyWith(
                          color: AppTheme.colorBlack,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              },
            );
          }),
          const SizedBox(height: 10),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: homeController.offers.map((offer) {
                int index = homeController.offers.indexOf(offer);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: homeController.currentCarouselIndex.value == index
                        ? AppTheme.colorRed
                        : Colors.grey,
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
