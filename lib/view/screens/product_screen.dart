import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/list.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

TextEditingController txtName = TextEditingController();
TextEditingController txtProduct = TextEditingController();
TextEditingController txtQuantity = TextEditingController();
TextEditingController txtPrice = TextEditingController();

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff6895D2),
        title: Text(
          'Invoice Generator',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.share,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.picture_as_pdf,
            color: Colors.black,
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: txtName,
              textInputAction: TextInputAction.next,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 18,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            TextField(
              controller: txtProduct,
              textInputAction: TextInputAction.next,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Product Name',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.shop_2,
                  color: Colors.grey,
                  size: 18,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            TextField(
              controller: txtQuantity,
              textInputAction: TextInputAction.next,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Colors.grey,
                  size: 18,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            TextField(
              controller: txtPrice,
              textInputAction: TextInputAction.next,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.currency_rupee,
                  color: Colors.grey,
                  size: 18,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/add');
                setState(() {
                  int finalprice =
                      int.parse(txtQuantity.text) * int.parse(txtPrice.text);
                  productName.add(txtProduct.text);
                  productAmount.add(finalprice);
                  productQty.add(txtQuantity.text);
                });
              },
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
