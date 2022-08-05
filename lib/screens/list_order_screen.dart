import 'package:flutter/material.dart';
import 'package:ivc/constants.dart';
import 'package:ivc/services/order_service.dart';

class ListOrderScreen extends StatefulWidget {
  const ListOrderScreen({ Key? key }) : super(key: key);

  @override
  State<ListOrderScreen> createState() => _ListOrderScreenState();
}
final List<String> entries = <String>['A', 'B', 'C'];
class _ListOrderScreenState extends State<ListOrderScreen> {
  @override
  void initState() {
    super.initState();
    getOrder();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index){
          return Column(
            children: [
              ListTile(
                leading: Image.asset(user_profile_icon),
                title: Text("Nom Client"),
                trailing: Text("12/12/2022"),
                subtitle: Text("Nom du model"),
                horizontalTitleGap: 5.3,
              ),
            ],
          );
        }
      ),
    );
  }
}