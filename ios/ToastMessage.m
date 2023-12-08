#import "ToastMessage.h"
#import <UIKit/UIKit.h>

@implementation ToastMessage

RCT_EXPORT_MODULE();

// Export a method that retrieves safe area insets
RCT_EXPORT_METHOD(getSafeAreaInsets:(RCTResponseSenderBlock)callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIEdgeInsets safeAreaInsets = [self getSafeAreaInsets];
        callback(@[@{
            @"top": @(safeAreaInsets.top),
            @"bottom": @(safeAreaInsets.bottom),
            @"left": @(safeAreaInsets.left),
            @"right": @(safeAreaInsets.right),
        }]);
    });
}

// Helper method to get safe area insets
- (UIEdgeInsets)getSafeAreaInsets
{
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    if (@available(iOS 11.0, *)) {
        return window.safeAreaInsets;
    } else {
        return UIEdgeInsetsZero;
    }
}

@end
