import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeStateProvider<bool> searchStateProvider =
    StateProvider.autoDispose<bool>((ProviderReference ref) => false);
