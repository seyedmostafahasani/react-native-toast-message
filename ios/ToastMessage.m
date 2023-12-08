// ToastMessage.m
#import "ToastMessage.h"

@implementation ToastMessage

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getSafeAreaInsets:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;

            if (@available(iOS 11.0, *)) {
                safeAreaInsets = UIApplication.sharedApplication.keyWindow.safeAreaInsets;
            }

            resolve(@{
                @"top": @(safeAreaInsets.top),
                @"left": @(safeAreaInsets.left),
                @"bottom": @(safeAreaInsets.bottom),
                @"right": @(safeAreaInsets.right)
            });
        });
    } @catch (NSException *exception) {
        reject(@"GET_SAFE_AREA_ERROR", exception.reason, nil);
    }
}

@end
