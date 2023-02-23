import 'package:flutter/material.dart';

class MultiOptionSelectButton extends StatelessWidget{
  const MultiOptionSelectButton({
    required this.selectedItems,
    required this.label,
    this.onTap,
    super.key,
  });

  final String label;
  final void Function()? onTap;
  final List<Widget> selectedItems;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]
        ),

        IntrinsicHeight(
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          runSpacing: 4.0,
                          spacing: 4.0,
                          children: selectedItems,
                        ),
                      ),
                    )
                  ],
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

