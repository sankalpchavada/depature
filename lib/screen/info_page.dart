import 'package:depature/model/json_model.dart';
import 'package:depature/provider/funcprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  InfoPage({super.key, required this.shlokdata});

  geetaData shlokdata;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepOrange),
                        width: 324,
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 42,
                              height: 43,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFFA116),
                                shape: OvalBorder(),
                              ),
                              child: Center(
                                child: Text(
                                  '${widget.shlokdata.ch_no}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                                child: Container(
                              width: 180,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: (Provider.of<FuncProvider>(context)
                                              .langBool
                                              .ishindi ==
                                          false)
                                      ? Text("${widget.shlokdata.name}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white))
                                      : Text("${widget.shlokdata.name_hindi}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white))),
                            )),
                            SizedBox(
                              width: 12,
                            ),
                            Image.asset(
                              "assets/images/krishna.png",
                              scale: 9,
                            ),
                            SizedBox(
                              width: 11,
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/splash_image.jpeg',
                          scale: 10),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SingleChildScrollView(
                              child: Container(
                                child: (Provider.of<FuncProvider>(context)
                                            .langBool
                                            .ishindi ==
                                        false)
                                    ? Text(
                                        widget.shlokdata.ch_summery,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      )
                                    : Text(
                                        widget.shlokdata.ch_summery_hindi,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                              ),
                            ),
                          ),
                          width: 320,
                          height: 350,
                          decoration: ShapeDecoration(
                            color: Colors.black12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(33),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                tooltip: 'Translate'),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.account_circle_outlined)),
            IconButton(
                onPressed: () {
                  Provider.of<FuncProvider>(context, listen: false)
                      .changeTheme();
                },
                icon: (Provider.of<FuncProvider>(context).themeDetail.isDark ==
                        false)
                    ? Icon(Icons.dark_mode_outlined)
                    : Icon(Icons.brightness_high_outlined)),
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
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
