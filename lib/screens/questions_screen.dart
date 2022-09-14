import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key, this.questionsData}) : super(key: key);

  final questionsData;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.questionsData.toString()),
          );
        },
      )),
    );
  }
}
