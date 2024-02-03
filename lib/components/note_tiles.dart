import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:simple_notes_app/components/note_settings.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const NoteTile({
    Key? key,
    required this.text,
    this.onEditPressed,
    this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: ListTile(
        title: Text(text),
        trailing: Builder(builder: (context) {
          return IconButton(
            onPressed: () => showPopover(
              height: 100,
              width: 100,
              backgroundColor: Theme.of(context).colorScheme.background,
              context: context,
              bodyBuilder: (context) => NoteSettings(
                onEditTap: onEditPressed,
                onDeleteTap: onDeletePressed,
              ),
            ),
            icon: const Icon(Icons.more_vert),
          );
        }),
      ),
    );
  }
}
