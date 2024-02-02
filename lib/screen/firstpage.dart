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
              return const Center(child:  Text("loading"));
            } else {
              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/10,
                          child: Text("Issue",style: frontTitle(),),
                        ),
                        TextFormField(
                         
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: apicall.personsDataList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: const EdgeInsets.all(7.0),
                              height: MediaQuery.of(context).size.height / 8,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                               
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*.75,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${apicall.personsDataList[index].title}",
                                          style: frontTitle(),
                                          maxLines: 2, // Set the maximum number of lines
                                          overflow:
                                              TextOverflow.ellipsis, // Overflow behavior
                                        ),
                                        Text(
                                          "${apicall.personsDataList[index].body}",
                                          style: frontSubTitle(),
                                          maxLines:3, // Adjust the maximum number of lines as needed
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${(apicall.personsDataList[index].updatedAt)?.substring(0,10)}",
                                          style: frontDate(),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          "${apicall.personsDataList[index].user?.login}",
                                          style: front(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      )
    ]);
  }

  TextStyle front() => const TextStyle(fontSize: 10, color: Colors.black);

  TextStyle frontTitle() => const TextStyle(
      fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);

  TextStyle frontSubTitle() =>
      const TextStyle(fontSize: 10, color: Color.fromARGB(255, 83, 81, 81));

  TextStyle frontUser() => const TextStyle(fontSize: 12, color: Colors.black);

  TextStyle frontDate() => const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);
}
