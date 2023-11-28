import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_ecom/features/common/layout_widgets/app_bar.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/text_widget.dart';
import '../../common/models/product_model.dart';

class SingleProductView extends StatelessWidget {

  const SingleProductView({super.key});

  List<Widget> ratingStars(double rating) {
    final List<Widget> stars = [];
    const int maxStars = 5; // Maximum number of stars to show

    // Add active stars
    for (var i = 0; i < rating.floor(); i++) {
      stars.add(const Icon(
        Icons.star,
        color: AppColors.darkColor,
        size: 25,
      ));
    }

    // Add partially filled star (if there is a fraction)
    if (rating - rating.floor() > 0) {
      stars.add(const Icon(
        Icons.star_half,
        color: AppColors.darkColor,
        size: 25,
      ));
    }

    // Add inactive stars
    for (var i = 0; i < maxStars - rating.floor(); i++) {
      stars.add(const Icon(
        Icons.star_border_outlined,
        color: AppColors.whiteShadeColor,
        size: 25,
      ));
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "PRODUCT DETAILS",
        height: 60,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 20 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        Uri.encodeFull(product.image),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextWidget(
                text: product.title,
                color: AppColors.darkColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                softWrap: true,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextWidget(
                text: product.category,
                color: AppColors.darkColor,
                fontSize: 15,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextWidget(
                text: product.description,
                color: AppColors.darkColor,
                fontSize: 13,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.normal,
                softWrap: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: ratingStars(product.rating.rate),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: "\$${product.price}",
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    textAlign: TextAlign.left,
                  ),
                  const Row(
                    children: [
                      Icon(
                        CupertinoIcons.heart,
                        color: AppColors.darkColor,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: AppColors.darkColor,
                        size: 30,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
