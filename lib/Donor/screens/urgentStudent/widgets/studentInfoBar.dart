import "package:flutter/material.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/utils/constants/device_utility.dart";

class studentInfoTopBar extends StatelessWidget {
  const studentInfoTopBar({
    super.key,
    required this.stuname,
  });

  final String stuname;

  @override
  Widget build(BuildContext context) {
    final double height = TDeviceUtils.getScreenHeight(context);
    final double width = TDeviceUtils.getScreenWidth(context);
    return Container(
      height: height * 0.22,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(48), bottomRight: Radius.circular(48)),
        color: ThemeColors.deepblue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Back button , image , info
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: width * 0.22,
                ),
                Image(
                  image: AssetImage(
                    'assets/images/man.png',
                  ),
                  height: 128,
                  width: 128,
                ),
                SizedBox(
                  width: width * 0.21,
                ),
                IconButton(
                  icon: Icon(
                    Icons.info_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            //Name of the kid
            Text(
              stuname,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
