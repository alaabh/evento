import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class InputText extends StatefulWidget {
  final String? hint;

  final TextEditingController controller;
  final bool? obscure;
    final String? Function(String?)? fct;

  final String? value;

  final FilteringTextInputFormatter? filterTextInputFormatter;
  const InputText({
    Key? key,
    this.hint,

    required this.controller,
    this.obscure = false,
    this.fct,
    this.value,

    this.filterTextInputFormatter,

  }) : super(key: key);

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
        borderRadius:BorderRadius.all(Radius.circular(8)),
    elevation: 0.5,
    shadowColor: Color(0xffD0D5DD),
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
              color: Color(0xffD0D5DD)
          ),
        ):null,
        border: const OutlineInputBorder(),
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color:Color(0xffD0D5DD), width: 0.0),
          borderRadius:
          BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color:Color(0xff00B29E), width: 0.0),
          borderRadius:
          BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder:
        OutlineInputBorder(
          borderSide: const BorderSide(color:Color(0xffF34343), width: 0.0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),

      validator: widget.fct,

    ));
  }
}