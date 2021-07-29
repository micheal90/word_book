import 'package:flutter/material.dart';
import 'package:word_book/model/word_model.dart';
import 'package:word_book/widgets/bottom_sheet_widget.dart';
import 'package:word_book/widgets/word_widget.dart';

class WordsScreen extends StatefulWidget {
  WordsScreen({Key? key}) : super(key: key);

  @override
  _WordsScreenState createState() => _WordsScreenState();
}

class _WordsScreenState extends State<WordsScreen> {
  final List<WordModel> words = [];

  bool isDelete = false;

  void deleteWord(String id) {
    setState(() {
      words.removeWhere((word) => word.id == id);
    });
  }

  void addWord(WordModel wordModel) {
    setState(() {
      words.add(wordModel);
    });
    Navigator.of(context).pop();
  }

  showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetWidget(addWord: addWord),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Word Book',
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDelete = !isDelete;
              });
            },
            icon:isDelete?Icon(Icons.done):Icon(Icons.edit),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemBuilder: (context, index) => WordWidget(
                title: words[index].word,
                description: words[index].description,
                trailing: isDelete
                    ? IconButton(
                        onPressed: () => deleteWord(words[index].id),
                        icon: Icon(Icons.remove,color: Colors.red,))
                    : null),
            
            itemCount: words.length),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showBottomSheet,
        child: Icon(Icons.add),
      ),
    );
  }
}
