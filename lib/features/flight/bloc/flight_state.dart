part of 'flight_bloc.dart';

abstract class FlightState {}

class FlightInitial extends FlightState {}

class FlightLoadedState extends FlightState {
  final List<Flight> flights;
  FlightLoadedState({required this.flights});
}
