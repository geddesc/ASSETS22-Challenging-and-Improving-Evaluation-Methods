import 'package:flutter/foundation.dart';

class StruggleFeedbackModel {
  final String techniqueName;
  final int taskId;
  final String feedback;
  final bool struggle;

  StruggleFeedbackModel({
    @required this.struggle,
    this.feedback = "N/A",
    @required this.techniqueName,
    @required this.taskId,
  });
}
