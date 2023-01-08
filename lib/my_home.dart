import 'package:flutter/material.dart';
import 'package:reski_sample/model/my_artikel.dart';
import 'package:reski_sample/service/api.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  ApiService myapi = ApiService();
  late Future<List<MyArtikel>> artikelList;

  @override
  void initState() {
    super.initState();
    artikelList = myapi.ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: FutureBuilder<List<MyArtikel>>(
                future: artikelList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<MyArtikel> dataKu = snapshot.data!;
                    return Container(
                      height: 400,
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: dataKu.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(dataKu[index].avatar!),
                              ),
                              title: Text(dataKu[index].name!),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
              ),
              onPressed: () {
                tambahData();
              },
              child: const Text('Tambah Data'),
            ),
          ],
        ),
      ),
    );
  }

  void tambahData() async {
    bool response = await myapi.postData(
        'Yaomink',
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
        'uDesk',
        'uJudul');
    if (response == true) {
      setState(() {
        artikelList = myapi.ambilData();
      });
    }
  }
}
