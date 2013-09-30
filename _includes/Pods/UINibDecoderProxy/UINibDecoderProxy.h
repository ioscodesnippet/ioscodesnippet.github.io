/*
 * This file is part of the http://ioscodesnippet.com
 * (c) Jamz Tang <jamz@jamztang.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */


/* 
 * // Usage
 *
 * - (id)initWithCoder:(NSCoder *)aDecoder {
 *    self = [super initWithCoder:[[UINibDecoderProxy alloc] initWithTarget:aDecoder]];
 *    return self;
 * }
 *
 */

#import <Foundation/Foundation.h>

@interface UINibDecoderProxy : NSProxy

@property (nonatomic, strong) id target;

- (id)initWithTarget:(id)target;

@end


