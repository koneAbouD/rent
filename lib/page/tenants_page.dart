import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TenantPage extends StatefulWidget {

  const TenantPage({super.key});

  @override
  State<TenantPage> createState() => _TenantsPageState();
}

class _TenantsPageState extends State<TenantPage> {
  final tenants = [
    {
      "name" : "Colibaly Djibril",
      "moisArrieres" : 0,
      "appartement" : "A2"
    },
    {
      "name" : "Ouattara kassoum",
      "moisArrieres" : 2,
      "appartement" : "A2"
    },
    {
      "name" : "Sib Ery",
      "moisArrieres" : 4,
      "appartement" : "A2"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Tenants").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }

            if (!snapshot.hasData){
              return const Text('Aucune donneé');
            }

            /*List<dynamic> tenants = [];
            snapshot.data!.docs.forEach((element){
              tenants.add(element);
            });*/

            return ListView.builder(
              itemCount: tenants.length,
              itemBuilder: (context, index){
                final tenant = tenants[index];
                final nom = tenant['name'];
                final moisArrieres = tenant['moisArrieres'] as int;
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('$nom'),
                    subtitle: moisArrieres < 0
                        ? const Text('A jours',
                      style: TextStyle(color: Colors.green),
                    )
                        : const Text('En retard',
                        style: TextStyle(color: Colors.green)
                    ),
                    trailing: const Icon(Icons.more_vert),
                  ),
                );
              },
            );
          },

        )
    );
  }
}

