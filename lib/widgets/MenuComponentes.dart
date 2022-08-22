import 'package:flutter/material.dart';
import 'package:projeto_mobile/widgets/ConexaoPubSub/RecebimentoDeMensagem.dart';
import 'ConexaoPubSub/BotaoOnOff.dart';
import 'ConexaoPubSub/EnvioMensagem.dart';

// ignore: must_be_immutable
class MenuComponentes extends StatefulWidget {
  @override
  _MenuComponentesState createState() => _MenuComponentesState();
}

// ignore: must_be_immutable
class _MenuComponentesState extends State<MenuComponentes> {
 
  final padding = EdgeInsets.fromLTRB(20, 40, 20, 0);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFFA2A1A9),
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 18),
             buildMenuItem(
               text: "Botão ON/OFF",
               onClicked: () => selectedItem(context, 0)
             ),
             const SizedBox(height: 18),
             buildMenuItem(
               text: "Envio de Mensagem",
               onClicked: () => selectedItem(context, 1)
             ),
             const SizedBox(height: 18),
             buildMenuItem(
               text: "Recebimento de Mensagem",
               onClicked: () => selectedItem(context, 2)
             )
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
    required String text,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.white70;

    return ListTile(
      title: Text(text, style: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize:  20 )
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index){

    switch(index){
      case 0: 
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => BotaoOnOff())
        );
        break;
      case 1: 
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnvioMensagem())
        );
        break;
      case 2: 
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => RecebimentoDeMensagem())
        );
        break;

    }
      
}