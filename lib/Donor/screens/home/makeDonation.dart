import "package:currency_textfield/currency_textfield.dart";
import "package:dotted_line/dotted_line.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:gscapp/utils/constants/colors.dart";

class MakeDonation extends StatelessWidget {
  const MakeDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = CurrencyTextFieldController(
        currencyOnLeft: true,
        currencySymbol: "₹",
        decimalSymbol: ".",
        thousandSymbol: ",");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Make Donation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeColors.deepblue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Donation Goal",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Semester Fee",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Deadline - 23/02/24",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.75,
                        minHeight: 6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "4 days left",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Target : ₹12000",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text("Raised : ₹8000",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DottedLine(),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "Enter your amount of donation ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Container(
                  width: double.infinity,
                  child: TextField(
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    controller: _controller,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20), hintText: "₹0000"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                _controller.text != ""
                    ? Text(
                        "You're helping us meet 10% of the requirement, Thank You :)",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Donate"),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
