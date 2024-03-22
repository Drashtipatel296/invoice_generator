import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff6895D2),
        title: Text(
          'Invoice Generator',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(Icons.share,color: Colors.black,),
          SizedBox(width: 20,),
          Icon(Icons.picture_as_pdf,color: Colors.black,),
        ],
        centerTitle: true,
      ),
      body: Center(
          child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/product');
              },
            child: Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xff6895D2),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: Text('Create Invoice',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      );
  }
}
