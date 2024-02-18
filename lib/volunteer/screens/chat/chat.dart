import "package:flutter/material.dart";
import "package:gscapp/utils/constants/colors.dart";
import "package:gscapp/volunteer/screens/chat/widgets/chatitem.dart";

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      body: Column(
        children: [ChatItem(), ChatItem(), ChatItem()],
      ),
    );
  }
}
