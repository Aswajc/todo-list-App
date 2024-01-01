import 'package:flutter/material.dart';

class Task {
  final String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [
    Task(title: 'call mom'),
    Task(title: 'seminar at 11'),
    Task(title: 'Task 3'),
  ];

  void _showAddTaskDialog() {
    String newTaskTitle = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Add Task'),
          content: TextField(
            onChanged: (value) {
              newTaskTitle = value;
            },
            decoration:const InputDecoration(hintText: 'Enter task name'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add(Task(title: newTaskTitle));
                });
                Navigator.of(context).pop();
              },
              child:const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         toolbarHeight: 80.0, 
        
        backgroundColor:const Color.fromARGB(255, 20, 19, 19), 
        title:const Text('✔✔  Lists ', style: TextStyle(color: Colors.white,fontSize: 30,fontStyle: FontStyle.italic),),
      ),
      
      body: Container(
        color:const Color.fromARGB(255, 20, 19, 19), // Setting the background color to black
        // ...

        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xFF3E3C3C), 
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              margin: const  EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: ListTile(
                title: Text(
                  tasks[index].title,
                  style: const TextStyle(color: Colors.white), 
                ),
                leading: InkWell(
                  onTap: () {
                    setState(() {
                      tasks[index].isCompleted = !tasks[index].isCompleted;
                    });
                  },
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color:const Color.fromARGB(255, 240, 207, 19), width: 2.0), // Yellow border color
                    ),
                    child: tasks[index].isCompleted
                        ? const Icon(Icons.check, size: 16.0, color: Color.fromARGB(255, 193, 164, 22)) // Yellow check icon
                        : null,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white), // White color for the delete icon
                  onPressed: () {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
       floatingActionButton: Container(
        width: 120.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: TextButton.icon(
          onPressed: () {
            _showAddTaskDialog();
          },
          icon: const Icon(Icons.add, color: Colors.black),
          label: const Text('Add item', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}