import 'package:flutter/material.dart';
import 'package:test_ecom/widgets/text_widget.dart';

import '../../../constants/color_constants.dart';
import '../../common/models/product_model.dart';

class ProductGridCard extends StatelessWidget {
  final Product product;

  const ProductGridCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyShadeFirstColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  Uri.encodeFull(product.image),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomTextWidget(
            text: product.title,
            color: AppColors.darkColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
            softWrap: true,
            textAlign: TextAlign.left,
          ),
          CustomTextWidget(
            text: product.category,
            color: AppColors.darkColor,
            fontSize: 12,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.normal,
          ),
          CustomTextWidget(
            text: "Available :${product.rating.count}",
            color: AppColors.darkColor,
            fontSize: 12,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.normal,
          ),
          CustomTextWidget(
            text: "\$${product.price}",
            color: AppColors.darkColor,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
