#ifndef FLUTTER_PLUGIN_ZFH_CORE_PLUGIN_H_
#define FLUTTER_PLUGIN_ZFH_CORE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace zfh_core {

class ZfhCorePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ZfhCorePlugin();

  virtual ~ZfhCorePlugin();

  // Disallow copy and assign.
  ZfhCorePlugin(const ZfhCorePlugin&) = delete;
  ZfhCorePlugin& operator=(const ZfhCorePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace zfh_core

#endif  // FLUTTER_PLUGIN_ZFH_CORE_PLUGIN_H_
