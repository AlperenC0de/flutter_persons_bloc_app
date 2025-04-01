import 'package:flutter/material.dart';
import 'package:flutter_application_7/data/entity/persons.dart';
import 'package:flutter_application_7/ui/views/detailPage.dart';
import 'package:flutter_application_7/ui/views/registration.dart';

var personList=<Person>[];

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  bool searching=false;
  late final Future<List<Person>> _personFuture = uploadPerson();


  Future<List<Person>> uploadPerson() async {
    if(personList.isEmpty){
      personList.add(Person(id: 1, name: "AAAA", tellNumber: "1111"));
      personList.add(Person(id: 2, name: "BBBB", tellNumber: "2222"));
      personList.add(Person(id: 3, name: "CCCC", tellNumber: "3333"));
    }
    return personList;
  }

   @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searching ? 
        TextField(
          decoration: InputDecoration(hintText: "Ara"),
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        )
         :Text("Kişiler"),
        actions: [
          searching ?
          IconButton(onPressed: (){
            setState(() {
              searching=false;
            });
          }, icon: Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              searching=true;
            });
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: FutureBuilder<List<Person>>(
        future: _personFuture,
        builder: (context,snapshot){
          if(snapshot.hasData){
            var personList=snapshot.data;
            return ListView.builder(
              itemCount: personList!.length,
              itemBuilder:(context,index){
                var person=personList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Detailpage(person: person))).then((value){
                      if(value != null && value is Person){
                        setState(() {
                          int index=personList.indexWhere((p)=> p.id==value.id);
                          if (index != -1) {
                            personList[index] = value; // Güncelle!
                          }
                        });
                      }
                    });
                  },
                  child: Card(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(person.name, style: TextStyle(color: Colors.black, fontSize: 18.0)),
                            Text(person.tellNumber, style: TextStyle(color: Colors.grey, fontSize: 16.0)),
                          ],
                        ),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:Text("${person.name} adlı kişiyi silmek istiyor musunuz?"),
                              action: SnackBarAction(
                                label: "Evet", 
                                onPressed: (){
                                  setState(() {
                                    personList.removeAt(index);
                                  });
                                }
                                ),
                              )
                          );
                          
                        }, icon:Icon(Icons.clear)),
                  
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Registration())).then((value) {
          if(value==true){
            setState(() {
              
            });
          }
        });
      },
      child: const Icon(Icons.add), ),
    );
  }
}