import 'package:flutter/material.dart';

class SideImage extends StatefulWidget {

  const SideImage({
    Key? key,


  }) : super(key: key);

  @override
  State<SideImage> createState() => _SideImageState();
}

class _SideImageState extends State<SideImage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/login.png'), fit: BoxFit.fill)),
    );
  }
}