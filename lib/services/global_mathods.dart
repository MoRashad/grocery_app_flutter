import 'package:flutter/cupertino.dart';

import '../inner_screens/on_sale_screen.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }
}
