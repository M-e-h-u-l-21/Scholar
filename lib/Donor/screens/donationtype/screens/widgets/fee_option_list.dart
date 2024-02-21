import "package:flutter/material.dart";
import 'package:gscapp/Donor/models/feeOption.dart';
import 'package:gscapp/Donor/screens/donationtype/screens/widgets/fee_option_card.dart';

class FeeOptionList extends StatefulWidget {
  const FeeOptionList({
    super.key,
  });

  @override
  State<FeeOptionList> createState() => _FeeOptionListState();
}

class _FeeOptionListState extends State<FeeOptionList> {
  int _selectedIndex = -1;

  final List<FeeOption> cards = [
    FeeOption("1", "10", "4000"),
    FeeOption(
      "3",
      "10",
      "4000",
    ),
    FeeOption(
      "6",
      "10",
      "4000",
    ),
    FeeOption(
      "12",
      "10",
      "4000",
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return FeeOptionCard(
          month: cards[index].month,
          percentage: cards[index].percentage,
          amount: cards[index].amount,
          isSelected: _selectedIndex == index,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      },
    ));
  }
}
