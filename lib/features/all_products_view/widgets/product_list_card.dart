import 'package:flutter/material.dart';
import 'package:test_ecom/widgets/text_widget.dart';

import '../../../constants/color_constants.dart';
import '../../common/models/product_model.dart';

class ProductListCard extends StatelessWidget {

  final Product product;

  const ProductListCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 20, horizontal: 20 ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyShadeFirstColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3),
            )
          ]
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      Uri.encodeFull(product.image)
                    ),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: CustomTextWidget(
                      text: product.title,
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      softWrap: true,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomTextWidget(
                    text: product.category,
                    color: AppColors.darkColor,
                    fontSize: 14,
                    textAlign: TextAlign.left,
                  ),
                  CustomTextWidget(
                    text: "Available :${product.rating.count}",
                    color: AppColors.darkColor,
                    fontSize: 14,
                  ),
                  CustomTextWidget(
                    text: "\$${product.price}",
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
