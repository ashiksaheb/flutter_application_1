import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Android App',
      initialRoute: '/',
      routes: {
        '/AspectRatioWidget': (context) => const AspectRatioWidget(),
        '/FractionallySizedBoxWidget': (context) =>
            const FractionallySizedBoxWidget(),
        '/LayoutBuilderWidget': (context) => const LayoutBuilderWidget(),
        '/SingleChildScrollViewWidget': (context) =>
            const SingleChildScrollViewWidget(),
        '/MyLayoutBuilder': (context) => const MyLayoutBuilder(),
        '/': (context) => const MyDatePicker(),
      },
    );
  }
}

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({super.key});
  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1901),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Time'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //"Selected Date : ${DateFormat('yyyy-MM-dd').format(selectedDate)}",
              // "Selected Date : ${selectedDate.toString().split(' ')[0]}", // both format same work,
              "Selected Date : ${DateFormat('EEEE, MMM d, y').format(selectedDate)}",
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Pick a Date')),
          ],
        ),
      ),
    );
  }
}

class MyLayoutBuilder extends StatelessWidget {
  const MyLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> myList = List.generate(100, (index) => index + 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Builder'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return index % 2 == 0
                ? ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.green,
                      child: Text('$index'),
                    ),
                  )
                : ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text('$index'),
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class SingleChildScrollViewWidget extends StatelessWidget {
  const SingleChildScrollViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView Widget'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                height: 200,
                color: Colors.black,
              ),
            ),
            Flexible(
              child: Container(
                height: 200,
                color: Colors.yellow,
              ),
            ),
            Flexible(
              child: Container(
                height: 200,
                color: Colors.green,
              ),
            ),
            Flexible(
              child: Container(
                height: 200,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Builder Widget'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: LayoutBuilder(builder: (
          context,
          constraints,
        ) {
          if (constraints.maxWidth > 600) {
            return Container(
              width: 400,
              height: 400,
              color: Colors.red,
            );
          } else {
            return Container(
              width: 200,
              height: 200,
              color: Colors.amber,
            );
          }
        }),
      ),
    );
  }
}

class FractionallySizedBoxWidget extends StatelessWidget {
  const FractionallySizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FractionallySizedBox'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.3,
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aspect Ratio'),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
