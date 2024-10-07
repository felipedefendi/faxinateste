import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/globals/elevatedButton_components.dart';

class FirstTimePage extends StatefulWidget {
  const FirstTimePage({super.key});

  @override
  State<FirstTimePage> createState() => _FirstTimePageState();
}

class _FirstTimePageState extends State<FirstTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Image.asset('images/logo-escrita.png'),
              ),
              Column(
                children: [
                  Image.asset('images/vassoura.png'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Center(
                      child: Text('Já sou um usuário'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: MyElevatedButton(
                      backgroundColor: const Color(0xFF912DB5),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: const Center(
                        child: Text('Sou novo no Faxina!'),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
