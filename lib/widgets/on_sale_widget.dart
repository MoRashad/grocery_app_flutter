// ignore_for_file: avoid_print

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import 'heart_widget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Size size = Utils(context).screenSize;
    final Color color = Utils(context).color;
    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          print('On Sale');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(
                    imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                    height: size.width * 0.22,
                    width: size.width * 0.22,
                    boxFit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      TextWidget(
                        text: '1KG',
                        color: color,
                        textsize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('Add');
                            },
                            child:
                                Icon(IconlyLight.bag2, size: 22, color: color),
                          ),
                          const HeartWidget(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const PriceWidget(
                isOnSale: true,
                price: 1.99,
                salePrice: 0.99,
                textPrice: '1',
              ),
              const SizedBox(height: 6),
              TextWidget(
                text: 'Product title',
                color: color,
                textsize: 16,
                isTitle: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
