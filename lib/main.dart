import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqlite_app/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: HomeScreen(),
    );
  }
}



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('DataBase demo'),),
    body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        FlatButton(onPressed: () async{

         int i = await DataBaseHelper.instance.insert({
            DataBaseHelper.columnName : 'puneet',

          });

print('inserted id is $i');

        }, child: Text('Insert'),color: Colors.grey,),
        FlatButton(onPressed: () async{

         List<Map<String, dynamic>> userList  = await DataBaseHelper.instance.queryAll();

         print('fetched user list $userList');



        }, child: Text('Fetch'),color: Colors.green),
        FlatButton(onPressed: () async{


         int updateId = await DataBaseHelper.instance.update({
            DataBaseHelper.columnId : 1,
            DataBaseHelper.columnName : 'Neha',
          });


          print('updated user id $updateId');



        }, child: Text('Update'),color: Colors.blue[600]),
        FlatButton(onPressed: ()async{

          int deletedId = await DataBaseHelper.instance.delete(3);
          print('deleted id is $deletedId');



        }, child: Text('Delete'),color: Colors.red),


      ],),
    ),
    );
    
  }
}