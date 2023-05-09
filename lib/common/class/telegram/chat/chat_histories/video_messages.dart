import 'package:telefilm/common/class/telegram/chat/super_group_full_info_class.dart';

import 'chat_history_class.dart';

class VideoMessages {
  int? id;
  SuperGroupFullInfo superGroupFullInfo;
  Message message;

  VideoMessages(this.id, this.superGroupFullInfo, this.message);
}
