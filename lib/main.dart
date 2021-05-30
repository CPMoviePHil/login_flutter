import 'package:f_provider/screens/login.dart';
import 'package:f_provider/utils/providers/login.dart';
import 'package:flutter/material.dart';
import 'package:f_provider/utils/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetCurrentNumber>(
          create: (context) => GetCurrentNumber(),
        ),
        ChangeNotifierProvider<LoginNotifier>(
          create: (context) => LoginNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetCurrentNumber>(context, listen: false,).initNumber(num: 20,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<GetCurrentNumber>(
              builder: (BuildContext context, currentNum, _) {
                return Text(
                  '${currentNum.currentNumber}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            InkWell(
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Login()),
              ),
              child: Text("Login In"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<GetCurrentNumber>(context, listen: false,).changeCurrentNumber(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
