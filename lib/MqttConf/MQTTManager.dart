import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'MQTTAppState.dart';
import 'package:mobx/mobx.dart';
part 'MQTTManager.g.dart';

class MQTTManager = MQTTManagerBase with _$MQTTManager;

abstract class MQTTManagerBase with Store{
  // Private instance of client
  @observable
  MQTTAppState _currentState = MQTTAppState();
  @observable
  MqttServerClient? _client;
  @observable
  String? _identifier;
  @observable
  String? _host;
  @observable
  String _topic = "";
  @observable
  int? _port;
  @observable
  String textReceived = "";
  
  
  void setHost(String host) => _host = host;

  
  void setIdentifier(String id) => _identifier = id;

  
  void setPort(int port) => _port = port;

  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
  void setAppState(MQTTAppState currentState) => _currentState = currentState;


  void initializeMQTTClient() { 
    _client = MqttServerClient(_host!, _identifier!);
    _client!.port = _port!;
    _client!.keepAlivePeriod = 20;
    _client!.onDisconnected = onDisconnected;
    _client!.secure = false;
    _client!.logging(on: false);

   
    _client!.onConnected = onConnected;
    _client!.onSubscribed = onSubscribed;
    _client!.onUnsubscribed = onUnsubscribed;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(_identifier!)
        .withWillTopic(
            'willtopic')
        .withWillMessage('My Will message')
        .startClean() 
        .withWillQos(MqttQos.atLeastOnce);
    print('Mosquitto client connecting....');
    _client!.connectionMessage = connMess;
  }

  @computed
  String? get host => _host;
  @computed
  MQTTAppState get currentState => _currentState;
  void connect() async {
    assert(_client != null);
    try {
      print('Mosquitto start client connecting....');
      _currentState.setAppConnectionState(MQTTAppConnectionState.connecting);
      await _client!.connect();
       _currentState.setAppConnectionState(MQTTAppConnectionState.connected);
       print("conectado");
    } on Exception catch (e) {
      print('client exception - $e');
      disconnect();
    }
  }

  void disconnect() {
    print('Disconnected');
    _client!.disconnect();
  }

  void publish(String topic, String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client!.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
    _currentState
        .setAppConnectionState(MQTTAppConnectionState.connectedSubscribed);
  }

  void onUnsubscribed(String? topic) {
    print('onUnsubscribed confirmed for topic $topic');
    _currentState.clearText();
    _currentState
        .setAppConnectionState(MQTTAppConnectionState.connectedUnSubscribed);
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('OnDisconnected client callback - Client disconnection');
    if (_client!.connectionStatus!.returnCode ==
        MqttConnectReturnCode.noneSpecified) {
      print('OnDisconnected callback is solicited, this is correct');
    }
    _currentState.clearText();
    _currentState.setAppConnectionState(MQTTAppConnectionState.disconnected);
  }

  /// The successful connect callback
  void onConnected() {
    _currentState.setAppConnectionState(MQTTAppConnectionState.connected);
    print('Mosquitto client connected....');

  }

  void subScribeTo(String topic) {
    // Save topic for future use
    _topic = topic;
    _client!.subscribe(topic, MqttQos.atLeastOnce);
    receiveMessage();
  }

  /// Unsubscribe from a topic
  void unSubscribe(String topic) {
    _client!.unsubscribe(topic);
  }

  /// Unsubscribe from a topic
  void unSubscribeFromCurrentTopic() {
    _client!.unsubscribe(_topic);
  }
 
  
    void receiveMessage(){
      _client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      textReceived =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      _currentState.setUpdateTopic(c[0].topic);
      _currentState.setReceivedText(textReceived);
      print(
          'topic is <${c[0].topic}>, payload is: $textReceived ');
    });
  }

  

}
