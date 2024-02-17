import "package:flutter/material.dart";

class FeeOptionCard extends StatelessWidget {
  const FeeOptionCard({
    super.key,
    required this.month,
    required this.percentage,
    required this.amount,
    required this.onTap,
    required this.isSelected,
  });

  final String month;
  final String percentage;
  final String amount;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? Color(0XFF161733) : Color(0XFFE9DAC4),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, top: 10, bottom: 16),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${month}",
                            style: TextStyle(
                                color: isSelected
                                    ? Color(0XFFFFFFFF)
                                    : Colors.black,
                                fontSize: 38,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " month fee",
                            style: TextStyle(
                                color: isSelected
                                    ? Color(0XFFFFFFFF)
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              "Donating ${percentage}% to child's study",
                              style: TextStyle(
                                  color: isSelected
                                      ? Color(0XFFFFFFFF)
                                      : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.05,
                // ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Text(
                          "₹${amount}",
                          style: TextStyle(
                              color:
                                  isSelected ? Color(0XFFFFFFFF) : Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: isSelected
                                  ? Colors.white
                                  : Color(0xFFF7AF84)),
                          child: Text(
                            "Donate Now",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
