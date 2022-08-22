import 'package:flutter/material.dart';
import 'package:projeto_mobile/MqttConf/MQTTManager.dart';
import 'package:provider/provider.dart';

import '../Objetos/ListMessageReceivedController.dart';

class RecebimentoDeMensagem extends StatefulWidget {
  RecebimentoDeMensagem({Key? key}) : super(key: key);

  @override
  State<RecebimentoDeMensagem> createState() => _RecebimentoDeMensagemState();
}

class _RecebimentoDeMensagemState extends State<RecebimentoDeMensagem> {
  TextEditingController _controllertopic = TextEditingController();
  TextEditingController _controllertitle = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    ListMessageReceivedController controllerlist = Provider.of<ListMessageReceivedController>(context);
    MQTTManager manager = Provider.of<MQTTManager>(context);

    void createMessageReceived(String title, String topic){
      controllerlist.setTitle(title);
      controllerlist.setTopic(topic);
      controllerlist.adicionarItem();
      manager.subScribeTo(topic);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Projeto_mobile"),
        backgroundColor: Color(0xFF090C1A),
      ),
      body: Container(
        color: Color(0xFFA2A1A9),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 4),
                  child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          labelText: "Titulo:",
                          labelStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      controller: _controllertitle
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 4),
                  child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          labelText: "Tópico:",
                          labelStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      style: TextStyle(fontSize: 22, color: Colors.white),
                      controller: _controllertopic
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 0 ),
                  child: ElevatedButton(
                    onPressed: () => createMessageReceived(_controllertitle.text, _controllertopic.text),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF0F142C)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.all(15.0)),
                    ),
                    child: Text(
                      "Conectar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
          ],
        ),
      )
      
    );
  }
}