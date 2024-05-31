import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent/page/tenants_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/images/logo.svg",
            color: Colors.cyan,
            width: 100,
            height: 100,
          ),
          //Image.asset("assets/images/total.png"),
          const Text(
            "Rent of appertement",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const Text(
            "Rent of appartement location",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton.icon(
            onPressed: (){
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const TenantPage()
                  )
              );
            },
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.greenAccent)),
            label: const Text("Afficher la liste des locataires"),
            icon: const Icon(Icons.list),
          )

        ],
      ),
    );
  }
}