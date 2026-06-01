import 'package:tp2_flutter_chatbot/pages/chatbot.page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/chat": (context) => chatbotPage()
      },
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.amber,
        tabBarTheme: TabBarThemeData(indicatorColor: Colors.white),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log in page",
          style: TextStyle(color: Theme.of(context).tabBarTheme.indicatorColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 400,
          width: 400,
          //color: Colors.black12,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Username", style: TextStyle(fontSize: 17)),

                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text("Password", style: TextStyle(fontSize: 17)),

                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String username = usernameController.text;
                        String password = passwordController.text;

                        if (username == "admin" && password == "admin") {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, "/chat");
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),

                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Theme.of(context).tabBarTheme.indicatorColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
