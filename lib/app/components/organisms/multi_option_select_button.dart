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


    return Container(
      child: IntrinsicHeight(
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          label,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      runSpacing: 4.0,
                      spacing: 4.0,
                      children: selectedItems,
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
    );
  }

}

