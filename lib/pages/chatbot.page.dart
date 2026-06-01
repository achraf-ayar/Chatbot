import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class chatbotPage extends StatefulWidget {
  chatbotPage({super.key});

  @override
  State<chatbotPage> createState() => _chatbotPageState();
}

class _chatbotPageState extends State<chatbotPage> {
  TextEditingController queryController = TextEditingController();
  ScrollController scrollController = ScrollController();

  List messagesData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Chat bot",
          style: TextStyle(color: Theme.of(context).tabBarTheme.indicatorColor),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                controller: scrollController,
                itemCount: messagesData.length,
                itemBuilder: (context, index) {
                  bool isUser = messagesData[index]['type'] == "user";

                  return Column(
                    children: [
                      ListTile(
                        trailing: isUser?Icon(Icons.person):null,
                        leading: isUser?null:Icon(Icons.support_agent),
                        title: Row(
                          children: [
                            SizedBox(width: isUser?100:0),
                            Expanded(
                              child: Container(
                                color: isUser ? Colors.teal : Colors.grey,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  messagesData[index]['message'],
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).tabBarTheme.indicatorColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: isUser?0:100),
                          ],
                        ),
                      ),
                      Divider(height: 1),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: queryController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () {
                    String query = queryController.text;

                    var openAIuri = Uri.https(
                      "api.openai.com",
                      "/v1/chat/completions",
                    );
                    Map<String, String> headers = {
                      "Content-Type": "application/json",
                      "Authorization":
                          "Bearer Removed my api key",
                    };

                    var prompt = {
                      "model": "gpt-3.5-turbo",
                      "messages": [
                        {"role": "user", "content": query},
                      ],
                      "temperature": 0.7,
                    };

                    http
                        .post(
                          openAIuri,
                          headers: headers,
                          body: json.encode(prompt),
                        )
                        .then(
                          (resp) {
                            var responseBody = resp.body;

                            var llmResponse = json.decode(responseBody);

                            print(llmResponse);

                            String response =
                                llmResponse['choices'][0]['message']['content'];

                            setState(() {
                              messagesData.add({
                                "message": query,
                                "type": "user",
                              });
                              messagesData.add({
                                "message": response,
                                "type": "assistant",
                              });
                              scrollController.jumpTo(scrollController.position.maxScrollExtent + 200);
                            });
                          },
                          onError: (err) {
                            print(err);
                          },
                        );
                  },

                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
