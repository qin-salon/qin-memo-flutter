import 'package:hooks_riverpod/hooks_riverpod.dart';

final AutoDisposeStateProvider<String> searchTextFieldProvider =
    AutoDisposeStateProvider<String>((AutoDisposeProviderReference ref) => '');
