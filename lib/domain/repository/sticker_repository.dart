import 'package:good_job/domain/model/sticker.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract interface class StickerRepository{
  Box<Sticker> getStickersBox();
}