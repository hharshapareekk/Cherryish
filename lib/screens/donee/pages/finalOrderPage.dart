import 'package:cherryish/Styles.dart';
import 'package:cherryish/database.dart';
import 'package:cherryish/screens/donee/widgets/submitAlert.dart';
import 'package:flutter/material.dart';

class FinalOrderPage extends StatelessWidget {
  const FinalOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation of Order'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Verify Your Details:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildDetailItem('Name', Database.donees[1].name),
            buildDetailItem('Username', Database.donees[1].username),
            buildDetailItem('Address', Database.donees[1].address),
            buildDetailItem('Phone', Database.donees[1].phoneNumber),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Order Summary:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildOrderItem(Database.items.values.elementAt(2).cover,
                Database.items.values.elementAt(2).name, '2'),
            buildOrderItem(
              Database.items.values.elementAt(4).cover,
              Database.items.values.elementAt(4).name,
              '1',
            ),
            buildOrderItem(
              Database.items.values.elementAt(5).cover,
              Database.items.values.elementAt(5).name,
              '6',
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                   FinalSubmitAlert(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                child: Text(
                  'Confirm Order',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label + ':', style: textStyles.description),
          Text(
            value,
            style: textStyles.alertButtons,
          ),
        ],
      ),
    );
  }

  Widget buildOrderItem(String coverPic, String productValue, String quantity) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 400,
        height: 100,
        decoration: customDecoration(),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image(
            image: AssetImage(coverPic),
            width: 100,
            height: 150,
          ),
          title: Text(
            productValue,
            style: TextStyle(fontSize: 25),
          ),
          subtitle: Text(
            'Quantity: $quantity',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
