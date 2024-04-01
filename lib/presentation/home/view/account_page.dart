import 'package:auto_route/auto_route.dart';
import 'package:evento/widgets/button.dart';
import 'package:evento/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'TN');
  @override
  Widget build(BuildContext context) {

    return
       Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(

                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                       Text('Personal information',
                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                       Text('These are your personal details, they are visible to the public'),
                       Text('Profile Picture'),
                       Row(),
                       Text('Full Name'),
                                //      InputText(controller: nameController,),
                       Text('Role'),
                                //      InputText(controller: nameController,

                                 //     ),
                       Text('Phone number'),
                      // InternationalPhoneNumberInput(
                      //   onInputChanged: (PhoneNumber number) {
                      //     print(number.phoneNumber);
                      //   },
                      //   onInputValidated: (bool value) {
                      //     print(value);
                      //   },
                      //   selectorConfig: SelectorConfig(
                      //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      //     useBottomSheetSafeArea: true,
                      //   ),
                      //   ignoreBlank: false,
                      //   autoValidateMode: AutovalidateMode.disabled,
                      //   selectorTextStyle: TextStyle(color: Colors.black),
                      //   initialValue: number,
                      //   textFieldController: phoneController,
                      //   formatInput: true,
                      //   keyboardType:
                      //   TextInputType.numberWithOptions(signed: true, decimal: true),
                      //   inputBorder: OutlineInputBorder(),
                      //   onSaved: (PhoneNumber number) {
                      //     print('On Saved: $number');
                      //   },
                      // ),
                                 //     InputText(controller: nameController,),
                       Text('Email'),
                  //    InputText(controller: emailController),
                       Button(buttonText: 'Save changes',
                        onpressd:  () {
                          context.router.pushNamed('/login');
                        },
                        loader: false,),

                    ],
                  ),
                ),
              ),
            ],



    );}}
