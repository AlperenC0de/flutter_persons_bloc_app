import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/entity/persons.dart';
import 'package:flutter_application_7/ui/views/mainPage.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var tfPersonName=TextEditingController();
  var tfPersonTelNo=TextEditingController();
  var tfId=TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
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
              child: Center(child: TextField(keyboardType: TextInputType.number, controller: tfPersonTelNo, decoration: const  InputDecoration(hintText: "Person Telephone No(Only Numbers)"),)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: Center(child: TextField(keyboardType: TextInputType.number, controller: tfId, decoration: const InputDecoration(hintText: "ID(Only Numbers)"),),),
            ),
            ElevatedButton(onPressed: (){
              int id = int.parse(tfId.text);
                personList.add(Person(id:id, name: tfPersonName.text, tellNumber: tfPersonTelNo.text));
                 Navigator.pop(context, true);
              
            }, child:Text("Register")),
          ],
        ),
      ),
    );
  }
}