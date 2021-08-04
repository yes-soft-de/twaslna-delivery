import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_account/response/profile_response.dart';
import 'package:twaslna_delivery/utils/images/images.dart';

class ProfileModel {
  String name = '';
  String image = ImageAsset.NETWORK ;
  String location = '';
  bool _empty = false;
  String? _error;
  ProfileModel? _profileModel;

  ProfileModel.Empty() {
    _empty = true;
  }

  ProfileModel.Error(this._error);

  ProfileModel(
      {required this.name, required this.image, required this.location});

  bool get hasError => _error != null;

  bool get isEmpty => _empty;

  bool get hasData => _profileModel != null;

  ProfileModel.Data(ProfileResponse profileResponse) {
    _profileModel = ProfileModel(
        name: profileResponse.data?.clientName ?? S.current.username,
        image: profileResponse.data?.image ?? ImageAsset.NETWORK,
        location: profileResponse.data?.location ?? ''
    );
  }

  ProfileModel get data => _profileModel ?? ProfileModel.Empty();

  String get error => _error ?? '';
}
