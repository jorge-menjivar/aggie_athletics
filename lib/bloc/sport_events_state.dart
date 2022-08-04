part of 'sport_events_bloc.dart';

abstract class SportEventsState extends Equatable {
  const SportEventsState();
  
  @override
  List<Object> get props => [];
}

class SportEventsInitial extends SportEventsState {}
