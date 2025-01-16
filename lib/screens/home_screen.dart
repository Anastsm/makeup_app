import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:makeup_app/router/router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Makeup App'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Image.asset('assets/png/eyeshadow.png'),

          TextButton(
            onPressed: () async {
              AutoRouter.of(context).push(ProductSearchRoute());
            },
            child: const Text('- Find products', style: TextStyle(fontSize: 24)),
          ),

          TextButton(
            onPressed: () {},            
            child: const Text('- Find ingredient', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ), 
    );
  }
}