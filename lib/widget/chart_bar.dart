import 'package:flutter/material.dart';
class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPicOfTotal;
   ChartBar(this.label, this.spendingAmount, this.spendingPicOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Text(spendingAmount.toStringAsFixed(0)),
        const SizedBox(height: 4,
        ),
        SizedBox(height: 60,
        width: 10,
          child: Stack(
            children:<Widget> [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1.0),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPicOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),

      ],
    );
  }
}
