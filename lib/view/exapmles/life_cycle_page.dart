import 'package:flutter/material.dart';

class LifeCycle extends StatefulWidget {
  const LifeCycle({Key? key, this.initialValue = 0}) : super(key: key);

  final int initialValue;
  @override
  State<LifeCycle> createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> {
  /// properties
  late int count;

  @override
  void initState() {
    // 初始化，类似于iOS中的viewDidLoad
    super.initState();
    count = widget.initialValue;
    print("__initState__");
  }

  @override
  void didUpdateWidget(LifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("__didUpdateWidget__");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("__didChangeDependencies__");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("__reassemble__");
  }

  @override
  void dispose() {
    // 释放资源/移除监听
    super.dispose();
    print("__dispose__");
  }

  @override
  Widget build(BuildContext context) {
    print("__build__");
    return Scaffold(
      appBar: AppBar(
        title: const Text("生命周期"),
      ),
      body: Center(
        child: Text(
          "$count",
          style: const TextStyle(
            fontSize: 32,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => ++count),
        child: const Icon(Icons.add),
      ),
    );
  }
}
