import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    return TextFormField(
      onTapOutside: (_) => focusNode.unfocus(),
      controller: textController,
      decoration: _getInputDecoration(textController),
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        final textValue = textController.value.text;
        onValue(textValue);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }

  InputDecoration _getInputDecoration(TextEditingController textController) {
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(40),
    );

    return InputDecoration(
      hintText: 'End you message with "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
          icon: const Icon(Icons.send_outlined)),
    );
  }
}
