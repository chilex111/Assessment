import 'package:flutter_riverpod/flutter_riverpod.dart';

// Initial index set to 0 (Home)
final selectedBottomNavIndexProvider = StateProvider<int>((ref) => 0);