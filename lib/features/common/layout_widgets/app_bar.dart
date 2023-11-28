import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../widgets/text_widget.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final double height;

  const CustomAppBar({super.key, required this.height, required this.title}) : super();

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.whiteShadeColor,
        ),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }
        },
      ),
      title: CustomTextWidget(
        text: title,
        color: AppColors.whiteShadeColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.shopping_cart,
            color: AppColors.whiteShadeColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.menu,
            color: AppColors.whiteShadeColor,
          ),
        )
      ],
    );
  }
}
