import 'package:app_fox_test/bloc/select_state.dart';
import 'package:app_fox_test/screens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/select_bloc.dart';
import '../bloc/select_event.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  _SelectScreenState() {
    _categoryValue = _categoryValues[0];
    _difficultyValue = _difficultyValues[0];
  }

  String _categoryValue = '';
  String _difficultyValue = '';

  static final List<String> _categoryValues = [
    'linux',
    'bash',
    'docker',
    'sql',
    'cms',
    'code',
    'devops',
  ];

  static final List<String> _difficultyValues = ['Easy', 'Medium', 'Hard'];

  late final SelectBloc selectBloc;

  @override
  void initState() {
    super.initState();
    selectBloc = SelectBloc(SelectState(choise: Future.value()));
  }

  @override
  void dispose() {
    super.dispose();
    selectBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<SelectBloc, SelectState>(
      bloc: selectBloc,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<String>(
                    value: _categoryValue,
                    items: _categoryValues
                        .map(
                          (dropDownItem) => DropdownMenuItem<String>(
                            value: dropDownItem,
                            child: Text(dropDownItem),
                          ),
                        )
                        .toList(),
                    onChanged: (selectedCategory) {
                      setState(
                        () {
                          _categoryValue = selectedCategory as String;
                        },
                      );
                    },
                  ),
                  DropdownButton<String>(
                    value: _difficultyValue,
                    items: _difficultyValues
                        .map(
                          (dropDowmElement) => DropdownMenuItem<String>(
                            value: dropDowmElement,
                            child: Text(dropDowmElement),
                          ),
                        )
                        .toList(),
                    onChanged: (selectedDifficulty) {
                      setState(
                        () {
                          _difficultyValue = selectedDifficulty as String;
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(36)),
            ElevatedButton(
              onPressed: () {
                selectBloc.add(
                  SelectEvent(
                      category: _categoryValue, difficulty: _difficultyValue),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuestionsScreen(
                        questionsData: state.choise,
                      );
                    },
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.purple[900],
                ),
              ),
              child: const Text('Начать'),
            )
          ],
        );
      },
    ));
  }
}
