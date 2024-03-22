import 'package:evento/utils/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Button extends StatefulWidget {
  final void Function()? onpressd;
  final String? buttonText;
  final bool? loader;


  const Button({
    Key? key,
    this.onpressd,
    this.buttonText,
    this.loader,

  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStatePropertyAll<Color>(
                 ColorConstants.greenColor,),
            shape: MaterialStateProperty.all<
                RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ))),
        onPressed:widget.onpressd,
        child: widget.loader!
            ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
            child:
            const Center(
                child:  LoadingIndicator(
                    indicatorType: Indicator.lineSpinFadeLoader,
                    colors:  [Colors.white],
                    strokeWidth: 0.2,
                ),),)
            : Text(widget.buttonText!),);
  }
}