import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../prvider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Hi,   ',
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'my Name',
                            style: TextStyle(
                                color: color,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('muanem');
                              }),
                      ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: 'Email@email.com',
                  color: color,
                  textsize: 18,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTiles(
                    title: 'address2',
                    subtitle: 'mysubtitle',
                    icon: IconlyLight.profile,
                    onpressed: () {},
                    color: color),
                _listTiles(
                    title: 'Orders',
                    icon: IconlyLight.bag,
                    onpressed: () {},
                    color: color),
                _listTiles(
                    title: 'Wishlist',
                    icon: IconlyLight.heart,
                    onpressed: () {},
                    color: color),
                _listTiles(
                    title: 'Viewed',
                    icon: IconlyBold.show,
                    onpressed: () {},
                    color: color),
                _listTiles(
                    title: 'Forgot password',
                    icon: IconlyBold.unlock,
                    onpressed: () {},
                    color: color),
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                    color: color,
                    textsize: 20,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  value: themeState.getDarkTheme,
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                ),
                _listTiles(
                    title: 'Logout',
                    icon: IconlyBold.logout,
                    onpressed: () {},
                    color: color),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onpressed,
    required color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textsize: 22,
        isTitle: true,
      ),
      subtitle: TextWidget(
          text: subtitle == null ? "" : subtitle, color: color, textsize: 18),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: onpressed(),
    );
  }
}
