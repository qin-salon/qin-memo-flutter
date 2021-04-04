import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeStateProvider<String> searchStateProvider =
    AutoDisposeStateProvider<String>((AutoDisposeProviderReference ref) => '');
