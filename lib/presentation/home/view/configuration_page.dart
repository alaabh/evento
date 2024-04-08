import 'package:auto_route/auto_route.dart';
import 'package:evento/widgets/titleDescription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/colorConstants.dart';
import '../../../widgets/button.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  bool checkBox1=false;

  @override
  Widget build(BuildContext context) {

   return Scaffold(
    backgroundColor: Colors.grey.shade200,
     body: SingleChildScrollView(
       child: Container(
       decoration: BoxDecoration(
       color: Colors.white,
         borderRadius:
          BorderRadius.all(Radius.circular(8)),
    border: Border.all(
    width: 1,
      color: Colors.white,
    ),),

         margin: EdgeInsets.all(20.0),
           child: Padding(
             padding: const EdgeInsets.all(15.0),
             child: Column(

               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 TitleDescription(titleText: 'Language Settings', descriptionText: 'Choose your preferred language for the app interface.', titleSize: 20),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * 0.05,
                 ),
                 Text('Language',style: TextStyle(fontWeight: FontWeight.bold,color: ColorConstants.greyBlackColor),),
                 SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                 SizedBox(
                   width: MediaQuery.of(context).size.height * 0.3,
                   height:  MediaQuery.of(context).size.height * 0.06,
                   child: DropdownButtonFormField<String>(
                     style: TextStyle(fontSize: 15),
                     value: 'English',
                     decoration:  InputDecoration(
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
                     ),

                     items: <String>['English', 'French'].map((String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: Text(
                           value,
                           style: const TextStyle(overflow: TextOverflow.visible),
                         ),
                       );
                     }).toList(),
                     onChanged: (_) {},

                   ),
                 ),
                 SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                 Text(
                     'Notification Settings',
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: ColorConstants.greyBlackColor),
                 ),
                 SizedBox(height:MediaQuery.of(context).size.height * 0.03 ),
                 TitleDescription(titleText: 'Notification Types',descriptionText: 'Select the types of notifications you want to receive.', titleSize: 12),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * 0.02,
                 ),
                 Row(
                   children: <Widget>[
                     Checkbox(
                       activeColor: ColorConstants.greyColor,

                       value: checkBox1,
                       onChanged: (bool? value) {
                         if (value != null) {
                           setState(() {
                             checkBox1 = value;
                           });
                         }
                       },
                     ),

                     Text(
                       'Event Updates',

                     ), //Text//Checkbox
                   ], //<Widget>[]
                 ),
                 Row(
                   children: <Widget>[
                     Checkbox(
                       activeColor: ColorConstants.greyColor,

                       value: checkBox1,
                       onChanged: (bool? value) {
                         if (value != null) {
                           setState(() {
                             checkBox1 = value;
                           });
                         }
                       },
                     ),

                     Text(
                       'Evento users',
                      style: TextStyle(color: ColorConstants.greyBlackColor),
                     ), //Text//Checkbox
                   ], //<Widget>[]
                 ),
                 SizedBox( height: MediaQuery.of(context).size.height * 0.01),
                 TitleDescription(titleText: 'Communication Channels',descriptionText: 'Choose the communication channels through which you wish to receive notifications.', titleSize: 12),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * 0.02,
                 ),
                 Row(
                   children: <Widget>[
                     Checkbox(
                       activeColor: ColorConstants.greyColor,

                       value: checkBox1,
                       onChanged: (bool? value) {
                         if (value != null) {
                           setState(() {
                             checkBox1 = value;
                           });
                         }
                       },
                     ),

                     Text(
                       'Email',

                     ), //Text//Checkbox
                   ], //<Widget>[]
                 ),
                 Row(
                   children: <Widget>[
                     Checkbox(
                       activeColor: ColorConstants.greyColor,

                       value: checkBox1,
                       onChanged: (bool? value) {
                         if (value != null) {
                           setState(() {
                             checkBox1 = value;
                           });
                         }
                       },
                     ),

                     Text(
                       'Push Notifications',
                       style: TextStyle(color: ColorConstants.greyBlackColor),
                     ), //Text//Checkbox
                   ], //<Widget>[]
                 ),
                 Row(
                   mainAxisAlignment:MainAxisAlignment.end ,
                   children: [
                        Button(buttonText: 'Save changes',
                         onpressd:  () {
                           context.router.pushNamed('/login');
                         },
                         loader: false,),
                   ],
                 )
               ],
             ),
           ),

       ),
     )
   );
  }
}