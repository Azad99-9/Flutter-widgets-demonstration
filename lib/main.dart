import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  int _selectedIndex = 0;
  List<String> screenMessages = [
    'I am home page',
    'I am search page',
    'I am profile page',
  ];

  void _incrementCounter() {
    // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    setState(() {
      _counter*=2;
    });

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: FilledButton(onPressed: (){}, child: Text('Azad'),),
          title: Text('Tabs Demo'),
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'Favorites'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),

            ],
          ),
        ),
        body: TabBarView(children: [
          Center(child: Text('Home Screen')),
          Center(child: Text('Favorites')),
          Center(child: Text('Profile')),
        ]),
      ),
    );


    // return Scaffold(
    //   key: scaffoldKey,
    //   drawer: Drawer(
    //     child: ListView(
    //       children: [
    //         UserAccountsDrawerHeader(
    //           accountName: Text('Azad Shaik'),
    //           accountEmail: Text('azad@example.com'),
    //           currentAccountPicture: CircleAvatar(
    //             backgroundImage: AssetImage('assets/profile.png'),
    //           ),
    //         ),
    //         ListTile(leading: Icon(Icons.home), title: Text('Home'), onTap: () {},trailing:
    //           Container(height: 30, width: 30, child: Icon(Icons.abc),),
    //         ),
    //         ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
    //         ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
    //         ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
    //         ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
    //         ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
    //         Divider(),
    //         ListTile(leading: Icon(Icons.logout), title: Text('Logout')),
    //       ],
    //     ),
    //   ),
    //
    //   appBar: AppBar(
    //       title: Text('Home'),
    //       leading: IconButton(
    //         icon: Icon(Icons.menu),
    //         onPressed: () {
    //           scaffoldKey.currentState?.openDrawer();
    //         },
    //       ),
    //       actions: [
    //         IconButton(icon: Icon(Icons.search), onPressed: () {}),
    //         IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
    //
    //       ],
    //       // backgroundColor: Colors.blue,
    //       elevation: 4,
    //       centerTitle: false,
    //       bottom: PreferredSize(
    //         preferredSize: Size(double.infinity ,40),
    //         child: IconButton(icon: Icon(Icons.notifications),
    //             onPressed: () {}
    //         ),
    //       ),
    //     ),
    //
    //
    //     body: Center(child: Text(screenMessages[_selectedIndex])),
    //     bottomNavigationBar: BottomNavigationBar(
    //       currentIndex: _selectedIndex,
    //       onTap: (index) => setState(() => _selectedIndex = index),
    //       selectedItemColor: Colors.red,
    //       unselectedItemColor: Colors.grey,
    //       iconSize: 20,
    //       items: const [
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //         BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    //         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    //
    //       ],
    //     ),
    //     floatingActionButton: FloatingActionButton.extended(
    //       onPressed: () {
    //         print('extended button has been clicked');
    //         // ScaffoldMessenger.of(context).showSnackBar(
    //         //   SnackBar(
    //         //     content: Text('Message Sent!'),
    //         //     duration: Duration(seconds: 2),
    //         //     behavior: SnackBarBehavior.fixed,
    //         //     action: SnackBarAction(label: 'Undo', onPressed: () {}),
    //         //   ),
    //         // );
    //
    //         // bottom sheet
    //         // showModalBottomSheet(
    //         //   context: context,
    //         //   builder: (_) => Container(
    //         //     padding: EdgeInsets.all(16),
    //         //     child: Column(
    //         //       mainAxisSize: MainAxisSize.min,
    //         //       children: [
    //         //         ListTile(leading: Icon(Icons.share), title: Text('Share')),
    //         //         ListTile(leading: Icon(Icons.link), title: Text('Copy Link')),
    //         //       ],
    //         //     ),
    //         //   ),
    //         // );
    //
    //         // alert dialog
    //         // showDialog(
    //         //   context: context,
    //         //   builder: (_) => AlertDialog(
    //         //     title: Text('Delete Item?'),
    //         //     content: Text('Are you sure you want to delete this?'),
    //         //     actions: [
    //         //       TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
    //         //       ElevatedButton(onPressed: () {}, child: Text('Delete')),
    //         //     ],
    //         //   ),
    //         // );
    //
    //
    //
    //       },
    //       icon: Icon(Icons.add),
    //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    //       label: Text('Add'),
    //     ),
    //
    // );

    // return Scaffold(
    //   body:
    //   Center(child: Center(child: Text("I am the home page"))),

      // Wrap(
      //   spacing: 8,
      //   runSpacing: 4,
      //   children: [
      //     Chip(label: Text('Flutter')),
      //     Chip(label: Text('Dart')),
      //     Chip(label: Text('Widgets')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('Widgets')),
      //   ],
      // ),) ,
      // ListView(
      //   scrollDirection: Axis.horizontal,
      //   children: [
      //     Chip(label: Text('Flutter')),
      //     Chip(label: Text('Dart')),
      //     Chip(label: Text('Widgets')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('Widgets')),Chip(label: Text('Flutter')),
      //     Chip(label: Text('Dart')),
      //     Chip(label: Text('Widgets')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('stateful')),
      //     Chip(label: Text('Widgets')),
      //   ],
      // ),)

        // GridView.count(
        //
        //   crossAxisCount: 3,
        //
        //   children: [
        //     Chip(label: Text('Flutter')),
        //     Chip(label: Text('Dart')),
        //     Chip(label: Text('Widgets')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('Widgets')),Chip(label: Text('Flutter')),
        //     Chip(label: Text('Dart')),
        //     Chip(label: Text('Widgets')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('Widgets')), Chip(label: Text('Widgets')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('stateful')),
        //     Chip(label: Text('Widgets')),
        //   ],
        // ),)

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //   Center(
      //     child: Icon(Icons.star),
      //   ),
      //
      // ],)
      // Center(child:
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//
//           Padding(
//             padding: EdgeInsets.all(32),
//             // margin: EdgeInsets.all(8),
//
//             child: Text('Hello Flutter!', style: TextStyle(color: Colors.black)),
//           )
//
// ,
//
//
//           // Container(color: Colors.blue, height: 50, width: 50,),
//           //   Spacer(),
//           //   Container(color: Colors.red, height: 50, width: 50,),
//           // Spacer(),
//           //
//           // Container(color: Colors.green, height: 50, width: 50,),
//           // Spacer(),
//           //
//           // Container(color: Colors.purple, height: 50, width: 50,),
//
//         ],
//       )
//       )

    // );
  }
}
