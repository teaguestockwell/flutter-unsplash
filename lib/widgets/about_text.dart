import 'package:flutter/widgets.dart';
import 'list_image.dart';

class AboutText extends StatelessWidget {
  final String searchTerm;
  final String bodyText;
  AboutText({
    @required this.searchTerm,
    @required this.bodyText,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(bodyText),
        ListImage(searchTerm)
      ]
    );
  }
}