import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class CardSwipeExample extends StatefulWidget {
  const CardSwipeExample({super.key});

  @override
  State<CardSwipeExample> createState() => _CardSwipeExampleState();
}

class _CardSwipeExampleState extends State<CardSwipeExample> {
  late List<String> fileNames;

  @override
  void initState() {
    super.initState();
    _resetCards();
  }

  void _resetCards() {
    fileNames = [
      'assets/eat_cape_town_sm.jpg',
      'assets/eat_new_orleans_sm.jpg',
      'assets/eat_sydney_sm.jpg',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Swipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ClipRect(
                  child: Stack(
                    children: fileNames.map((fileName) {
                      return SwipeableCard(
                        imageAssetName: fileName,
                        onSwiped: (isSwipedLeft) {
                          setState(() {
                            fileNames.remove(fileName);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Refill'),
                onPressed: () {
                  setState(() {
                    _resetCards();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    required this.imageAssetName,
    super.key,
  });

  final String imageAssetName;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(imageAssetName),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SwipeableCard extends StatefulWidget {
  const SwipeableCard({
    required this.onSwiped,
    required this.imageAssetName,
    super.key,
  });

  final String imageAssetName;
  final void Function(bool? isSwipedLeft) onSwiped;

  @override
  State<SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late double _dragStartX;
  bool _isSwipingLeft = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    _animation = _controller.drive(
      Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(1, 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
        onHorizontalDragStart: _dragStart,
        onHorizontalDragUpdate: _dragUpdate,
        onHorizontalDragEnd: _dragEnd,
        child: Card(imageAssetName: widget.imageAssetName),
      ),
    );
  }

  /// Sets the starting position the user dragged from.
  void _dragStart(DragStartDetails details) {
    _dragStartX = details.localPosition.dx;
  }

  /// Changes the animation to animate to the left or right depending on the
  /// swipe, and sets the AnimationController's value to the swiped amount.
  void _dragUpdate(DragUpdateDetails details) {
    final localPositionX = details.localPosition.dx;
    var isSwipingLeft = (localPositionX - _dragStartX) < 0;
    if (isSwipingLeft != _isSwipingLeft) {
      _isSwipingLeft = isSwipingLeft;
      _updateAnimation(localPositionX);
    }

    setState(() {
      final size = context.size;
      if (size == null) return;
      // Calculate the amount dragged in unit coordinates (between 0 and 1)
      // using this widgets width.
      _controller.value = (localPositionX - _dragStartX).abs() / size.width;
    });
  }

  /// Runs the fling / spring animation using the final velocity of the drag
  /// gesture.
  void _dragEnd(DragEndDetails details) {
    final localVelocityX = details.velocity.pixelsPerSecond.dx;
    final size = context.size;

    if (size == null) return;

    var velocity = (localVelocityX / size.width).abs();
    _animate(velocity: velocity);
  }

  void _updateAnimation(double dragPosition) {
    _animation = _controller.drive(Tween<Offset>(
      begin: Offset.zero,
      end: _isSwipingLeft ? const Offset(-1, 0) : const Offset(1, 0),
    ));
  }

  void _animate({double velocity = 0}) {
    var description = const SpringDescription(
      mass: 50,
      stiffness: 1,
      damping: 1,
    );
    var simulation = SpringSimulation(
      description,
      _controller.value,
      1,
      velocity,
    );
    _controller.animateWith(simulation).whenComplete(() {
      widget.onSwiped(_isSwipingLeft);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
