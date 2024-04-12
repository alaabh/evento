import 'package:evento/presentation/home/view/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Dashboard',
      style: optionStyle,
    ),
    Text(
      'Index 1: My Events',
      style: optionStyle,
    ),
    Text(
      'Index 2: Reports',
      style: optionStyle,
    ),
  SettingsPage(),
    Text(
      'Index 4: Support',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool drawerState = true;
  @override
  void initState() {
    @override
    void initState() {
      super.initState();
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (drawerState)
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                          width: MediaQuery.of(context).size.width * 0.08,
                          'image/evento.png'),
                      IconButton(
                        icon: Icon(
                          Icons.sort,
                        ),
                        onPressed: () {
                          setState(() {
                            drawerState = !drawerState;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: Divider(),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.stacked_bar_chart_sharp,
                    ),
                    title: const Text('Dashboard'),
                    selected: _selectedIndex == 0,
                    onTap: () {
                      // Update the state of the app
                      _onItemTapped(0);
                      // Then close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.calendar_today,
                    ),
                    title: const Text('My Events'),
                    selected: _selectedIndex == 1,
                    onTap: () {
                      // Update the state of the app
                      _onItemTapped(1);
                      // Then close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.file_copy_outlined,
                    ),
                    title: const Text('Reports'),
                    selected: _selectedIndex == 2,
                    onTap: () {
                      // Update the state of the app
                      _onItemTapped(2);
                      // Then close the drawer
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                    ),
                    title: const Text('Settings'),
                    selected: _selectedIndex == 3,
                    onTap: () {
                      // Update the state of the app
                      _onItemTapped(3);
                      // Then close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.contact_support_outlined,
                    ),
                    title: const Text('Support'),
                    selected: _selectedIndex == 4,
                    onTap: () {

                      // Update the state of the app
                      _onItemTapped(4);
                      // Then close the drawer
                    },
                  ),
                ],
              ),
            )
          else
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.sort,
                  ),
                  onPressed: () {
                    setState(() {
                      drawerState = !drawerState;
                    });
                  },
                ),
              ],
            ),
          Flexible(
            child: Container(
              color: Colors.grey.shade200,

              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _widgetOptions[_selectedIndex],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
