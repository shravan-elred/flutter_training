import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'restorable_next_screen.dart';

class StateRestorationExample extends StatefulWidget {
  const StateRestorationExample({super.key});

  @override
  State<StateRestorationExample> createState() =>
      _StateRestorationExampleState();
}

class _StateRestorationExampleState extends State<StateRestorationExample>
    with RestorationMixin {
  @override
  String? get restorationId => 'scroll_view';

  @override
  void restoreState(
    RestorationBucket? oldBucket,
    bool initialRestore,
  ) {
    registerForRestoration(scrollIndex, 'scroll_index');
    registerForRestoration(textController, 'text_controller');
  }

  final _faker = Faker();

  RestorableInt scrollIndex = RestorableInt(0);
  RestorableTextEditingController textController =
      RestorableTextEditingController();

  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();

  final dishes = List.generate(
    100,
    (index) => Faker().food.dish(),
  );

  @override
  void initState() {
    _scrollToIndex();
    super.initState();
  }

  void _scrollToIndex() async {
    await Future.delayed(const Duration(milliseconds: 500));
    itemScrollController.scrollTo(
      index: scrollIndex.value,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    itemPositionsListener.itemPositions.addListener(() {
      scrollIndex.value = itemPositionsListener.itemPositions.value.first.index;
    });
  }

  static Route<void> _myRouteBuilder(BuildContext context, Object? arguments) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => const RestorableNextScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('State restoration example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.restorablePush(context, _myRouteBuilder);
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: textController.value,
              decoration: const InputDecoration(
                hintText: 'Type here...',
              ),
            ),
          ),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemCount: dishes.length,
              itemScrollController: itemScrollController,
              itemPositionsListener: itemPositionsListener,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dishes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
