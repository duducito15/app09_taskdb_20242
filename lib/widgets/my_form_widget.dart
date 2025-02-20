import 'package:flutter/material.dart';

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({super.key});

  @override
  State<MyFormWidget> createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Add task"),
          SizedBox(
            height: 6.0,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Title"),
          ),
          SizedBox(
            height: 6.0,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Description"),
            maxLines: 2,
          ),
          SizedBox(
            height: 6.0,
          ),
          Row(
            children: [
              Text("Status: "),
              Checkbox(
                value: isFinished,
                onChanged: (value) {
                  isFinished = value!;
                  setState(() {});
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              ),
              SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Aceptar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
