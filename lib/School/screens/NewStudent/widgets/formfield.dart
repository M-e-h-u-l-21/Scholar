import "package:flutter/material.dart";

class FormItem extends StatefulWidget {
  const FormItem({
    super.key,
    required this.width,
    required this.fieldname,
    required this.onChanged,
  });

  final double width;
  final String fieldname;
  final ValueChanged<String> onChanged;
  @override
  State<FormItem> createState() => _FormItemState();
}

class _FormItemState extends State<FormItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.fieldname),
              TextField(
                controller: _controller,
                onChanged: widget.onChanged,
              )
            ],
          )),
    );
  }
}
