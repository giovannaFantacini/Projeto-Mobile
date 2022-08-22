import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_mobile/widgets/MenuComponentes.dart';
import 'package:projeto_mobile/MqttConf/MQTTAppState.dart';
import 'package:projeto_mobile/MqttConf/MQTTManager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../Objetos/ListButtonController.dart';
import '../Objetos/ListMessageController.dart';
import '../Objetos/ListMessageReceivedController.dart';

// ignore: must_be_immutable
class TelaComandos extends StatefulWidget {
  _TelaComandosState createState() => _TelaComandosState();
}

class _TelaComandosState extends State<TelaComandos> {
  TextEditingController _controllerMessage = TextEditingController();
  late ReactionDisposer reactionDisposer;
  late MQTTAppState appState;
  late ListMessageReceivedController listMessageReceivedController;
  late MQTTManager manager;

  void didChangeDependencies() {
      super.didChangeDependencies();

      appState = Provider.of<MQTTAppState>(context);

      reactionDisposer =
          reaction((_) => appState.getReceivedText, (getReceivedText) {
          for (int i = 0; i <= listMessageReceivedController.listaItens.length;i++) {
            if (appState.getUpdateTopic == listMessageReceivedController.listaItens[i].topic) {
              listMessageReceivedController.listaItens[i].message =
                  appState.getReceivedText;
            }
        }
      });
    }

    void dispose() {
      reactionDisposer();
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
  manager = Provider.of<MQTTManager>(context);
  ListButtonController listButtonController = Provider.of<ListButtonController>(context);
  ListMessageController listMessageController = Provider.of<ListMessageController>(context);
  listMessageReceivedController = Provider.of<ListMessageReceivedController>(context);
 
    
    _dialog(String topic) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text("Envio de Mensagem"),
              content: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Insira o texto para publicação..."),
                controller: _controllerMessage,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _controllerMessage.clear();
                    },
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      manager.publish(topic, _controllerMessage.text);
                      _controllerMessage.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Enviar"))
              ],
            );
          });
    }
    return Scaffold(
        drawer: MenuComponentes(),
        appBar: AppBar(
          title: Text("Projeto_mobile"),
          backgroundColor: Color(0xFF090C1A),
        ),
        body: LayoutBuilder(builder: (context, constrains) {
          return Container(
              height: constrains.maxHeight,
              width: constrains.maxWidth,
              color: Color(0xFF0F142C),
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                children: [
                  Container(
                    child: Observer(builder: (_) {
                      return GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20
                                  ),
                          itemCount: listButtonController.listaItens.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                                margin: EdgeInsets.only(top: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFfceff9),),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 0, top: 5),
                                      child: Text(
                                        listButtonController
                                            .listaItens[index].title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF454851), 
                                            fontSize: 20, 
                                            fontWeight: FontWeight.w400
                                          ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Transform.scale(
                                        scale: 1.30,
                                        child: Switch(
                                          value: listButtonController
                                              .listaItens[index].state,
                                          onChanged: (value) {
                                            setState(() {
                                              listButtonController
                                                  .listaItens[index].state = value;
                                            });
                                            if (listButtonController
                                                    .listaItens[index].state ==
                                                true) {
                                              manager.publish(
                                                  listButtonController
                                                      .listaItens[index].topic,
                                                  listButtonController
                                                      .listaItens[index].on);
                                            } else {
                                              manager.publish(
                                                  listButtonController
                                                      .listaItens[index].topic,
                                                  listButtonController
                                                      .listaItens[index].off);
                                            }
                                          },
                                          activeColor: Color(0xFF610328a),
                                          activeTrackColor: Colors.grey,
                                          inactiveThumbColor: Colors.blueGrey,
                                          inactiveTrackColor: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ));
                          });
                    }),
                  ),
                  Container(
                    child: Observer(builder: (_) {
                      return GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20
                                  ),
                          itemCount: listMessageController.listaItens.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                                margin: EdgeInsets.only(top: 15),
                               // alignment: AlignmentDirectional.topStart,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFfceff9),),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 0, top: 5),
                                      child: Text(
                                        listMessageController
                                            .listaItens[index].title,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Color(0xFF454851), 
                                            fontSize: 20, 
                                            fontWeight: FontWeight.w400
                                          ),
                                      ),
                                    ),
                                   Padding(
                                        padding: EdgeInsets.only(top: 13),
                                        child: InkWell(
                                            child: Text(
                                              "Clique para inserir a mensagem",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Color(0xFF454851),
                                                  fontSize: 20),
                                            ),
                                            onTap: () {
                                              _dialog(listMessageController
                                                  .listaItens[index].topic);
                                            }))
                                  ],
                                ));
                          });
                    }),
                  ),
                  Container(
                    child: Observer(builder: (_) {
                      return GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount:
                              listMessageReceivedController.listaItens.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                                margin: EdgeInsets.only(top: 15),
                                //alignment: AlignmentDirectional.topStart,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFfceff9)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        listMessageReceivedController
                                            .listaItens[index].title,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color(0xFF454851), fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 15),
                                        child: Observer(builder: (_) {
                                          return Container(
                                            width: 400,
                                            child: Text(
                                              listMessageReceivedController
                                                  .listaItens[index].message,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xFF454851),
                                                  fontSize: 20),
                                            ),
                                          );
                                        }))
                                  ],
                                ));
                          });
                    }),
                  )
                ],
              ));
        }));
  }
}
