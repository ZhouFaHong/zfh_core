#include "include/zfh_core/zfh_core_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "zfh_core_plugin.h"

void ZfhCorePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  zfh_core::ZfhCorePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
