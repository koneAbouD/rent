import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddTenantPage extends StatefulWidget {
  const AddTenantPage({super.key});

  @override
  State<AddTenantPage> createState() => _AddTenantPageState();
}

class _AddTenantPageState extends State<AddTenantPage> {
  final _formKey = GlobalKey<FormState>();
  final nameTenantController = TextEditingController();
  final lastNameTenantController = TextEditingController();
  String selectedBatLocataire = 'bat1';
  DateTime selectedDate = DateTime.now();
  @override
  void dispose() {
    super.dispose();

    nameTenantController.dispose();
    lastNameTenantController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Nom",
                    hintText: "Entrer le nom du locataire",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez le nom du locataire svp !';
                  }
                  return null;
                },
                controller: nameTenantController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Prenom",
                    hintText: "Entrer le prenom du locataire",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez le prenom du locataire svp !';
                  }
                  return null;
                },
                controller: lastNameTenantController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: 'bat1', child: Text("Bat 1")),
                  DropdownMenuItem(value: 'bat2', child: Text("Bat 2")),
                  DropdownMenuItem(value: 'bat3', child: Text("Bat 3"))
                ],
                value: selectedBatLocataire,
                onChanged: (value) {
                  setState(() {
                    selectedBatLocataire = value!;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  labelText: "Date d'entre",
                ),
                firstDate: DateTime.now().add(const Duration(days: 10)),
                lastDate: DateTime.now().add(const Duration(days: 40)),
                initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
                mode: DateTimeFieldPickerMode.date,
                autovalidateMode: AutovalidateMode.always,
                onChanged: (value) {
                  setState(() {
                    selectedDate = value!;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = nameTenantController.text;
                    final lastName = lastNameTenantController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    CollectionReference tenantsRef = FirebaseFirestore.instance.collection("Tenants");
                    tenantsRef.add(
                        {
                          "name" : name,
                          "last_name" : lastName,
                        }
                    );

                  }
                },
                child: const Text("Envoyer"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
