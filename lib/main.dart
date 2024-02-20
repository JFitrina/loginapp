import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var cmController = TextEditingController();
  var result="";
  var bgColor=Colors.blue.shade100;
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('LOGIN APP'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text('Enter your Name'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: cmController,
                  decoration: InputDecoration(
                      label: Text('Enter your Password'),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                height: 20,
                ),
                ElevatedButton(onPressed:(){
                  var wt=wtController.text.toString();
                  var cm=cmController.text.toString();
        
                  if(wt != "" && cm != ""){
                    //cal bmi
                    var iWt=int.parse(wt);
                    var iCm=int.parse(cm);
                    var iM=iCm/100;
                    var bmi=iWt/(iM * iM);
                    var msg="";
                    if(bmi>25){
                      msg="";
                      bgColor=Colors.red.shade100;
                    }else if(bmi<18){
                      msg="";
                      bgColor=Colors.yellow.shade100;
                    }else{
                      msg="";
                      bgColor=Colors.green.shade100;
                    }

                    setState(() {
                      result = "Your BMI is: ${bmi.toStringAsFixed(4)}";
              
                    });
        
                  }else{
                    setState(() {
                      result="Please fill all text box";
                    });
                  }
                },
                child: Text('login')),
                SizedBox(
                height: 30,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
