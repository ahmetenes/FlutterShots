#import "XmljsonPlugin.h"
#if __has_include(<xmljson/xmljson-Swift.h>)
#import <xmljson/xmljson-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "xmljson-Swift.h"
#endif

@implementation XmljsonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftXmljsonPlugin registerWithRegistrar:registrar];
}
@end
