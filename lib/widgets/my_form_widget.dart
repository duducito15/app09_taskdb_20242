import 'package:app09_taskdb_20242/db/db_admin.dart';
import 'package:app09_taskdb_20242/models/task_model.dart';
import 'package:flutter/material.dart';

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({super.key});

  @override
  State<MyFormWidget> createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  bool isFinished = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  addTask() {
    TaskModel model = TaskModel(
      title: _titleController.text,
      description: _descriptionController.text,
      status: isFinished.toString(),
    );
    DbAdmin.db.insertTask(model).then((value) {
      if (value > 0) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.greenAccent,
              ),
              Text("Tarea registrada con éxito"),
            ],
          )),
        );
      }
    });
  }

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
            controller: _titleController,
            decoration: InputDecoration(hintText: "Title"),
          ),
          SizedBox(
            height: 6.0,
          ),
          TextField(
            controller: _descriptionController,
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
                onPressed: () {
                  addTask();
                },
                child: Text("Aceptar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
