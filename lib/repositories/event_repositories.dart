import '../model/event_model.dart';

class EventRepositories {
  List<EventModel> eventList = [];

  EventRepositories() {
    eventList.addAll([
      EventModel(
          image: 'assets/images/teste.jpg',
          name: 'Mulheres na T.I',
          descriptions:'O impacto delas na sociedade',
          numberParticipants: 4,
          dataTime: 'Qua, Mar 23 - 12:00'),
          EventModel(
          image: 'assets/images/teste.jpg',
          name: 'O poder interior',
          descriptions: 'O impacto delas na sociedade',
          numberParticipants: 4,
          dataTime: 'Qua, Mar 23 - 12:00'),
          EventModel(
          image: 'assets/images/teste.jpg',
          name: 'Mulheres na T.I',
          descriptions: 'O impacto delas na sociedade',
          numberParticipants: 4,
          dataTime: 'Qua, Mar 23 - 12:00'),
          EventModel(
          image: 'assets/images/teste.jpg',
          name: 'Mulheres na T.I',
          descriptions: 'Irritas quando respiras ',
          numberParticipants: 4,
          dataTime: 'Qua, Mar 23 - 12:00'),
      
    ]);
  }
}
