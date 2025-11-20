import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'zfh_core_platform_interface.dart';

/// An implementation of [ZfhCorePlatform] that uses method channels.
class MethodChannelZfhCore extends ZfhCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('zfh_core');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
