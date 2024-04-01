import 'package:evento/presentation/home/view/account_page.dart';
import 'package:evento/utils/colorConstants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>   with SingleTickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController =  TabController(length: 3, vsync: this);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return
       Padding(
      padding: EdgeInsets.only(
      left: MediaQuery.of(context).size.width * 0.05,
      ),
        child: SizedBox(
          height:MediaQuery.of(context).size.height ,
      
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
      
              children:[ const Text('hi',style: TextStyle(fontSize: 50),),
                const Divider(),
                SizedBox(height:MediaQuery.of(context).size.height *0.03 ),
                const Text('Settings', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height:MediaQuery.of(context).size.height *0.03 ),
                const Text('Access and customize various aspects of your account and platform settings.', style: TextStyle(fontSize: 14)),
                SizedBox(height:MediaQuery.of(context).size.height *0.03 ),

                    TabBar(
                      unselectedLabelColor: ColorConstants.greyColor,
                      labelColor: ColorConstants.greenColor,
                      tabs: [
                        Tab(
                         text:   'Account '
                        ),
                        Tab(
                         text : 'user managament '
                        ),
                        Tab(
                            text : 'confg'
                        )
                      ],
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: ScrollPhysics(),
                        viewportFraction: 1.0,
                        children: [AccountPage(),Text('people'), Text('Person')],
                        controller: tabController,
                      ),
                    ),
      

      

      
      
              ],
      
          ),
        ),

    );
  }
}
