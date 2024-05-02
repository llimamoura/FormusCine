import 'package:flutter/material.dart';

class CastWidget extends StatelessWidget {
  final List<Map<String, dynamic>> cast;

  const CastWidget({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Elenco:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.7),
          itemCount: cast.length,
          itemBuilder: (context, index) {
            final actor = cast[index];
            return Text(
              actor['name'],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            );
          },
        )
      ],
    );
  }
}
