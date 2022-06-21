import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {Key? key,
      required this.price,
      required this.salePrice,
      required this.textPrice,
      required this.isOnSale})
      : super(key: key);
  final double price, salePrice;
  final String textPrice;
  final bool isOnSale;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double usedPrice = isOnSale ? salePrice : price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: '\$${(usedPrice * int.parse(textPrice)).toStringAsFixed(2)}',
            color: Colors.green,
            textsize: 18,
          ),
          const SizedBox(width: 6),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 14,
                  color: color,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }
}
