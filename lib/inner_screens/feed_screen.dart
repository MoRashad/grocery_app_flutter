import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/services/utils.dart';

import '../widgets/feed_itmes.dart';
import '../widgets/text_widget.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = '/FeedsScreenState';
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  @override
  void dispose() {
    _searchTextController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          text: 'Products',
          color: color,
          textsize: 20,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: _searchTextController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    hintText: 'What are you looking for ? ',
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {
                        _searchTextController!.clear();
                        _searchTextFocusNode.unfocus();
                      },
                      icon: Icon(
                        Icons.close,
                        color:
                            _searchTextFocusNode.hasFocus ? Colors.red : color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              crossAxisSpacing: 10,
              mainAxisSpacing: 2,
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.59),
              children: List.generate(10, (index) {
                return const FeedsWidget();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
