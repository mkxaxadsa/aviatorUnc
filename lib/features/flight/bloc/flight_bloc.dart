import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/flight.dart';

part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  FlightBloc() : super(FlightInitial()) {
    on<GetFlightEvent>((event, emit) async {
      if (flightsList.isEmpty) {
        await getFlights();

        emit(FlightLoadedState(flights: flightsList));
      } else {
        emit(FlightLoadedState(flights: flightsList));
      }
    });

    on<AddFlightEvent>((event, emit) async {
      flightsList.insert(0, event.flight);
      await updateFlights();

      emit(FlightLoadedState(flights: flightsList));
    });

    on<EditFlightEvent>((event, emit) async {
      for (Flight flight in flightsList) {
        if (flight.id == event.flight.id) {
          flight.from = event.flight.from;
          flight.to = event.flight.to;
          flight.date = event.flight.date;
          flight.time = event.flight.time;
          flight.miles = event.flight.miles;
        }
      }
      await updateFlights();

      emit(FlightLoadedState(flights: flightsList));
    });

    on<DeleteFlightEvent>((event, emit) async {
      flightsList.removeWhere((element) => element.id == event.id);
      await updateFlights();

      emit(FlightLoadedState(flights: flightsList));
    });
  }
}
