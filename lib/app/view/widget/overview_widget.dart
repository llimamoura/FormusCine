import 'package:flutter/material.dart';
import 'package:flutter_formuscine/app/controller/colors_controller.dart';

class OverviewWidget extends StatefulWidget {
  final String overview;

  const OverviewWidget({super.key, required this.overview});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.tertiaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview:',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.overview,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              maxLines: _expanded ? null : 10,
              overflow: TextOverflow.ellipsis,
            ),
            if (widget.overview.length > 100)
              InkWell(
                onTap: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                child: Text(
                  _expanded ? 'see more' : 'see less',
                  style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline, fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
