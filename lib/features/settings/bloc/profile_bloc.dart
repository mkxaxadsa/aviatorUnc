import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/prefs.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) {
      emit(ProfileLoadedState(
        imageID: profileImageID,
        name: profileName,
        email: profileEmail,
      ));
    });
  }
}
