import 'package:flutter/material.dart';
import 'package:core_ui/widget/elements/texts/text_title.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.arrow_back,color: Colors.white)),
                TextTitle(title: 'Home',color: Colors.white,)
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.search, color: Colors.white,)),
                IconButton(onPressed: null, icon: Icon(Icons.info, color: Colors.white,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
