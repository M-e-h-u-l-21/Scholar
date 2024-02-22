import "package:flutter/material.dart";

class TeacherRemark extends StatelessWidget {
  const TeacherRemark({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0XFFFFECD0),
                borderRadius: BorderRadius.circular(8)),
            height: height * 0.15,
            width: width * 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "`One of his own kind`",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: height * 0.008,
                            ),
                            SizedBox(
                              width: width * 0.8,
                              child: Expanded(
                                child: Text(
                                  "The diligent nature of Rahul is his biggest strength and his attitude towards learning is what makes him really unique..",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "- Nihal Parera ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "(Class Teacher)",
                          style:
                              TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0XFFFFECD0),
                borderRadius: BorderRadius.circular(8)),
            height: height * 0.15,
            width: width * 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "`One of his own kind`",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: height * 0.008,
                            ),
                            SizedBox(
                              width: width * 0.8,
                              child: Expanded(
                                child: Text(
                                  "The diligent nature of Rahul is his biggest strength and his attitude towards learning is what makes him really unique..",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "- Nihal Parera ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "(Class Teacher)",
                          style:
                              TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
