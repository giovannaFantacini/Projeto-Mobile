// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListButtonController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListButtonController on ListButtonControllerBase, Store {
  late final _$_titleAtom =
      Atom(name: 'ListButtonControllerBase._title', context: context);

  @override
  String get _title {
    _$_titleAtom.reportRead();
    return super._title;
  }

  @override
  set _title(String value) {
    _$_titleAtom.reportWrite(value, super._title, () {
      super._title = value;
    });
  }

  late final _$_topicAtom =
      Atom(name: 'ListButtonControllerBase._topic', context: context);

  @override
  String get _topic {
    _$_topicAtom.reportRead();
    return super._topic;
  }

  @override
  set _topic(String value) {
    _$_topicAtom.reportWrite(value, super._topic, () {
      super._topic = value;
    });
  }

  late final _$_onAtom =
      Atom(name: 'ListButtonControllerBase._on', context: context);

  @override
  String get _on {
    _$_onAtom.reportRead();
    return super._on;
  }

  @override
  set _on(String value) {
    _$_onAtom.reportWrite(value, super._on, () {
      super._on = value;
    });
  }

  late final _$_offAtom =
      Atom(name: 'ListButtonControllerBase._off', context: context);

  @override
  String get _off {
    _$_offAtom.reportRead();
    return super._off;
  }

  @override
  set _off(String value) {
    _$_offAtom.reportWrite(value, super._off, () {
      super._off = value;
    });
  }

  late final _$listaItensAtom =
      Atom(name: 'ListButtonControllerBase.listaItens', context: context);

  @override
  ObservableList<Botao> get listaItens {
    _$listaItensAtom.reportRead();
    return super.listaItens;
  }

  @override
  set listaItens(ObservableList<Botao> value) {
    _$listaItensAtom.reportWrite(value, super.listaItens, () {
      super.listaItens = value;
    });
  }

  late final _$ListButtonControllerBaseActionController =
      ActionController(name: 'ListButtonControllerBase', context: context);

  @override
  void adicionarItem() {
    final _$actionInfo = _$ListButtonControllerBaseActionController.startAction(
        name: 'ListButtonControllerBase.adicionarItem');
    try {
      return super.adicionarItem();
    } finally {
      _$ListButtonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaItens: ${listaItens}
    ''';
  }
}
