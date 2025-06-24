import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.title, required this.image, required this.subtitle});
  final String title, image, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 50,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(image)),
            Text(title, style:  TextStyles.bold20,maxLines:1, overflow: TextOverflow.ellipsis,),
            SizedBox(width: 300, child: Text(subtitle, style:  TextStyles.regular14,)),
          ],
        ),
      ),
    );
  }
}