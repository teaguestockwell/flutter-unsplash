import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/but.dart';

class Contact extends StatefulWidget {

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String subject = '';
  String body = '';


  void send() async {
    final mailto = Mailto(
      to: ['lpg@lpg.com'],
      subject: subject,
      body: body,
    ).toString();

    if (await canLaunch(mailto)) {
      await launch(mailto);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Container(
            height: 100,
            child: Center(
              child: Text('Error, please email lpg@lpg.com',
      )))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: Center(child: Padding(padding: EdgeInsets.all(10), child: ListView(children: [
        TextField(decoration: InputDecoration(labelText: 'First Name')),
        TextField(decoration: InputDecoration(labelText: 'Last Name')),
        TextField(decoration: InputDecoration(labelText: 'Phone')),
        TextField(decoration: InputDecoration(labelText: 'Subject'), onChanged: (s) => subject = s),
        TextField(decoration: InputDecoration(labelText: 'Message'), onChanged: (s) => body = s),
        But(onpress: send, text: 'Send',)
      ]
      )))
    );
  }
}