A very simple way to manage immutable state in flutter without having too much dependencies

## Features

Has the following

* State management: VanillaNotifier
* State listener widgets: VanillaListener, VanillaBuilder
* VanillaNotifier dependency injection widget: InheritedVanilla
* Helper utils for making immutable state management easier and faster: BaseNotifier,
  BaseState (with success, in-loading, out-loading, error and fatal-error states

## Getting started

```yaml
dependencies:
  vanilla_state: ^1.3.0
```

or

```bash
  flutter pub add vanilla_state
```

```dart
import 'package:vanilla_state/vanilla_state.dart';

```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:vanilla_state/vanilla_state.dart';

void main() {
  runApp(const MyApp());
}

class CounterNotifier extends VanillaNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      /// This "Provides" [CounterNotifier] to the widget tree below it
      home: InheritedVanilla<CounterNotifier>(
        createNotifier: () => CounterNotifier(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            VanillaBuilder<CounterNotifier, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// increment here is passed as a tear-off
        onPressed: context.read<CounterNotifier>().increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

```

## Additional information

To create issues, prs or otherwise contribute in anyway check out
the [package repository home](https://github.com/folaoluwafemi/vanilla_state)
