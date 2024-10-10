import 'package:flutter/material.dart';
import 'package:exam_flutter/screen/utils/globals.dart'; // Import the Globals class

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
      ),
      body: Globals.students.isEmpty // Check if the students list is empty
          ? Center(
              child: Text(
              "No students added",
              style: TextStyle(
                fontSize: 20, // Set font size to 20
                fontWeight: FontWeight.bold, // Set font weight to bold
              ),
            )) // Center the text
          : ListView.builder(
              itemCount: Globals.students.length, // Get the count from Globals
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,
                        "detailPage"); // Navigate to detail page if needed
                  },
                  child: ListTile(
                    title: Text(
                        Globals.students[i]['name']), // Display student name
                    subtitle: Text(
                        "Standard: ${Globals.students[i]['standard']} | GRID: ${Globals.students[i]['grid']}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          Globals.students.removeAt(i);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "formpage");
          setState(() {}); // Refresh the UI when returning from FormPage
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
