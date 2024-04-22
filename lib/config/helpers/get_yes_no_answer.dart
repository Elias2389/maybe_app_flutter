import 'package:dio/dio.dart';
import 'package:maybe_app/domain/entity/message.dart';

import '../../infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final resp = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoAnswerModel.fromJsonMap(resp.data);

    return yesNoModel.toMessageEntity();
  }
}
