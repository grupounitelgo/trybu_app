import 'package:mobx/mobx.dart';

part 'plan_types_store.g.dart';
class PlanTypesStore = _PlanTypesStore with _$PlanTypesStore;

abstract class _PlanTypesStore with Store{


@observable 
bool plan1Selected = true;
@observable
bool plan2Selected = false;


@action 
void tooglePlan1()=> plan1Selected = false;
@action 
void tooglePlan2()=> plan2Selected= !plan2Selected;

}