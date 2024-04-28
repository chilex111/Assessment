
import 'package:assesment_project/utils/string_utilities.dart';

extension FUStringUtils on String {
  bool get isEmail => StringUtils.isEmail(this);
}
