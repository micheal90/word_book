import 'package:flutter/material.dart';

class WordWidget extends StatelessWidget {
  final String title, description;
  final Widget? trailing;

  WordWidget({
    required this.title,
    required this.description,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
          leading: CircleAvatar(
            child: Text(title.substring(0, 1).toUpperCase()),
          ),
          title: Text(title),
          subtitle: Text(
            description,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
                    isThreeLine: true,
          trailing: trailing),
    );
  }
}
