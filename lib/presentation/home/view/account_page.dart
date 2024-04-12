import 'package:auto_route/auto_route.dart';
import 'package:evento/utils/colorConstants.dart';
import 'package:evento/widgets/button.dart';
import 'package:evento/widgets/input.dart';
import 'package:evento/widgets/titleDescription.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  PhoneNumber number = PhoneNumber(isoCode: 'TN');
  @override
  Widget build(BuildContext context) {

    return
       Scaffold(
         backgroundColor: Colors.grey.shade200,
         body: SingleChildScrollView(
           child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                    width:MediaQuery.of(context).size.width * 0.3,
                      child: Center(
                        child: Card(
                        color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TitleDescription(titleText: 'Personal information',
                                    descriptionText:'These are your personal details, they are visible to the public', titleSize: 20 ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                ),
                                 Text('Profile Picture',style: TextStyle(color: ColorConstants.greyBlackColor,fontWeight: FontWeight.bold),),
                                  Row(
                                   children: [

                                      ProfilePicture(
                                         name: 'bata',
                                         radius: 31,
                                         fontsize: 20,
                                         tooltip: true,
                                         img: 'https://static.vecteezy.com/system/resources/previews/002/325/235/non_2x/small-cute-duckling-outdoors-free-photo.JPG'),

                                     Column(
                                       children: [
                                         Row(
                                           children: [
                                             IconButton(onPressed:()=>print("test"), icon: Icon(
                                               Icons.mode_edit_outline_outlined,
                                                   color: ColorConstants.greenColor,
                                               size: 20,

                                             ))
                                             ,
                                             Text('Change',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ,color: ColorConstants.greenColor),)
                                           ]),
                                             Row(
                                               children: [
                                             IconButton(onPressed:()=>print("test"), icon: Icon(
                                               Icons.delete_outline,
                                               color: ColorConstants.redColor,
                                               size: 20,

                                             )),
                                                 Text('Delete',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold ,color: ColorConstants.redColor),)

                                               ],
                                         ),
                                       ],
                                     )
                                   ],
                                 ),
                                 Text('Full Name',style: TextStyle(fontWeight: FontWeight.bold,color: ColorConstants.greyBlackColor),),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                              InputText(controller: nameController,
                                    hint: 'Full name',
                                   ),

                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                                 Text('Role',style: TextStyle(fontWeight: FontWeight.bold,color: ColorConstants.greyBlackColor),),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                                SizedBox(

                                  height:  MediaQuery.of(context).size.height * 0.06,
                                  child: DropdownButtonFormField<String>(
                                    style: TextStyle(fontSize: 15),
                                    value: 'Admin',
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

                                    items: <String>['Admin', 'Operator'].map((String value) {
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
                                 Text('Phone number',style: TextStyle(fontWeight: FontWeight.bold,color: ColorConstants.greyBlackColor),),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                                 SizedBox(

                                   height:  MediaQuery.of(context).size.height * 0.06,
                                   child :IntlPhoneField(

                                 decoration: InputDecoration(
                                   counterText: '',

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
                                   errorBorder: OutlineInputBorder(
                                     borderSide:  BorderSide(color:ColorConstants.redColor, width: 0),
                                     borderRadius: const BorderRadius.all(Radius.circular(8)),
                                   ),
                                prefixIcon: Icon(Icons.phone, color: Colors.grey),
                                ),
                                initialCountryCode: 'TN',

                                onChanged: (phone) {
                                print(phone.completeNumber);
                                },


                                ),

                                 ),

                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                                 Text('Email',style: TextStyle(fontWeight: FontWeight.bold,color: ColorConstants.greyBlackColor),),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                            InputText(controller: emailController,
                                    hint: 'Your email',
                                    fct:
                                        (value) {
                                      if (!RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',)
                                          .hasMatch(value!)&&(value.isNotEmpty)) {
                                        return 'Wrong email format.';
                                      }
                                      return null;}),

                                 SizedBox(height:MediaQuery.of(context).size.width * 0.01),
                                 SizedBox(

                                     width: MediaQuery.of(context).size.width ,
                                   child: Button(buttonText: 'Save changes',
                                    onpressd:  () {
                                      context.router.pushNamed('/login');
                                    },
                                    loader: false,),
                                 ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02 ,),
                  Expanded(
                    child: SizedBox(
                    width:MediaQuery.of(context).size.width * 0.3,
                      child: Card(
                          margin: EdgeInsets.only(top: 0.0,right: 20.0),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TitleDescription(titleText: 'Update Password',
                                    descriptionText:'Enter your current password to make update', titleSize: 20 ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                                Text('Current Password',style: TextStyle(color: ColorConstants.greyBlackColor,fontWeight: FontWeight.bold)),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                                 InputText(controller: passwordController,hint:'Type your password',obscure: true),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                                Text('New Password',style: TextStyle(color: ColorConstants.greyBlackColor,fontWeight: FontWeight.bold)),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                               InputText(controller: newPasswordController,hint:'Type your new password',obscure: true),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                                Text('Confirm New Password',style: TextStyle(color: ColorConstants.greyBlackColor,fontWeight: FontWeight.bold)),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                               InputText(controller: confirmPasswordController,hint:'Type your new password again',obscure: true),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      context.router.pushNamed('/request-password');
                                    },
                                    child: Text(
                                      'Forget password?',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: ColorConstants.greenColor,
                                        color: ColorConstants.greenColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ),

                                 SizedBox(
                                          width:MediaQuery.of(context).size.width ,
                                          child: Button(buttonText: 'Update password',
                                      onpressd:  () {
                                        context.router.pushNamed('/login');
                                      },
                                      loader: false,),
                                 ),

                              ],
                      ))),
                    ),
                  )

                ],



               ),
         ),
       );
  }}
