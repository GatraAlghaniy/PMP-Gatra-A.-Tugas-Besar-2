// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'database/db_helper.dart';
import 'model/kontak.dart';


class FormKontak extends StatefulWidget { final Kontak? kontak;

 FormKontak({this.kontak});

  @override_FormKontakState createState() => _FormKontakState();
}

class _FormKontakState extends State<FormKontak> {DbHelper db = DbHelper();

  TextEditingController? name;TextEditingController? lastName;TextEditingController? NIM;TextEditingController? mobileNo;
  TextEditingController? email;

  @override
  void initState() {
    name = TextEditingController(text: widget.kontak == null ? '' : widget.kontak!.name);
    NIM = TextEditingController(text: widget.kontak == null ? '' : widget.kontak!.NIM);
    mobileNo = TextEditingController(
    text: widget.kontak == null ? '' : widget.kontak!.mobileNo); email = TextEditingController(text: widget.kontak == null ? '' : widget.kontak!.email);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Student'),
      ),
body: ListView(
padding: EdgeInsets.all(16.0),
children: [
Padding(
padding: const EdgeInsets.only(
top: 20,
            ),
child: TextField(
controller: name,
decoration: InputDecoration(
labelText: 'Name',
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: NIM,
              decoration: InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: mobileNo,
              decoration: InputDecoration(
                  labelText: 'Mobile No',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20
            ),
            child: ElevatedButton(
              child: (widget.kontak == null)
                  ? Text(
                'Add',style: TextStyle(color: Colors.white),
              )
                  : Text(
                'Update', style: TextStyle(color: Colors.white),
              ), onPressed: () {upsertKontak();
              },
            ),
          )
        ],
      ),
    );
  }
  Future<void> upsertKontak() async {
    if (widget.kontak != null) {
      //update
      await db.updateKontak(Kontak(
          id: widget.kontak!.id,name: name!.text,mobileNo: mobileNo!.text, email: email!.text, NIM: NIM!.text
      ));Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveKontak(Kontak(
        name: name!.text,mobileNo: mobileNo!.text,email: email!.text,NIM: NIM!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}