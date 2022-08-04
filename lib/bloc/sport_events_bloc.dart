import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sport_events_event.dart';
part 'sport_events_state.dart';

class SportEventsBloc extends Bloc<SportEventsEvent, SportEventsState> {
  SportEventsBloc() : super(SportEventsInitial()) {
    on<SportEventsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
