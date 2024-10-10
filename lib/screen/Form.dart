import 'package:exam_flutter/screen/utils/globals.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter your name';
                  return null;
                },
                onSaved: (value) => Globals.name = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'GRID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter your grid';
                  if (int.tryParse(value) == null) {
                    return 'GRID must be a number';
                  }
                  return null;
                },
                onSaved: (value) => Globals.grid = int.tryParse(value!),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'STD',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter your STD';
                  if (int.tryParse(value) == null) {
                    return 'STD must be a number';
                  }
                  return null;
                },
                onSaved: (value) => Globals.standard = int.tryParse(value!),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!
                            .save(); // This saves the current form field values

                        // Add the student to the Globals list
                        Globals.addStudent(
                          Globals.name!,
                          Globals.grid!,
                          Globals.standard!,
                        );

                        // Print for debugging purposes
                        print("Name: ${Globals.name}");
                        print("GRID: ${Globals.grid}");
                        print("STD: ${Globals.standard}");

                        // Show SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Form Saved: Name: ${Globals.name}, GRID: ${Globals.grid}, STD: ${Globals.standard}",
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );

                        // Optionally pop back to the HomePage
                        Navigator.pop(context); // Return to the HomePage
                      }
                    },
                    child: Text("SAVE"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        formkey.currentState!.reset();
                        Globals.name = null;
                        Globals.grid = null;
                        Globals.standard = null;
                      });
                    },
                    child: Text("RESET"),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
