import 'package:fbanime/models/user_model.dart';
import 'package:meta/meta.dart';

import '../config/palette.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool isViewed;

  const Story({
    required this.user,
    required this.imageUrl,
    this.isViewed = true,
  });
}
