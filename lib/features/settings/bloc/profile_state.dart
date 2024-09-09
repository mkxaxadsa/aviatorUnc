part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final int imageID;
  final String name;
  final String email;
  ProfileLoadedState({
    required this.imageID,
    required this.name,
    required this.email,
  });
}
