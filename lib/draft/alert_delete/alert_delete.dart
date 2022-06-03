import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  List<int> items = List<int>.generate(20, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey<int>(items[index]),
            child: ListTile(
              trailing: Icon(Icons.check_box_outline_blank),
              title: Text(
                'Title ${items[index] + 1}',
              ),
            ),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (DismissDirection direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirm"),
                    content: Text("Are you sure you wish to delete this item?"),
                    actions: <Widget>[
                      ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text("Confirm")
                      ),
                      OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("Cancel"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}