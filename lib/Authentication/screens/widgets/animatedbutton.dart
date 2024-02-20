import 'package:flutter/material.dart';

class SplitButtonAnimation extends StatefulWidget {
  @override
  _SplitButtonAnimationState createState() => _SplitButtonAnimationState();
}

class _SplitButtonAnimationState extends State<SplitButtonAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isSplit = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSplit() {
    setState(() {
      _isSplit = !_isSplit;
      if (_isSplit) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Split Button Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: _toggleSplit,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      _isSplit ? 'Cancel' : 'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: _animation.value * screenWidth * 0.4,
                  child: _buildButton('Donor', Colors.red),
                ),
                Positioned(
                  right: _animation.value * screenWidth * 0.4,
                  child: _buildButton('School', Colors.green),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigate to another screen or perform action based on the selected option
          print('Selected: $text');
        },
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
