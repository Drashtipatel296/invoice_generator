import 'package:flutter/material.dart';
import 'package:invoice_generator/view/screens/add_screen.dart';
import 'package:invoice_generator/view/screens/edit_screen.dart';
import 'package:invoice_generator/view/screens/home_screen.dart';
import 'package:invoice_generator/view/screens/pdf_screen.dart';
import 'package:invoice_generator/view/screens/product_screen.dart';

void main(){
  runApp(const InvoiceApp());
}

class InvoiceApp extends StatefulWidget {
  const InvoiceApp({super.key});

  @override
  State<InvoiceApp> createState() => _InvoiceAppState();
}

class _InvoiceAppState extends State<InvoiceApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home' : (context) => HomeScreen(),
        '/product' : (context) => ProductScreen(),
        '/add' : (context) => AddScreen(),
        '/edit' : (context) => EditScreen(),
        '/pdf' : (context) => PdfScreen(),
        '/preview' : (context) => preview(),
      },
    );
  }
}
