import 'package:flutter/material.dart';


class PasswordValidator extends StatefulWidget {
  const PasswordValidator({
    required this.password, required this.onStrengthChanged, super.key,
  });

  final String password;

  final Function(bool isStrong) onStrengthChanged;

  @override
  State<PasswordValidator> createState() =>
      _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {

  @override
  void didUpdateWidget(covariant PasswordValidator oldWidget) {
    super.didUpdateWidget(oldWidget);


    if (widget.password != oldWidget.password) {
      final isStrong = _validators.entries.every(
            (entry) => entry.key.hasMatch(widget.password),
      );


      WidgetsBinding.instance.addPostFrameCallback(
            (_) => widget.onStrengthChanged(isStrong),
      );
    }
  }


  final Map<RegExp, String> _validators = {
    RegExp('[A-Z]'): 'Password must contain at least one upper case.',
    RegExp(r'[!@#\$%^&*(),.?":{}|<>]'): 'Password must contain at least one special character.',
    RegExp('[a-z]'): 'One lower case letter.',
    RegExp(r'^.{8,32}$'): 'Password must be at least 8 characters long.',
  };

  @override
  Widget build(BuildContext context) {

    final hasValue = widget.password.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _validators.entries.map(
            (entry) {

          final hasMatch = entry.key.hasMatch(widget.password);

          final color =
          hasValue ? (hasMatch ? const Color(0xff26B195) : const Color(0xff8993AB) ) : null;

          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child:
                Row(
                  children: [
                    Icon(hasMatch?Icons.check_circle_rounded:Icons.cancel_rounded,
                        color: color,
                        size:18,
                    ),
                    Text(
                      entry.value,
                      style: const TextStyle(color: Color(0xff344054)),
                      ),

                  ],
                ),

          );
        },
      ).toList(),
    );
  }
}