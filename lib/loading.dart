import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:untitled13/invoice_model.dart';
import 'invoice.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}
void fetchInvoice(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/');
}

class _LoadingState extends State<Loading> {
  void fetchInvoice(BuildContext context) async{
    List<Invoice> invoices = [];

    http.Response response = await http.get(Uri.parse('https://www.jsonkeeper.com/b/462B'));
    if(response.statusCode == 200) {
      print(response.body);
      var jsonObject = jsonDecode(response.body);
      var jsonArr = jsonObject['invoices'] as List;
      invoices = jsonArr.map((e) => Invoice.fromJson(e)).toList();
    }
    context.read<InvoiceModel>().invoices = invoices;
    Navigator.pushReplacementNamed(context, '/');
  }
  @override
  void initState() {
    super.initState();
    fetchInvoice(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
