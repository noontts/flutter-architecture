import 'package:flutter/material.dart';
import 'package:core_ui/widget/elements/button/primary_button.dart';
import 'package:core_ui/widget/elements/texts/big_text.dart';

class HomeJumbotron extends StatelessWidget {
  final String imageUrl;
  final String title;
  const HomeJumbotron({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: <Widget>[
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BigText(title: title),
                    const PrimaryButton(title: 'View Collection')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
