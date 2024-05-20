import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TenantPage extends StatelessWidget {
  const TenantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lists des locataire"),
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
        ),
        body: Center(
            child: ListView(
              children:  const [
                Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Coulibaly"),
                    subtitle: Text("Ajours",
                    style: TextStyle(color: Colors.green),),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Ouattara"),
                    subtitle: Text("En retard de deux mois",
                      style: TextStyle(color: Colors.orange),),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Sib"),
                    subtitle: Text("En retard de quatre mois",
                      style: TextStyle(color: Colors.redAccent),),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Bamba"),
                    subtitle: Text("Ajours",
                      style: TextStyle(color: Colors.green),),
                    trailing: Icon(Icons.more_vert),
                  ),
                )
              ],
            )
        )
    );
  }
}
