import 'package:flutter/material.dart';
import 'invoice.dart';

class InvoiceModel extends ChangeNotifier{
  List<Invoice> invoices=[];
  int _invoiceNo = 1;
  int get invoiceNo  {
    if(invoices.isEmpty) {
      return 1;
    } else {
      return  invoices.last.invoiceNo+1;
    }
  }

  set invoiceNo(int value) {
    _invoiceNo = value;
  }

  int selectedIndex = 0;
  Invoice getSelectedInvoice() {
    return invoices[selectedIndex];
  }
  void removeInvoice() {
    invoices.removeAt(selectedIndex);
    notifyListeners();
  }
}