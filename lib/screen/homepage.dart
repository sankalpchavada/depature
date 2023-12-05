import 'dart:async';
import 'dart:convert';

import 'package:depature/screen/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/json_model.dart';
import '../provider/funcprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<geetaData> allchants = [];

  void initState() {
    // TODO: implement initState

    Timer(
      Duration(seconds: 3),
      () => getJson().then((value) {
        setState(() {});
      }),
    );
  }

  Future<void> getJson() async {
    String data = await rootBundle.loadString('assets/json/geetadata.json');

    var res = jsonDecode(data);

    List Shlok = res['bhagavad_gita'];

    allchants = Shlok.map((e) => geetaData(
        id: e['id'],
        name: e['name_translation'],
        ch_no: e['chapter_number'],
        ch_summery: e['chapter_summary'],
        ch_summery_hindi: e['chapter_summary_hindi'],
        name_hindi: e['name'],
        verse_count: e['verses_count'])).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("Bhagawat geeta"),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: allchants
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: BeveledRectangleBorder(),
                    child: ListTile(
                        style: ListTileStyle.list,
                        leading: Image.asset(
                          'assets/images/flag_geeta.png',
                          scale: 5,
                        ),
                        title: Text("#${e.ch_no}. ",
                            style: TextStyle(fontSize: 20)),
                        subtitle: (Provider.of<FuncProvider>(context)
                                    .langBool
                                    .ishindi ==
                                false)
                            ? Text(
                                e.name,
                                style: TextStyle(fontSize: 16),
                              )
                            : Text(
                                e.name_hindi,
                                style: TextStyle(fontSize: 16),
                              ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.chevron_right,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InfoPage(shlokdata: e),
                                ));
                          },
                        )),
                  ),
                ))
            .toList(),
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.account_circle_outlined)),
            IconButton(
                onPressed: () {
                  Provider.of<FuncProvider>(context, listen: false)
                      .changeTheme();
                },
                icon: Icon(Icons.dark_mode_outlined)),
            IconButton(
                onPressed: () {
                  Provider.of<FuncProvider>(context, listen: false)
                      .changeLang();
                },
                icon: Icon(Icons.translate_sharp))
          ],
        ),
        height: 60,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: Colors.yellow,
        ),
      ),
    );
  }
}
