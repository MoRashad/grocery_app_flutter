import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = '/on_sale_screen';
  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isEmpty = false;
    final Utils utils = Utils(context);
    Size size = utils.screenSize;
    final themeState = utils.getTheme;
    final Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'On Sale',
          color: color,
          textsize: 24,
          isTitle: true,
        ),
      ),
      body: _isEmpty
          ? Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset('assets/images/box.png'),
                  ),
                  Text('no products',
                      style: TextStyle(
                          color: color,
                          fontSize: 40,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            )
          : GridView.count(
              padding: EdgeInsets.zero,
              crossAxisSpacing: 10,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(16, (index) {
                return const OnSaleWidget();
              }),
            ),
    );
  }
}
