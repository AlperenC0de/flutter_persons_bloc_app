import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/entity/persons.dart';

class Detailpage extends StatefulWidget {
  final Person person;
  Detailpage({required this.person});
  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  var tfPersonName=TextEditingController();
  var tfPersonTelNo=TextEditingController();

  

  @override
  void initState() {
    super.initState();
    var person=widget.person;
    tfPersonName.text=person.name;
    tfPersonTelNo.text=person.tellNumber;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: Center(child: TextField(controller: tfPersonName, decoration: const InputDecoration(hintText: "Person Name"),)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: Center(child: TextField(controller: tfPersonTelNo, decoration: const  InputDecoration(hintText: "Person Telephone No"),)),
            ),
            ElevatedButton(onPressed: (){
              var updatePerson=Person(id: widget.person.id, name: tfPersonName.text, tellNumber: tfPersonTelNo.text);
              Navigator.pop(context,updatePerson);
            }, child:Text("Update")),
          ],
        ),
      ),
    );
  }
}