import 'package:flutter/material.dart';
import 'package:flutter_study/pages/poke_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: const Text('Header')),
            ListTile(
              leading: Image.asset('assets/images/pokeball_32px.png'),
              title: const Text('Consumo de API (Poke API)'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PokeListPage()));
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Página Inicial'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
