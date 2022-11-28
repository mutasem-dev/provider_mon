import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled13/invoice_model.dart';
import 'main.dart';

import 'details_page.dart';
import 'invoice.dart';
class InvoicesPage extends StatelessWidget {


  const InvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Customers'),
      ),
      body: Consumer<InvoiceModel>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.invoices.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  value.selectedIndex = index;
                  value.removeInvoice();
                },
              ),
              onTap: () {
                value.selectedIndex = index;
                Navigator.pushNamed(context, '/detailsPage');
              },
              tileColor: Colors.blueAccent,
              leading: Text(value.invoices[index].customerName,style: TextStyle(fontSize: 22),),
            ),
          ),
        ),
      )
    );
  }
}
