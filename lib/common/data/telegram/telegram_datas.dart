import 'package:get/get.dart';
import 'package:telefilm/common/class/telegram/chat/channel_class.dart';
import 'package:telefilm/common/class/telegram/chat/chat_histories/bots_class.dart';
import 'package:telefilm/common/class/telegram/chat/chat_histories/chat_history_class.dart';
import 'package:telefilm/common/class/telegram/chat/chat_histories/person_chat_history_class.dart'
    as person;
import 'package:telefilm/common/class/telegram/chat/chat_histories/video_messages.dart';
import 'package:telefilm/common/class/telegram/chat/download_file_class.dart';
import 'package:telefilm/common/class/telegram/chat/super_group_class.dart';
import 'package:telefilm/common/class/telegram/chat/super_group_full_info_class.dart';
import 'package:telefilm/common/class/telegram/chat/update_file.dart';

import '../../class/telegram/chat/private_chats_class.dart';
import '../../class/telegram/chats.dart' as chat;
import '../../class/telegram/countries.dart';
import '../../class/telegram/selected_country.dart';
import '../../class/telegram/verify_phone_number_data.dart';

class TelegramDatas extends GetxController {
  Rx<Countries> countries = Countries(type: '', countries: []).obs;
  Rx<chat.Chats> chats = chat.Chats(ok: true, result: []).obs;
  Rx<ChatHistory> chatHistory = ChatHistory().obs;
  Rx<person.PersonChatHistory> personChatHistory =
      person.PersonChatHistory().obs;
  Rx<DownloadFile> downloadFile = DownloadFile().obs;
  Rx<UpdateFile> updateFile = UpdateFile().obs;
  Rx<SuperGroupFullInfo> superGroupFullInfo = SuperGroupFullInfo().obs;
  Rx<Channel> chanel = Channel().obs;
  Rx<SuperGroup> superGroup = SuperGroup().obs;
  Rx<PrivateChats> privateChats = PrivateChats().obs;
  Rx<Bots> bots = Bots().obs;

  //lists
  RxList<SuperGroupFullInfo> superGroupFullInfoList =
      <SuperGroupFullInfo>[].obs;
  RxList<Message> chatHistoryVideos = <Message>[].obs;
  RxList<VideoMessages> videoMessages = <VideoMessages>[].obs;
  RxList<Channel> channelList = <Channel>[].obs;
  RxList<SuperGroup> superGroupList = <SuperGroup>[].obs;
  RxList<PrivateChats> privateChatsList = <PrivateChats>[].obs;
  RxList<Bots> botsList = <Bots>[].obs;
  RxList<chat.Result> channels = <chat.Result>[].obs;
  RxList<ChatHistory> chatHistoryList = <ChatHistory>[].obs;
  RxList<ChatHistory> chatHistoryListFromBots = <ChatHistory>[].obs;
  RxList<ChatHistory> chatHistoryListFromChannels = <ChatHistory>[].obs;
  RxList<ChatHistory> chatHistoryListFromPrivates = <ChatHistory>[].obs;
  RxList<ChatHistory> chatHistoryListFromSuperGroups = <ChatHistory>[].obs;
  Rx<ThisCountry> thisCountry = ThisCountry(
      type: '',
      countryCode: '',
      name: 'country'.tr,
      englishName: '',
      isHidden: false,
      callingCodes: ['code'.tr]).obs;
  Rx<VerifyPhoneNumberData> verifyPhoneNumberData = VerifyPhoneNumberData(
    type: '',
    authorizationState: AuthorizationState(
      type: '',
      codeInfo: CodeInfo(
        type: '',
        phoneNumber: '',
        codeInfoType: Type(type: '', length: 0),
        timeout: 0,
      ),
    ),
  ).obs;

