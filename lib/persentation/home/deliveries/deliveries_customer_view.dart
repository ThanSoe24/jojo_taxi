
import 'package:flutter/material.dart';
import 'package:jojo_taxi/persentation/home/deliveries/accept_customer_view.dart';
import 'package:jojo_taxi/persentation/home/deliveries/deliveries_online_view.dart';
import 'package:jojo_taxi/persentation/home/deliveries/request_customer_view.dart';

class DeliveriesCustomerView extends StatefulWidget {
  const DeliveriesCustomerView({Key? key}) : super(key: key);

  @override
  State<DeliveriesCustomerView> createState() => _DeliveriesCustomerViewState();
}

class _DeliveriesCustomerViewState extends State<DeliveriesCustomerView> {
  bool isAccept = false;

  void handleAccept(){
    setState(() {
      isAccept = !isAccept;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAccept ? const AcceptCustomerView() : RequestCustomerView(handleAccept: handleAccept,);
  }
}
