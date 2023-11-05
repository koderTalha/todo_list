import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final String title;
  final String subtitle;
  final DateTime datetime;
  void Function(BuildContext)? deletetodo;

  Todotile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.datetime,
    required this.deletetodo,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deletetodo,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ],
      ),
      child: ListTile(
        // style: ,
        title: RichText(
          text: TextSpan(
              text: title,
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle, style: const TextStyle()),
          ],
        ),
        trailing:
            Text("${datetime.month}/${datetime.day}"),
      ),
    );
  }
}
