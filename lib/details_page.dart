import 'package:flutter/material.dart';
import 'package:untitled13/invoice_model.dart';
import 'invioces_page.dart';
import 'main.dart';
import 'product.dart';
import 'package:provider/provider.dart';
import 'invoice.dart';
class DetailsPage extends StatelessWidget {

  const DetailsPage({Key? key}) : super(key: key);
  String total(BuildContext context) {
    Invoice inv = context.read<InvoiceModel>().getSelectedInvoice();
    String result = '';
    int quantity = 0;
    double totalPrice = 0;
    for (var p in inv.products) {
      quantity += p.quantity;
      totalPrice += p.quantity*p.price;
    }
    result += 'Total Price: $totalPrice \nTotal Quantity: $quantity';
    return result;
  }
  String getProducts(BuildContext context) {
    Invoice inv = context.read<InvoiceModel>().getSelectedInvoice();
    String prd = '';
    // for(int i=0;i<inv.products.length;i++) {
    //   prd += '${inv.products[i].name} Price: ${inv.products[i].price} Quantity: ${inv.products[i].quantity}\n';
    // }
    // for(Product p in inv.products) {
    //   prd += '${p.name} Price: ${p.price} Quantity: ${p.quantity}\n';
    // }
    int i = 1;
    inv.products.forEach((p) {
      prd += '${i++}- ${p.name}, Price: ${p.price}, Quantity: ${p.quantity}\n';
    });
    return prd;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<InvoiceModel>(
          builder: (context, value, child) => Text(value.getSelectedInvoice().customerName),
        ),
      ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<InvoiceModel>(
          builder: (context, value, child) => Text('Invoice no: ${value.getSelectedInvoice().invoiceNo}',style: TextStyle(fontSize: 22),),
        ),
        const SizedBox(height: 10,),
        const Text('Products:',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        const SizedBox(height: 5,),
        Text(getProducts(context),style: const TextStyle(fontSize:20),),
        Text(total(context),style: const TextStyle(fontSize: 22),),
      ],
    ),
    );
  }
}
