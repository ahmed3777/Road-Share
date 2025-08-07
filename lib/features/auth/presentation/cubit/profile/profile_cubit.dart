import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/features/auth/data/models/app_user.dart';
import 'package:roadshare/features/auth/domin/repos/auth_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepo _repo;
  final AppUser originalUser;
  ProfileCubit(this._repo, this.originalUser) : super(ProfileInitial());

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required bool isAvailable,
    required String? role,
    String? carModel,
    String? carPlate,
    String? carColor,
  }) async {
    final fields = <String, dynamic>{};
    if (name != originalUser.name) fields['name'] = name;
    if (email != originalUser.email) fields['email'] = email;
    if (phone != originalUser.phone) fields['phone'] = phone;
    if (isAvailable != originalUser.isAvailable)fields['isAvailable'] = isAvailable;
    if (role != originalUser.role) fields['role'] = role;
    if (role == "rider") {
      fields['vehicleInfo'] = null;
    } else {
      if (carModel != originalUser.vehicleInfo?.type) fields['type'] = carModel;
      if (carPlate != originalUser.vehicleInfo?.plateNumber)fields['plateNumber'] = carPlate;
      if (carColor != originalUser.vehicleInfo?.color)fields['color'] = carColor;
    }
    if (fields.isEmpty) {
      emit(ProfileNoChanges());
      return;
    }
    emit(ProfileLoading());
    final result = await _repo.updateUserData(
      uid: originalUser.uid,
      updatedFields: fields,
    );
    result.fold(
      (failure) => emit(ProfileError(failure.errMessage)),
      (_) => emit(ProfileSuccess()),
    );
  }
}
