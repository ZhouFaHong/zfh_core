import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zfh_core_method_channel.dart';

abstract class ZfhCorePlatform extends PlatformInterface {
  /// Constructs a ZfhCorePlatform.
  ZfhCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static ZfhCorePlatform _instance = MethodChannelZfhCore();

  /// The default instance of [ZfhCorePlatform] to use.
  ///
  /// Defaults to [MethodChannelZfhCore].
  static ZfhCorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZfhCorePlatform] when
  /// they register themselves.
  static set instance(ZfhCorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
