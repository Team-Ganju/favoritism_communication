import 'package:flutter/material.dart';

class MultiOptionSelectButton extends StatelessWidget {
  const MultiOptionSelectButton({
    required this.selectedItems,
    required this.label,
    this.onTap,
    this.emptyChild,
    super.key,
  });

  final String label;
  final void Function()? onTap;
  final List<Widget> selectedItems;
  final Widget? emptyChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: _buildItems(selectedItems, emptyChild),
                      ),
                    )
                  ],
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItems(List<Widget> items, Widget? emptyChild) {
    if (items.isNotEmpty) {
      return Wrap(
        runSpacing: 4.0,
        spacing: 4.0,
        children: items,
      );
    }
    if (emptyChild != null) {
      return emptyChild;
    }

    return Wrap(
      runSpacing: 4.0,
      spacing: 4.0,
      children: const <Widget>[],
    );
  }
}
