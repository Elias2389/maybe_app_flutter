import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String message;
  final String? imageUrl;

  const HerMessageBubble({super.key, required this.message, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(imageUrl: imageUrl,),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String? imageUrl;

  const _ImageBubble({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          (imageUrl == null) ? 'https://yesno.wtf/assets/yes/3-422e51268d64d78241720a7de52fe121.gif' : imageUrl!,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Center(child: Text('Getting Image...')),
            );
          }
        ));
  }
}
