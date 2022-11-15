import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:magic/models/session.dart';
import 'package:magic/utils/hive_utils.dart';


final storedSessionsProvider = FutureProvider.autoDispose<List<Session>>((ref){
  return HiveUtils.getStoredSessions();
});