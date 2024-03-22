import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/list.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff6895D2),
        leading: Icon(
          Icons.local_print_shop_rounded,
          color: Colors.black,
        ),
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
          InkWell(
            onTap: () {
              for()
                {

                }
            },
            child: Icon(
              Icons.picture_as_pdf,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => productBox(index),
        itemCount: productName.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff6895D2),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/product');
        },
      ),
    );
  }

  Widget productBox(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: Text(
                '${productName[index]}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              title: Text(
                '${productQty[index]} Qty',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              trailing: Text(
                '${productAmount[index]}/-',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/edit').then((value) {
                setState(() {});
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                productName.removeAt(index);
                productQty.removeAt(index);
                productAmount.removeAt(index);
              });
            },
          ),
        ],
      ),
    );
  }
}

Future<Uint8List> generatePdf() async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "INVOICE",
              style: pw.TextStyle(
                  fontSize: 50,
                  fontWeight: pw.FontWeight.bold,
                  letterSpacing: 3),
            ),
            pw.SizedBox(height: 40),
            pw.Row(children: [
              pw.Text("Invoice No.:", style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold),),
              pw.SizedBox(width: 15),
              pw.Text("0000001", style: pw.TextStyle(fontSize: 20),),
            ]),
            pw.SizedBox(height: 20),
            pw.Row(children: [
              pw.Text("Bill to:", style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold),),
              pw.SizedBox(width: 67),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("Liceria & co.", style: pw.TextStyle(fontSize: 18),),
                  pw.Text("123, Anywhere St.", style: pw.TextStyle(fontSize: 18),),
                  pw.Text("Any City, ST 12345", style: pw.TextStyle(fontSize: 18),),
                ],
              ),
            ]),
            pw.SizedBox(height: 15),
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 10),
                  pw.Table(
                    border: pw.TableBorder.all(),
                    children: [
                      pw.TableRow(
                        children: [
                          pw.Container(
                            alignment: pw.Alignment.center,
                            margin: pw.EdgeInsets.all(5),
                            child: pw.Text('Product Name',style: pw.TextStyle(fontSize: 16,fontWeight: pw.FontWeight.bold),),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            margin: pw.EdgeInsets.all(5),
                            child: pw.Text('Quantity',style: pw.TextStyle(fontSize: 16,fontWeight: pw.FontWeight.bold)),
                          ),
                          pw.Container(
                            alignment: pw.Alignment.center,
                            margin: pw.EdgeInsets.all(5),
                            child: pw.Text('Amount',style: pw.TextStyle(fontSize: 16,fontWeight: pw.FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Container(
                    height: 300,
                    width: 482,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        width: 1.5,
                        color: PdfColors.black,
                      ),
                    ),
                    child: pw.Column(
                      children: [
                        pw.ListView.builder(
                            itemBuilder: (context, index) => pw.Container(
                                  height: 20,
                                  width: double.infinity,
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.spaceEvenly,
                                      children: [
                                        pw.Text(
                                          '       ${productName[index]}',
                                          style:
                                              const pw.TextStyle(fontSize: 17),
                                        ),
                                        pw.Text(
                                          '                             ${productQty[index]}',
                                          style:
                                              const pw.TextStyle(fontSize: 17),
                                        ),
                                        pw.Text(
                                          '                ${productAmount[index]}',
                                          style:
                                              const pw.TextStyle(fontSize: 17),
                                        ),
                                      ]),
                                ),
                            itemCount: productName.length),
                        pw.Text(
                            'Total                                                 ${total}',
                            style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold),),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 40),
                  pw.Row(children: [
                    pw.Text('Bank Name:',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                    pw.SizedBox(width: 40),
                    pw.Text('Olivia Wilson',
                        style: pw.TextStyle(fontSize: 18)),
                  ]),
                  pw.Row(children: [
                    pw.Text('Bank Account:',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                    pw.SizedBox(width: 20),
                    pw.Text('0123 4567 8901',
                        style: pw.TextStyle(fontSize: 18)),
                  ],),
                  pw.Row(children: [
                    pw.Text('Date:',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                    pw.SizedBox(width: 102),
                    pw.Text('22-03-2023',
                        style: pw.TextStyle(fontSize: 18)),
                  ],),
                  pw.SizedBox(
                    height: 30
                  ),
                  pw.Divider(
                    thickness: 1,
                    color: PdfColors.black,
                  ),
                  pw.Text('If you have any question please contact: hello@realiygreatsite.com',style: pw.TextStyle(fontSize: 15,color: PdfColors.grey.shade(500))),
                ],
              ),
            )
          ],
        );
      },
    ),
  );
  PdfPreview(
    build: (format) => pdf.save(),
  );
  return pdf.save();
}

class preview extends StatefulWidget {
  const preview({super.key});

  @override
  State<preview> createState() => _previewState();
}

class _previewState extends State<preview> {
  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => generatePdf(),
    );
  }
}
