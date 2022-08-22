import 'package:flutter/material.dart';
import 'package:my_expense/model/Transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transaction = [
    Transaction(id: 'Bhavesh',
        title: 'Books',
        amount: 200.00,
        dateTime: DateTime.now()),
    Transaction(id: 'Aditya',
        title: 'Gifts',
        amount: 100.00,
        dateTime: DateTime.now())
  ];
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  _addTransaction(String id ,String title , double amount){
    print(id);
    print(title);
    print(amount);
    var newTr = Transaction(id: id, title: title, amount: amount, dateTime: DateTime.now());
    setState(() {
      transaction.add(newTr);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expense'),
      ),
      body: Column(
        children:[
          Card(
            child: Column(
              children: [
                TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    hintText: 'Id'
                  ),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title'
                  ),
                ),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    hintText: 'Amount'
                  ),
                ),
                ElevatedButton(onPressed: (){
                  _addTransaction(idController.text,titleController.text, double.parse(amountController.text));
                },
                  child: Text('Submit'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: Text('Show List',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Colors.white),),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transaction.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: Text('${transaction[index].id}',style: TextStyle(fontSize: 20),),
                    title: Text('${transaction[index].title}'),
                    subtitle: Text('${transaction[index].dateTime}'),
                    trailing: Text('${transaction[index].amount}'),
                  );

                    //   SizedBox(
                    //     height: 120,
                    //   ),
                    //   Text('${transaction1[index].id}'),
                    //   Text('${transaction1[index].title}'),
                    //   Text('${transaction1[index].amount}'),
                    //   Text('${transaction1[index].dateTime}'),

                }
                ),
          ),
        ],
      ),
    );
  }
}
