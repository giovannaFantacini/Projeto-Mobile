
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Objetos/ListButtonController.dart';

// ignore: must_be_immutable
class BotaoOnOff extends StatefulWidget {
  _BotaoOnOffState createState() => _BotaoOnOffState();
  
}

class _BotaoOnOffState extends State<BotaoOnOff> {
  TextEditingController _controllertopic = TextEditingController();
  TextEditingController _controllertitle = TextEditingController();
  TextEditingController _controllerOn = TextEditingController();
  TextEditingController _controllerOff = TextEditingController();


  @override
  Widget build(BuildContext context) {
     ListButtonController controllerlist = Provider.of<ListButtonController>(context);

    void createButton(String title, String topic, String on, String off){
      controllerlist.setTitle(title);
      controllerlist.setTopic(topic);
      controllerlist.setOn(on);
      controllerlist.setOff(off);
      controllerlist.adicionarItem();
      Navigator.pop(context);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Projeto_mobile"),
        backgroundColor: Color(0xFF090C1A),
      ),
      body: Container(
        height: double.infinity,
        color: Color(0xFFA2A1A9),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                Padding(
                      padding: EdgeInsets.only(bottom: 55),
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
                      padding: EdgeInsets.only(bottom: 55),
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
                    padding: EdgeInsets.only(bottom: 55),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            Expanded(
                              flex: 1,
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
                                    labelText: "Valor para ON:",
                                    labelStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                style: TextStyle(fontSize: 22, color: Colors.white),
                                controller:  _controllerOn
                              ),
                            ),
                          SizedBox(width: 10.0),
                          Expanded(
                              flex: 1,
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
                                    labelText: "Valor para OFF:",
                                    labelStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                style: TextStyle(fontSize: 22, color: Colors.white),
                                controller:  _controllerOff
                              ),
                            )
                        ],
                      ),
                  ),
                     ElevatedButton(
                        onPressed: () => createButton(_controllertitle.text, _controllertopic.text,_controllerOn.text,_controllerOff.text),
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
              ],
            ),
       ),
      )
 
    );
  }
 


}

