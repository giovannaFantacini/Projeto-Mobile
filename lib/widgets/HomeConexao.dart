import 'package:flutter/material.dart';
import 'package:projeto_mobile/widgets/ListConexao/TelaComandos.dart';
import 'package:provider/provider.dart';
import '../MqttConf/MQTTAppState.dart';
import '../MqttConf/MQTTManager.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeConexao extends StatefulWidget {
  @override
  _HomeConexaoState createState() => _HomeConexaoState();
}

class _HomeConexaoState extends State<HomeConexao> {
  TextEditingController _controllerhost = TextEditingController();
  TextEditingController _controllerport = TextEditingController();

  late MQTTAppState appState;

  late MQTTManager _manager;
  late ReactionDisposer  reactionDisposer;
  
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    appState =  Provider.of<MQTTAppState>(context);

    reactionDisposer = reaction(
      (_) => appState.getAppConnectionState,
      (getAppConnectionState){
        if( getAppConnectionState.toString() == "MQTTAppConnectionState.connected" ){
          
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => TelaComandos() )
          );
        } else{
          print("appState" + appState.getAppConnectionState.toString());
        }
      }
    );

  }

  void dispose() {
      reactionDisposer();
      super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0F142C),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Projeto Mobile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
                        labelText: "Host:",
                        labelStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    style: TextStyle(fontSize: 22, color: Colors.white),
                    controller: _controllerhost),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors.white,
                              width: 2.0,
                              style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      labelText: "Port:",
                      labelStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  style: TextStyle(fontSize: 22, color: Colors.white),
                  keyboardType: TextInputType.number,
                  controller: _controllerport,
                ),
              ),
              Padding(
              padding: const EdgeInsets.all(16),
              child:Observer(builder: (_){
                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 147, 147, 147)),
                  ),
                  child: appState.carregando
                      ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)   
                      :Text(
                            "Conectar",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),
                      ),
                  onPressed: (){_configureAndConnect();}
                );
              })
              )
            ],
          ),
        ));
  }

  
  void _configureAndConnect() {

    _manager = Provider.of<MQTTManager>(context, listen: false);

    String osPrefix = 'Projeto_mobile';
       _manager.setHost(_controllerhost.text); 
       _manager.setIdentifier(osPrefix);
       _manager.setPort(int.parse(_controllerport.text));
       _manager.setAppState(appState) ;
       
    _manager.initializeMQTTClient();
    _manager.connect();
   
    appState.carregar();
  }
   

  }

  


