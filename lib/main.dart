import 'package:flutter/material.dart';
import 'package:test_ecom/features/single_product_view/view/single_product_view.dart';
import 'package:test_ecom/themes/themes.dart';

import 'features/all_products_view/view/all_product_view.dart';
import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final theme = TestEcommerceTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test ECommerce',
      theme: theme.getTestECommerceTheme,
      home: const AllProductsView(),
      routes: {
        AppRoutes.allProductsScreen: (context) => const AllProductsView(),
        AppRoutes.productScreen: (context) => const SingleProductView()
      },
    );
  }
}
