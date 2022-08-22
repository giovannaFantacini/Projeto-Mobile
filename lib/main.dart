
import 'package:flutter/material.dart';
import 'package:projeto_mobile/MqttConf/MQTTManager.dart';
import 'package:provider/provider.dart';
import 'widgets/HomeConexao.dart';
import 'MqttConf/MQTTAppState.dart';
import 'widgets/Objetos/ListButtonController.dart';
import 'widgets/Objetos/ListMessageController.dart';
import 'widgets/Objetos/ListMessageReceivedController.dart';


void main() {
  runApp(MultiProvider(
      providers: [
      Provider<MQTTAppState>(
        create: (_) => MQTTAppState(),
      ),
      Provider<MQTTManager>(
        create: (_) => MQTTManager(),
      ),
      Provider<ListButtonController>(
        create: (_) => ListButtonController(),
      ),
       Provider<ListMessageController>(
        create: (_) => ListMessageController(),
      ),
      Provider<ListMessageReceivedController>(
        create: (_) => ListMessageReceivedController(),
      ),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeConexao(),
      ),
    ));
}

