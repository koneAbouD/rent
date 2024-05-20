import 'package:flutter/material.dart';

class TenantPage extends StatefulWidget {

  const TenantPage({super.key});

  @override
  State<TenantPage> createState() => _TenantPageState();
}

class _TenantPageState extends State<TenantPage> {
  final tenants = [
    {
      "nom" : "Colibaly Djibril",
      "moisArrieres" : 0,
      "appartement" : "A2"
    },
    {
      "nom" : "Ouattara kassoum",
      "moisArrieres" : 2,
      "appartement" : "A2"
    },
    {
      "nom" : "Sib Ery",
      "moisArrieres" : 4,
      "appartement" : "A2"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lists des locataire"),
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
        ),
        body: Center(
            child: ListView.builder(
              itemCount: tenants.length,
              itemBuilder: (context, index){
                final tenant = tenants[index];
                final nom = tenant['nom'];
                final moisArrieres = tenant['moisArrieres'];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('$nom'),
                    subtitle: const Text("Ajours",
                      style: TextStyle(color: Colors.green),),
                    trailing: const Icon(Icons.more_vert),
                  ),
                );
              },
            )
        )
    );
  }
}

