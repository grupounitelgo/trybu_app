// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_types_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlanTypesStore on _PlanTypesStore, Store {
  late final _$plan1SelectedAtom =
      Atom(name: '_PlanTypesStore.plan1Selected', context: context);

  @override
  bool get plan1Selected {
    _$plan1SelectedAtom.reportRead();
    return super.plan1Selected;
  }

  @override
  set plan1Selected(bool value) {
    _$plan1SelectedAtom.reportWrite(value, super.plan1Selected, () {
      super.plan1Selected = value;
    });
  }

  late final _$plan2SelectedAtom =
      Atom(name: '_PlanTypesStore.plan2Selected', context: context);

  @override
  bool get plan2Selected {
    _$plan2SelectedAtom.reportRead();
    return super.plan2Selected;
  }

  @override
  set plan2Selected(bool value) {
    _$plan2SelectedAtom.reportWrite(value, super.plan2Selected, () {
      super.plan2Selected = value;
    });
  }

  late final _$_PlanTypesStoreActionController =
      ActionController(name: '_PlanTypesStore', context: context);

  @override
  void tooglePlan1() {
    final _$actionInfo = _$_PlanTypesStoreActionController.startAction(
        name: '_PlanTypesStore.tooglePlan1');
    try {
      return super.tooglePlan1();
    } finally {
      _$_PlanTypesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tooglePlan2() {
    final _$actionInfo = _$_PlanTypesStoreActionController.startAction(
        name: '_PlanTypesStore.tooglePlan2');
    try {
      return super.tooglePlan2();
    } finally {
      _$_PlanTypesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
plan1Selected: ${plan1Selected},
plan2Selected: ${plan2Selected}
    ''';
  }
}
