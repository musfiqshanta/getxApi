import 'package:flutter/material.dart';
import 'package:getxapiproject/view/product_list_view.dart';

import 'api/auth.dart';
import 'model/api_model.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
//  final mycontroler = Get.put(ProductView());
  // final mycontrolers = Get.put(ProductView());
  // final _controller = Get.find<ProductView>();
  final mycontrolers = Get.put(Controller());
  final _controller = Get.find<Controller>();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // late Future <Welcome?>?> post;
  //final getdata = Welcome();
  //final initdata = Authenticaiton();
  //late Future<Welcome> initdatawelcomedata;

  //final List<Welcome> items;

  @override
  void initState() {
    // post = initdata.fetchProduct();

    // print("post");
    // print(post.);

    //  print(mycontroler.productList.length);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // body: Obx(() => Center(
      //       child: ListView.builder(
      //           itemCount: mycontroler.productList.length,
      //           itemBuilder: ((context, index) {
      //             return Column(
      //               children: <Widget>[
      //                 Text("brand"),
      //                  Text(mycontroler.productList[index].brand)
      //               ],
      //             );
      //           })),
      //     )),

      body: Obx(
        () => _controller.isLoading.value
            ? const CircularProgressIndicator()
            : Center(
                child: ListView.builder(
                  itemCount: _controller.photoList.length,
                  itemBuilder: ((context, index) {
                    return (ListTile(
                      leading: Image(
                          image: NetworkImage(
                              _controller.photoList[index].imageLink)),
                      title: Text(_controller.photoList[index].name),
                      subtitle:Text(_controller.photoList[index].brand.toString()) ,
                    ));
                  }),
                ),
              ),
      ),

      // body: Text("f"),
    );
  }
}
