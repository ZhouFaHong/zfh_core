import 'package:flutter_test/flutter_test.dart';
import 'package:zfh_core/zfh_core.dart';
import 'package:zfh_core/src/platform/zfh_core_platform_interface.dart';
import 'package:zfh_core/src/platform/zfh_core_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZfhCorePlatform
    with MockPlatformInterfaceMixin
    implements ZfhCorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZfhCorePlatform initialPlatform = ZfhCorePlatform.instance;

  test('$MethodChannelZfhCore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZfhCore>());
  });

  test('getPlatformVersion', () async {
    ZfhCore zfhCorePlugin = ZfhCore();
    MockZfhCorePlatform fakePlatform = MockZfhCorePlatform();
    ZfhCorePlatform.instance = fakePlatform;

    expect(await zfhCorePlugin.getPlatformVersion(), '42');
  });
}
