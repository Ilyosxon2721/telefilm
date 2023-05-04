import 'package:get/get.dart';

import '../../modules/login_class_module.dart';

class UserDatasController extends GetxController {
  Rx<Login> user = Login(
      message: '',
      jwt: '',
      partnerData: PartnerData(
        id: 5,
        login: '',
        password: '',
        companyName: '',
        brandName: '',
        logo: '',
        partnerBankName: '',
        partnerInn: '',
        partnerBankMfo: '',
        partnerProps: '',
        directorId: 0,
        tarifId: 0,
        isActive: 0,
        userAddedId: 0,
        dateAdded: DateTime.now(),
        licenseTerm: DateTime.now(),
        status: '',
      )).obs;
}
