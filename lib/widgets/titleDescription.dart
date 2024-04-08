import 'package:evento/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:evento/utils/colorConstants.dart';

class TitleDescription extends StatefulWidget {
final String titleText;
final String? descriptionText;
final double titleSize;

  const TitleDescription({
    super.key,
    required this.titleText,
   this.descriptionText,
    required this.titleSize,


  });


  @override
  State<TitleDescription> createState() => _TitleDescriptionState();
}

class _TitleDescriptionState extends State<TitleDescription> {

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
      Text(
        widget.titleText,
        style: TextStyle(fontSize: widget.titleSize, fontWeight: FontWeight.w700,color: ColorConstants.greyBlackColor),
      ),
      SizedBox(
    height: MediaQuery.of(context).size.height * 0.01,
    ),
     Text(widget.descriptionText ?? "",style: TextStyle(color: ColorConstants.greyColor)),
    ],);

}}