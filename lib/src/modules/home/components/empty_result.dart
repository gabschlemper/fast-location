import 'package:flutter/material.dart';

class EmptyResult extends StatelessWidget {
  final String message;
  const EmptyResult({Key? key, this.message = 'Nenhum resultado encontrado.'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}