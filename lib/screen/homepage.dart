import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // bool varSementara = true;
  List<Todo> todos = dataTodo;
  @override
  Widget build(BuildContext context) {
    AppBar myAppbar = AppBar(
      title: Text("Todo App"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

    double heightBody = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;

    // Function Search Todo

    void searchTodo(String query) {
      final todoFilter = dataTodo.where((todo) {
        final todoTitle = todo.title.toLowerCase();
        final inputt = query.toLowerCase();
        return todoTitle.contains(inputt);
      }).toList();
      setState(() {
        todos = todoFilter;
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "add_todo");
        },
        child: Icon(Icons.add),
      ),
      appBar: myAppbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              // color: Colors.amber,
              width: widthBody,
              height: heightBody * 0.15,
              child: TextField(
                onChanged: searchTodo,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefix: Icon(Icons.search),
                    hintText: "Search Your task.."),
              ),
            ),
            todos.length != 0
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: heightBody * 0.85,
                    width: widthBody,
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: ((context, index) {
                        final todo = todos[index];
                        return CheckboxListTile(
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: todo.isCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            subtitle: Text(todo.desc),
                            value: todo.isCompleted,
                            onChanged: (value) {
                              setState(() {
                                todo.isCompleted = value!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            secondary: IconButton(
                              onPressed: () {
                                setState(() {
                                  todos.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ));
                      }),
                    ),
                  )
                : Container(
                    child: Text("Data Kosong..."),
                  ),
          ],
        ),
      ),
    );
  }
}
