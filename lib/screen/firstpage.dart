import 'package:flutter/material.dart';
import 'package:git_repo/Controller/getAllData_Controller.dart';


// ignore: camel_case_types
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // List<Persons> personsDataList = [];
  // Future<List<Persons>> getData_FromApi() async {
  //   final response =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //   var decodedDatalist = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> i in decodedDatalist) {
  //       personsDataList.add(Persons.fromJson(i));
  //     }
  //     return personsDataList;
  //   } else {
  //     return personsDataList;
  //   }
  // }
  API apicall = API();
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: FutureBuilder(
          future: apicall.getData_FromApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("loading");
            } else {
              return ListView.builder(
                itemCount: apicall.personsDataList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height/8,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        border: Border.all(color: Colors.red, width: 2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User: ${apicall.personsDataList[index].user?.login}",
                          style:
                              front(),
                        ),
                        Text(
                          "Title : ${apicall.personsDataList[index].title}",
                          style: front(),
                        ),
                        Text(
                          "ID : ${apicall.personsDataList[index].id}",
                          style:front()
                        ),
                        Text(
                          "Body : ${apicall.personsDataList[index].user?.login}",
                          style: front()
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      )
    ]);
  }

  TextStyle front() => const TextStyle(fontSize: 15, color: Colors.blue);
}
