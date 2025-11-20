import 'zfh_core_platform_interface.dart';

class ZfhCore {
  Future<String?> getPlatformVersion() {
    return ZfhCorePlatform.instance.getPlatformVersion();
  }
}