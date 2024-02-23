import "package:flutter/material.dart";
import "package:gscapp/utils/constants/objects.dart";
import "package:gscapp/utils/constants/strings.dart";

class UniformDetail extends StatelessWidget {
  const UniformDetail({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Row with requirement fulfilled and amount
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "₹${Uniform.totalUniformBoy.toString()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),

        SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.black,
              thickness: 1.5,
            )),
        //Requirements
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Uniform.shirt_boy,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        myText.Uniform_dealer,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Text(
                    "₹${Uniform.shirt_price}",
                    style: TextStyle(
                        color: Colors.grey[500], fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Uniform.trouser_boy,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        myText.Uniform_dealer,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Text(
                    "₹${Uniform.trouser_price}",
                    style: TextStyle(
                        color: Colors.grey[500], fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Uniform.socks,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        myText.Uniform_dealer,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Text(
                    "₹${Uniform.socks_price}",
                    style: TextStyle(
                        color: Colors.grey[500], fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Uniform.shoes,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        myText.Uniform_dealer,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Text(
                    "₹${Uniform.shoes_price}",
                    style: TextStyle(
                        color: Colors.grey[500], fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Material Cost",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          "₹${Uniform.totalUniformBoy}",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vendor Shipping Charges",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          "FREE",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Project Cost",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          "₹${Uniform.totalUniformBoy}",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ]),
                ),
              )
            ]),
          ),
        )

        // Amount and sum total
      ],
    );
  }
}
