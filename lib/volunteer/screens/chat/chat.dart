import "package:flutter/material.dart";
import "package:gscapp/volunteer/screens/chat/widgets/chatitem.dart";

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ChatItem(), ChatItem(), ChatItem()],
      ),
    );
  }
}
