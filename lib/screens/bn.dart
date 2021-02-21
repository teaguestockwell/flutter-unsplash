import 'package:flutter/material.dart';

import '../widgets/list_image.dart';
import 'contact.dart';

class BN extends StatefulWidget {
  @override
  _BNState createState() => _BNState();
}

class _BNState extends State<BN> with TickerProviderStateMixin {
  final pages = [
    ListImage('doctor'),
    ListImage('heart'),
    ListImage('cancer'),
    ListImage('exercise'),
    ListImage('chiropractor'),
    ListImage('ambulance')
  ];

  final titles =[
    'Home',
    'Cardiology',
    'Oncology',
    'Wellness',
    'Chiropractic',
    'Emergency',
  ];

  final icons = [
    Icon(Icons.home),
    Icon(Icons.favorite),
    Icon(Icons.pest_control),
    Icon(Icons.account_circle),
    Icon(Icons.elderly_rounded),
    Icon(Icons.accessible_forward_rounded),
  ];

  int idx = 0;

  void contact() => Navigator.push(context, MaterialPageRoute(builder: (_) => Contact()));

  @override
  Widget build(BuildContext context) {
    // desktop
    if(MediaQuery.of(context).size.width > 800){
      return Scaffold(
        body: pages[idx],
        appBar: AppBar(
          actions: [IconButton(icon: Icon(Icons.chat_bubble), onPressed: contact)],
          title: Text(titles[idx]),
          bottom: TabBar(
            isScrollable: true,
            onTap: (t) => setState(() => idx=t),
            tabs: List.generate(pages.length, (i) => Tab(icon: icons[i], text: titles[i])),
            controller: TabController(initialIndex: idx, length: pages.length, vsync: this),
          ),
        ),
        drawer: Drawer(child: ListView(children:
          List.generate(pages.length,
            (i) => ListTile(leading: icons[i],title: Text(titles[i]), onTap: (){ Navigator.pop(context); setState(()=>idx=i);}),
          )
        )),
      );

    // mobile
    }else{
      return Scaffold(
        body: pages[idx],
        appBar: AppBar(title: Text(titles[idx]),actions: [IconButton(icon: Icon(Icons.chat_bubble), onPressed: contact)],),
        drawer: Drawer(child: ListView(children:
          List.generate(pages.length,
            (i) => ListTile(leading: icons[i],title: Text(titles[i]), onTap: (){ Navigator.pop(context); setState(()=>idx=i);}),
          )
        )),
      );
    }

  }
}