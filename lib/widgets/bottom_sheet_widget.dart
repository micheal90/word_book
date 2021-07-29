import 'package:flutter/material.dart';
import 'package:word_book/model/word_model.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({
    Key? key,
    required this.addWord,
  }) : super(key: key);
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final Function addWord;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _wordController,
                  decoration: InputDecoration(
                    labelText: 'Word',
                    hintText: 'Enter the new word',
                  ),
                ),
                TextFormField(
                  controller: _descController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter the word description',
                  ),
                  maxLines: 3,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_wordController.text.isEmpty ||
                        _descController.text.isEmpty) return;
                    return addWord(WordModel(
                      id: DateTime.now().toString(),
                      word: _wordController.text.trim(),
                      description: _descController.text.trim(),
                    ));
                  },
                  child: Text('Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
