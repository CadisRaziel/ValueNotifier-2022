import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  var counter = 0;

  void increment() {
    counter++;
    //!Como colocamos um initState la na homepage e assinamos com AddListener
    //!Precisamos assinar aqui no controller om notifyListener, pra ele fica monitorando as alteraçoes de estado
    notifyListeners();
  }
}

/**
 * Anotaçoes:
 * Toda lógica fica em um controller
 * ChangeNotifier -> Colocando ele ganhamos 2 possibilidades, 
 * 1º -> outros objetos podem registrar funções nessa classe e no momento que for disparado o evento aqui vai disparar onde ela foi assinada
 * 2º -> notificar quem assinou esse evento
 * addListener -> OUVINTE
 * notifyListeners -> AVISA O OUVINTE PRA EXECUTAR
 */

