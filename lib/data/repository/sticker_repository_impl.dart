import 'package:good_job/domain/model/sticker.dart';
import 'package:good_job/domain/repository/sticker_repository.dart';
import 'package:hive/hive.dart';

class StickerRepositoryImpl implements StickerRepository {
  @override
  Box<Sticker> getStickersBox() {
    return Hive.box<Sticker>('stickers');
  }
}
