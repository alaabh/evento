import 'package:evento/utils/colorConstants.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {


  const InputText({
    required this.controller, super.key,
    this.hint,
    this.obscure = false,
    this.fct,
    this.value,


  });
  final String? hint;

  final TextEditingController controller;
  final bool? obscure;
    final String? Function(String?)? fct;

  final String? value;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool isHidden = false;
  void showPassword() {
    setState(() {
      isHidden = !isHidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius:const BorderRadius.all(Radius.circular(8)),
    elevation: 0.5,
    shadowColor: ColorConstants.whiteColor,
      child:
      TextFormField(
      initialValue: widget.value,
      obscureText: isHidden,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      decoration: InputDecoration(
        suffix: widget.obscure! ? InkWell(
          onTap: showPassword,
          child: Icon(

              isHidden
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: ColorConstants.greyColor,
          ),
        ):null,
        border: const OutlineInputBorder(),
        hintText: widget.hint ?? '' ,
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color:ColorConstants.whiteColor, width: 0),
          borderRadius:
          const BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color:ColorConstants.greenColor, width: 0),
          borderRadius:
          const BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder:
        OutlineInputBorder(
          borderSide:  BorderSide(color:ColorConstants.redColor, width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
      ),

      validator: widget.fct !=null? widget.fct : null,

    ),);
  }
}