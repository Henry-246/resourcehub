import 'package:flutter/material.dart';

class SkillsUpPage extends StatefulWidget {
  const SkillsUpPage({super.key});

  @override
  State<SkillsUpPage> createState() => _SkillsUpPageState();
}

class _SkillsUpPageState extends State<SkillsUpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Skills Page'),
        ),
      ),
    );
  }
}
