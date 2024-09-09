part of 'flight_bloc.dart';

abstract class FlightEvent {}

class GetFlightEvent extends FlightEvent {}

class AddFlightEvent extends FlightEvent {
  final Flight flight;
  AddFlightEvent({required this.flight});
}

class EditFlightEvent extends FlightEvent {
  final Flight flight;
  EditFlightEvent({required this.flight});
}

class DeleteFlightEvent extends FlightEvent {
  final int id;
  DeleteFlightEvent({required this.id});
}
