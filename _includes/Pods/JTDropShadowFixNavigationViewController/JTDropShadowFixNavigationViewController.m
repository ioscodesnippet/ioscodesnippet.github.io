/*
 * This file is part of the http://ioscodesnippet.com
 * (c) Jamz Tang <jamz@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */


#import "JTDropShadowFixNavigationViewController.h"

@implementation JTDropShadowFixNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.clipsToBounds = NO;
}

@end

#if ENABLE_JTDROPSHADOW_GLOBAL_FIX

@interface UINavigationBar (JTDropShadowFix)

@end

@implementation UINavigationBar (JTDropShadowFix)

- (void)awakeFromNib {
    self.clipsToBounds = NO;
}

@end

#endif