  List masks = [
    {
      "AD": "000 00 00 00",
      "AE": "000 00 000 0000",
      "AF": "00 000 000 000",
      "AG": "0000 000 0000",
      "AI": "0000 000 0000",
      "AL": "000 00 000 0000",
      "AM": "000 00 000 0000",
      "AO": "000 000 000 000",
      "AR": "00 0000000000", //Todo
      "AS": "0000 000 0000",
      "AT": "00 000 000000",
      "AU": "00 0 0000 0000",
      "AZ": "000 00 000 0000",
      "BA": "000 00 000 000",
      "BB": "0000 000 0000",
      "BD": "000 00 000 000",
      "BE": "00 000 00 00 00",
      "BF": "000 00 00 00 00",
      "BG": "000 0000000000", //Todo
      "BH": "000 0000 0000",
      "BI": "000 00 00 0000",
      "BJ": "000 00 000 000",
      "BM": "0000 000 0000",
      "BN": "000 000 0000",
      "BO": "000 0 000 0000",
      "BQ": "000 0000000000", //Todo
      "BR": "00 00 00000 0000",
      "BS": "0000 000 0000",
      "BT": "000 00 000 000",
      "BW": "000 00 000 000",
      "BY": "000 00 000 0000",
      "BZ": "000 0000000000", //TODO
      "CA": "0 000 000 0000",
      "CD": "000 00 000 0000",
      "CF": "000 00 00 00 00",
      "CG": "000 00 000 0000",
      "CH": "00 00 000 0000",
      "CI": "000 00 00 00 0000",
      "CK": "000 0000000000", //TODO
      "CL": "00 0 0000 0000",
      "CM": "000 0000 00000",
      "CN": "00 000 0000 0000",
      "CO": "00 000 000 0000",
      "CR": "000 0000 0000",
      "CU": "00 0 000 0000",
      "CV": "000 000 0000",
      "CW": "000 0000000000", //TODO
      "CY": "000 0000 0000",
      "CZ": "000 000 000 000",
      "DE": "00 0000000000", //TODO
      "DJ": "000 00 00 00 00",
      "DK": "00 0000 0000",
      "DM": "0000 000 0000",
      "DO": "0000 000 0000",
      "DZ": "000 000 00 00 00",
      "EC": "000 00 000 0000",
      "EE": "000 0000 000",
      "EG": "00 00 0000 0000",
      "ER": "000 0 000 000",
      "ES": "00 000 000 000",
      "ET": "000 00 000 000",
      "FI": "000 0000000000", //TODO
      "FJ": "000 000 0000",
      "FK": "000 0000000000", //TODO
      "FM": "000 0000000000", //TODO
      "FO": "000 000 000",
      "FR": "00 0 00 00 00 00",
      "GA": "000 0 00 00 00",
      "GB": "00 0000 000000",
      "GD": "0000 000 0000",
      "GE": "000 000 000 000",
      "GF": "000 0000000000", //TODO
      "GH": "000 00 000 0000",
      "GI": "000 0000 0000",
      "GL": "000 000 000",
      "GM": "000 000 0000",
      "GN": "000 000 000 000",
      "GP": "000 000 00 00 00",
      "GQ": "000 000 000 000",
      "GR": "00 000 000 0000",
      "GT": "000 0 000 0000",
      "GU": "0000 000 0000",
      "GW": "000 000 0000",
      "GY": "000 0000000000", //TODO
      "HK": "000 0 000 0000",
      "HN": "000 0000 0000",
      "HR": "000 00 000 000",
      "HT": "000 0000 0000",
      "HU": "00 000 000 000",
      "ID": "00 000 000000",
      "IE": "000 00 000 0000",
      "IL": "000 00 000 0000",
      "IN": "00 00000 00000",
      "IO": "000 000 0000",
      "IQ": "000 000 000 0000",
      "IR": "00 000 000 0000",
      "IS": "000 000 0000",
      "IT": "00 000 000 0000",
      "JM": "0000 000 0000",
      "JO": "000 0 0000 0000",
      "JP": "00 00 0000 0000",
      "KE": "000 000 000 000",
      "KG": "000 000 000000",
      "KH": "000 00 000 000",
      "KI": "000 0000 0000",
      "KM": "000 000 0000",
      "KN": "0000 000 0000",
      "KP": "000 0000000000", //TODO
      "KR": "00 00 0000 000",
      "KW": "000 0000 0000",
      "KY": "0000 000 0000",
      "KZ": "0 000 000 0000",
      "LA": "000 00 00 000 000",
      "LB": "000 0000000000", //TODO
      "LC": "0000 000 0000",
      "LI": "000 000 0000",
      "LK": "00 00 000 0000",
      "LR": "000 00 000 0000",
      "LS": "000 00 000 000",
      "LT": "000 000 00000",
      "LU": "000 000 000 000",
      "LV": "000 00 000 0000",
      "MA": "000 00 000 0000",
      "MC": "000 0000 0000",
      "MD": "000 00 000 000",
      "ME": "000 0000000000", //TODO
      "MG": "000 00 00 000 00",
      "MH": "000 0000000000", //TODO
      "MK": "000 00 000000",
      "ML": "000 0000 0000",
      "MM": "00 0000000000", //TODO
      "MN": "000 00 00 0000",
      "MO": "000 0000 0000",
      "MP": "0000 000 0000",
      "MQ": "000 0000000000", //TODO
      "MR": "000 0000 0000",
      "MS": "0000 000 0000",
      "MT": "000 00 00 00 00",
      "MU": "000 0000 0000",
      "MV": "000 000 0000",
      "MW": "000 00 000 0000",
      "MX": "00 0000000000", //TODO
      "MY": "00 0000000000", //TODO
      "MZ": "000 00 000 0000",
      "NA": "000 00 000 0000",
      "NC": "000 0000000000", //TODO
      "NE": "000 00 00 00 00",
      "NF": "000 0000000000", //TODO
      "NG": "000 00 00000 00000",
      "NI": "000 0000 0000",
      "NL": "00 0 00 00 00 00",
      "NO": "00 000 00 000",
      "NP": "000 00 0000 0000",
      "NR": "000 0000000000", //TODO
      "NU": "000 0000000000", //TODO
      "NZ": "00 0000 0000",
      "OM": "000 0000 0000",
      "PA": "000 0000 0000",
      "PE": "00 000 000 000",
      "PF": "000 0000000000", //TODO
      "PG": "000 0000000000", //TODO
      "PH": "00 000 000 0000",
      "PK": "00 000 000 0000",
      "PL": "00 000 000 000",
      "PM": "000 0000000000",
      "PR": "0000 000 0000",
      "PS": "000 000 00 0000",
      "PT": "000 000 000 000",
      "PW": "000 0000000000", //TODO
      "PY": "000 000 000 000",
      "QA": "000 00 000 000",
      "RE": "000 000 000 000",
      "RO": "00 000 000 000",
      "RS": "000 00 000 000",
      "RU": "0 000 000 0000",
      "RW": "000 000 000 000",
      "SA": "000 00 000 0000",
      "SB": "000 0000000000", //TODO
      "SC": "000 0 00 00 00",
      "SD": "000 00 000 0000",
      "SE": "00 00 000 0000",
      "SG": "00 0000 0000",
      "SH": "000 0000000000", //TODO
      "SI": "000 00 000 000",
      "SK": "000 000 000 000",
      "SL": "000 00 000 000",
      "SM": "000 0000000000", //TODO
      "SN": "000 00 000 0000",
      "SO": "000 00 000 000",
      "SR": "000 000 0000",
      "SS": "000 00 000 0000",
      "ST": "000 00 00000",
      "SV": "000 0000 0000",
      "SX": "0000 000 0000",
      "SY": "000 000 000 000",
      "SZ": "000 0000 0000",
      "TC": "0000 000 0000",
      "TD": "000 00 00 00 00",
      "TG": "000 00 000 000",
      "TH": "00 0 0000 0000",
      "TJ": "000 00 000 0000",
      "TK": "000 0000000000", //TODO
      "TL": "000 0000000000", //TODO
      "TM": "000 00 000000",
      "TN": "000 00 000 000",
      "TO": "000 0000000000", //TODO
      "TR": "00 000 000 0000",
      "TT": "0000 000 0000",
      "TV": "000 000000000", //TODO,
      "TW": "000 000 000 000",
      "TZ": "000 00 000 0000",
      "UA": "000 00 000 00 00",
      "UG": "000 00 000 0000",
      "US": "0 000 000 0000",
      "UY": "000 0 000 0000",
      "UZ": "000 00 000 00 00",
      "VC": "0000 000 0000",
      "VE": "00 000 000 0000",
      "VG": "0000 000 0000",
      "VI": "0000 000 0000",
      "VN": "00 0000000000", //TODO
      "VU": "000 0000000000", //TODO
      "WF": "000 0000000000", //TODO
      "WS": "000 0000000000", //TODO
      "XG": "000 0000000000", //TODO
      "XK": "000 0000 0000",
      "XV": "000 0000000000", //TODO
      "YE": "000 000 000 000",
      "YL": "00 0000000000", //TODO
      "ZA": "00 00 000 0000",
      "ZM": "000 00 000 0000",
      "ZW": "000 00 000 0000",
    }
  ].obs;
}
