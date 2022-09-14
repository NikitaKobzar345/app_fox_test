import 'package:app_fox_test/bloc/select_bloc.dart';
import 'package:app_fox_test/bloc/select_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key, this.questionsData}) : super(key: key);

  final questionsData;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late final SelectBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SelectBloc(SelectState(choise: Future.value()));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SelectBloc, SelectState>(
          bloc: bloc,
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.questionsData.toString()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
