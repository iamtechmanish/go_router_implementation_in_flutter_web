import 'package:flutter/cupertino.dart';

class Public extends StatefulWidget {
  const Public({Key? key}) : super(key: key);

  @override
  State<Public> createState() => _PublicState();
}

class _PublicState extends State<Public> {


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {

    });
  }
}
