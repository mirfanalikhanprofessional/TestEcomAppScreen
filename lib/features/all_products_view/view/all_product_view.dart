import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_ecom/features/all_products_view/utility/all_products_utility.dart';
import 'package:test_ecom/features/all_products_view/widgets/product_grid_card.dart';
import 'package:test_ecom/features/all_products_view/widgets/product_list_card.dart';
import 'package:test_ecom/features/common/models/product_model.dart';

import '../../../constants/color_constants.dart';
import '../../../routes/routes.dart';
import '../../../widgets/text_widget.dart';
import '../../common/layout_widgets/app_bar.dart';


class AllProductsView extends StatefulWidget {
  const AllProductsView({super.key});

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {

  late Future<ProductList> productsFuture;
  late List<ProductList> cachedProductLists = [];
  List<ProductList> mainProductList = [];

  @override
  void initState() {
    // TODO: implement initState
    productsFuture = AllProductsUtility().getAllProductsData(context);
    super.initState();
  }

  bool isGrid = false;
  // Here it is difficult to create grid view using grid view builder while keeping the height dynamic meaning adjust according to the content, either we can the set content fixed, like limit the product title to a max number of lines and other things to keep it in good shape or try to adjust it maximum with the available data
  Widget buildGridView(ProductList productList) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 15 ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 50.0,
          crossAxisSpacing: 15.0,
          childAspectRatio: 0.4,
        ),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        itemCount: productList.products.length,
        itemBuilder: (BuildContext context, int index) {
          final Product product = productList.products[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.productScreen,
                arguments: product
              );
            },
            child: ProductGridCard(product: product)
          );
        },
      ),
    );
  }

  Widget buildListView(ProductList productList) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      itemCount: productList.products.length,
      itemBuilder: (BuildContext context, int index) {
        final Product product = productList.products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.productScreen,
              arguments: product
            );
          },
          child: ProductListCard(product: product)
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "PRODUCTS",
        height: 60,
      ),
      body: FutureBuilder<ProductList>(
        future: productsFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child:  Center(
                      child: CustomTextWidget(
                          text: "Sorry, it seems that no data is available",
                          color: AppColors.darkColor
                      )
                  ),
                ),
              );
            case ConnectionState.waiting:
              return const Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child:  Center(
                      child: CircularProgressIndicator(
                        color: AppColors.themeColor,
                      )
                  ),
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                if (kDebugMode) {
                  print(snapshot.error);
                }
                if (kDebugMode) {
                  print(snapshot.stackTrace);
                }
                return const CustomTextWidget(
                  text: "Sorry, it seems an unexpected error has occurred",
                  color: AppColors.darkColor,
                  textAlign: TextAlign.center,
                  softWrap: true,
                );
              }
              else{
                final ProductList productList = snapshot.data!;
                cachedProductLists.add(productList);
                if (cachedProductLists.isNotEmpty) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: CustomTextWidget(
                            text: isGrid ? "Switch to List View" : "Switch to Grid View",
                            color: AppColors.darkColor,
                          ),
                          onPressed: () => setState(() => isGrid = !isGrid),
                        ),
                      ),
                      Expanded(
                        child: isGrid
                            ? buildGridView(productList)
                            : buildListView(productList),
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(
                        child: CustomTextWidget(
                          text: "Sorry, it seems that product data is not available",
                          color: AppColors.darkColor,
                        ),
                      ),
                    ),
                  );
                }
              }
            default:
              return const SizedBox(
                width: 20,
                height: 20,
                child:  Center(
                    child: CustomTextWidget(
                        text: "Sorry, it seems that no data is available",
                        color: AppColors.darkColor
                    )
                ),
              );
          }
        },
      ),
    );
  }
}
