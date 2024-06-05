import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent/models/tenant_model.dart';

class TenantPage extends StatefulWidget {

  const TenantPage({super.key});

  @override
  State<TenantPage> createState() => _TenantsPageState();
}

class _TenantsPageState extends State<TenantPage> {

  Future<void> _showDetailTenant(Tenant tenant) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('${tenant.lastName} occupe'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


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

            List<Tenant> tenants = [];
            snapshot.data!.docs.forEach((data){
              tenants.add(Tenant.fromData(data));
            });

            return ListView.builder(
              itemCount: tenants.length,
              itemBuilder: (context, index){
                final tenant = tenants[index];
                const moisArrieres = 1;
                return Card(
                  child: ListTile(
                    title: Text(tenant.name),
                    leading: SvgPicture.asset(
                      "assets/images/logo.svg",
                      width: 40,
                      height: 40,
                    ),
                    subtitle: moisArrieres <= 0
                        ? const Text('A jour',
                      style: TextStyle(color: Colors.green),
                    )
                        : const Text('En retard',
                        style: moisArrieres > 2
                            ? TextStyle(color: Colors.redAccent)
                            : TextStyle(color: Colors.orange)
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        _showDetailTenant(tenant);
                      },
                    ),
                  ),
                );
              },
            );
          },
        )
    );
  }
}

