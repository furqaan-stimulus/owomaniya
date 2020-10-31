import 'package:flutter/material.dart';
import 'package:owomaniya/viewmodels/payment_method_view_model.dart';
import 'package:stacked/stacked.dart';

class PaymentMethodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentMethodViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Payment'),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.grey,
                              size: 70.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'You (Anonymous)',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),
                          Icon(Icons.edit),
                          Text('Edit'),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text('Query Part'),
                      Divider(
                        color: Colors.grey,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.radio_button_checked,
                                color: Colors.pink,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 300,
                                child: Text(
                                  'Pay Rs.80 online',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 7,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 300,
                                child: Text(
                                  'You can use your credit/debit card, Internet banking or PayTM',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => PaymentMethodViewModel());
  }
}
