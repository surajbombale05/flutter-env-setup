import 'package:env_setup/utils/api_base_model.dart';


class ApiEndPoints {
  ApiBaseModel? apiBaseModel;

  ApiEndPoints({this.apiBaseModel}) {
    if (apiBaseModel == null) {}
  }

  late String baseUrl = apiBaseModel?.commerceUrl ?? "";
  late String authBaseUrl = apiBaseModel?.authUrl ?? "";
  late String gatewayBaseUrl = apiBaseModel?.gatewayUrl ?? "";
  late String memberBaseUrl = apiBaseModel?.memberUrl ?? "";
  late String academicUrl = apiBaseModel?.academicUrl ?? "";
  late String imageUploadBaseUrl = apiBaseModel?.imageUploadUrl ?? "";
  late String imageResizeBaseUrl = apiBaseModel?.imageResizeUrl ?? "";
  late String attendanceUrl = apiBaseModel?.attendanceBaseUrl ?? "";

  late String version = apiBaseModel?.version ?? "";
  late int groupId = apiBaseModel?.groupId ?? 1703228300417;
  late int sendOtpGroupId = apiBaseModel?.sendOtpGroupId ?? 1703228300417;
}
