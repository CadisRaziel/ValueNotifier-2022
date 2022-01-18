import 'package:flutter/material.dart';
import 'package:notifier/src/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //!Implementando a regra de negocio separada no controller
  final controller = HomeController();

  int get _counter => controller.counter;

  //como colocamos o ChangeNotifier não precisamos dessa função
  // void _incrementCounter() {
  //   setState(() {
  //     controller.increment();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //registrando uma função para ser chamada toda vez que o homeController quiser
    //Repare que nao colocamos o setState la no homeController porque la não tem como
    //Então assinamos ele aqui no initState para ficar async e ter um setState do homeController
    //Podemos ter mais de 1 assinatura (2 - 3 - 4 -5 setState), com isso podemos controlar mais de 1 widget para alterar estado
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Aperte o botão pra aumentar o contador'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/**
 * Anotaçoes:
 * Listenable -> Passar uma função como parametro pra uma variavel (exemplo a funcao _incrementCounter para o onPressed)
 * ValueNotifier -> separar a função(regra de negocio) da parte visual (REATIVIDADE)
 */