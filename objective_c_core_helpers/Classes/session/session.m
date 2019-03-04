//
//  session.m
//  XClient
//
//  Created by Hitesh Khunt on 29/04/15.
//  Copyright (c) 2015 XClient. All rights reserved.
//

#import "session.h"
//#import "imlb.h"
#import "config.h"

@implementation session

static session *sessionSingleton;

+(session *) singleton
{
    static BOOL initialized = NO;
    if(!initialized)
    {
        initialized = YES;
        sessionSingleton = [[session alloc] init];
    }
    
    return sessionSingleton;
}

-(NSString *) getSessionId
{
    //NSString *session_id = [[sqLiteHelper singleton] getConfigKey:@"session_id" ];
    NSString *session_id = [[session singleton] userdata:@"session_id"];
    if( [session_id length] == 0 )
    {
        return @"0";
    }
    else
    {
        return session_id;
    }
}

-(void) setSessionId:(NSString *) session_id
{
    //[[sqLiteHelper singleton] updInsConfigKey:@"session_id" withValue:session_id];
    [[session singleton] set_userdata:@"session_id" withValue:session_id];
}
//
///**
// *
// */
-(BOOL) isSession:(NSString *) key
{
//    NSString *val = [[sqLiteHelper singleton] getConfigKey:key ];
//    if( [val length] == 0 )
//    {
//        return false;
//    }
//    else
//    {
//        return true;
//    }
    if(true)
    {
        return true;
    }
//    NSLog(@"res %@",key);
}

-(NSString *) userdata:(NSString *) key
{
    //return [[sqLiteHelper singleton] getConfigKey:key ];
    NSString *val = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return val == nil ? @"" : val;
}

-(float) getTimeZone
{
    if(true)
        return 7.33;

//    NSString* res = [[session singleton] userdata:@"timezone"];
//    NSLog(@"res %@",res);
//    if( ![imlb isStrEmptyStrict:res] )
//    {
//      //  NSLog(@"inif");
//        return [imlb strToFloatSecure:res];
//    }
//    else
//    {
//    //    NSLog(@"inelse");
//        return [imlb strToFloatSecure:@"-8"];
//    }
}

///**
// * cart login
// */
//-(BOOL) isCartLoggedIn
//{
//    return (![imlb isStrEmpty:[self userdata:@"opencart_customer_id"]] ) ? YES : NO;
//}

/**
 * update LANG session key for this class and lang session it self
 */

-(void) updateLangSession:() responseObj withValue:(NSString *) lang
{
    NSString *LANG = [lang stringByAppendingString:@"_"] ;
    
    [self set_userdata:@"lang" withValue:LANG];
}

/************************************ JSON session functions ***************************************/

/**
 *
 */
-(void) setJSONSession:(NSString *) key withValue:(NSDictionary *) jsonObj
{
    //set_userdata( key, jsonObj.toString());
    
    //save drawer menu in session
    NSData *plist = [NSPropertyListSerialization
                     dataWithPropertyList:jsonObj
                     format:NSPropertyListXMLFormat_v1_0
                     options:kNilOptions
                     error:NULL];
    NSString *str = [[NSString alloc] initWithData:plist encoding:NSUTF8StringEncoding];
    
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

/**
 *
 */
-(NSDictionary *) getJSONSession:(NSString *) key
{
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:key];
    if( savedValue == nil )
    {
        return nil;
    }
    
    NSDictionary *resObj = [NSPropertyListSerialization
                            propertyListWithData:[savedValue dataUsingEncoding:NSUTF8StringEncoding]
                            options:kNilOptions
                            format:NULL
                            error:NULL];
    
    return resObj;
}

/************************************ JSON session functions END ***********************************/

/**
 *
 * @return type java hash map however it is expected that value is originally stored as map, otherwise it will through runtime error
 */
//public Map<String, String> userdata_map( String key )
//{
//    return imlb.singleton().jsonStringToMap(ctx, sqLiteHelper.singleton( ctx ).getConfigKey( key ));
//    //		String val = sess.get( key );
//    //		if( val != null )
//    //		{
//    //			return val;
//    //		}
//    //		else
//    //		{
//    //			return "";
//    //			//return sqLiteHelper.singleton().getConfigKey( key );
//    //		}
//}

/**
 * stores string value in session

 */
-(void) set_userdata:(NSString *) key withValue:(NSString *) val
{
//    [[sqLiteHelper singleton] updInsConfigKey: key withValue:val ];
    [[NSUserDefaults standardUserDefaults] setValue:val forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

///**
// * stores map value in session
// * @param key
// * @param map
// */
////public void set_userdata( String key, Map<String, String> map )
////{
////    //sess.put( key, val );
////    sqLiteHelper.singleton( ctx ).updInsConfigKey( key, imlb.singleton().mapToJsonString(map) );
////}

-(void) unset_userdata:(NSString *) key
{
//    [[sqLiteHelper singleton] deleteConfigKey: key ];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *
 */
-(void) setFlashMessage:(NSString *) key withValue:(NSString *) msg
{
    [self set_userdata:[NSString stringWithFormat:@"flash_/%@", key] withValue:msg];
}

/**
 *
 */
-(NSString *) getFlashMessage:(NSString *) key
{
    return [self userdata: [NSString stringWithFormat:@"flash_/%@", key] ];
}

/**
 * PRIVATE: Internal method - removes "flash" session marked as 'old'
 */
-(void) _flashdata_sweep:(NSString *) key
{
    [self unset_userdata: [NSString stringWithFormat:@"flash_/%@", key] ];
}

//	/**
//	 * PRIVATE: Internal method - marks "flash" session attributes as 'old'
//	 */
//	function _flashdata_mark()
//	{
//		$flash = userdata( 'flash' );
//
//		set_userdata( array( 'flash_old'=>$flash ) );
//
//		unset_userdata( 'flash' );
//	}
//
//	/**
//	 * PRIVATE: Internal method - removes "flash" session marked as 'old'
//	 */
//	function _flashdata_sweep()
//	{
//		unset_userdata( 'flash_old' );
//	}

-(void) setLoginSessions:(NSDictionary*) responseObj
{
   // NSLog(@"setLoginSessions %@", responseObj);
    [[session singleton] set_userdata:@"customer_id" withValue: [responseObj objectForKey: @"customer_id"]];
    [[session singleton] set_userdata:@"login_from" withValue: [responseObj objectForKey: @"mode"]];   //@"DIRECT"];
    [[session singleton] set_userdata:@"firstname" withValue: [responseObj objectForKey: @"customer_firstname"]];
    [[session singleton] set_userdata:@"email" withValue: [responseObj objectForKey: @"customer_emailid"]];
    [[session singleton] set_userdata:@"su_type" withValue: [responseObj objectForKey: @"su_type"]];
    [[session singleton] set_userdata:@"session_id" withValue: [responseObj objectForKey: @"session_id"]];
    [[session singleton] set_userdata:@"sc_social_id" withValue: [responseObj objectForKey: @"sc_social_id"]];
    [[session singleton] set_userdata:@"seller_plan_id" withValue: [responseObj objectForKey: @"seller_plan_id"]];
    
    //[[session singleton] set_userdata:@"opencart_customer_id" withValue: [responseObj objectForKey: @"opencart_customer_id"]];
}


/**
 *
 */
-(BOOL) isSellerLoggedIn
{
    ////NSLog(@" isSellerLoggedIn %@ " , [[session singleton]userdata:@"su_type"]  );
    //return ( imlb.strToIntSecure(ctx, userdata("customer_id")) > 0 ) ? true : false;
    return ( [[self userdata:@"su_type"] isEqualToString:@"S"]  ) ? YES : NO;
}

-(void) setShippSessions:() responseObj
{
    [[session singleton] set_userdata:@"customer_shipping_address_id" withValue: [responseObj objectForKey: @"customer_shipping_address_id"]];
    [[session singleton] set_userdata:@"customer_billing_address_id" withValue: [responseObj objectForKey: @"customer_billing_address_id"]];
    [[session singleton] set_userdata:@"is_shipping_valid" withValue: [responseObj objectForKey: @"is_shipping_valid"]];
}

/**
 * save NSArray in NSUserdefault
 */

-(void) setArray:(NSMutableArray *) saveValue key :(NSString*)arrayKey
{
    [[NSUserDefaults standardUserDefaults] setValue:saveValue forKey:arrayKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 * get NSArray in NSUserdefault
 */

-(NSMutableArray *) getArray: (NSString*)arrayKey
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:arrayKey];
}

/**
 * save NSArray in NSUserdefault
 */
-(void) setObject:(id) saveValue key :(NSString*)arrayKey
{
    [[NSUserDefaults standardUserDefaults] setValue:saveValue forKey:arrayKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 * get NSArray in NSUserdefault
 */

-(id) getObject: (NSString*)arrayKey
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:arrayKey];
}

/**
 *
 */
//-(BOOL) isLoggedIn
//{
//    //return ( imlb.strToIntSecure(ctx, userdata("customer_id")) > 0 ) ? true : false;
////    return (![imlb isStrEmpty:[self userdata:@"email"]] ) ? YES : NO;
//}

/**
 *
 */
-(BOOL) isAdmin
{
    //return ( imlb.strToIntSecure(ctx, userdata("customer_id")) > 0 ) ? true : false;
    return ( [[self userdata:@"seller_plan_id"] isEqualToString:@"1"] ) ? YES : NO;
}

-(BOOL) isOwner
{
    //return ( imlb.strToIntSecure(ctx, userdata("customer_id")) > 0 ) ? true : false;
    return ( [[self userdata:@"seller_plan_id"] isEqualToString:@"2"] ) ? YES : NO;
}

-(BOOL) isManager
{
    //return ( imlb.strToIntSecure(ctx, userdata("customer_id")) > 0 ) ? true : false;
    return ( [[self userdata:@"seller_plan_id"] isEqualToString:@"3"] ) ? YES : NO;
}

-(BOOL) isStaff
{
    //return ( imlb.strToIntSecure(ctx, userdata("customer_id")) > 0 ) ? true : false;
    return ( [[self userdata:@"seller_plan_id"] isEqualToString:@"4"] ) ? YES : NO;
}


/**
 * @author Hiren Donda
 * function will unset check out related all session on completion of order,
 * here it is required to note that on REST client all JavaScript counter part sessions are held in
 * client sessions and not server session. SO Don't confuse it with server session.
	*/

-(void) unsetCheckOutSession
{
    /**
     * Well! now it is decided to not flush checkout session after order is placed.
     * So that in future check out it will be easy for users.
     */
    //[temp]: Comment below unset statement, to make checkout process faster
    //in next orders for user by keeping old checkout session. But only do it
    //if it is viable in all terms refer to other app flows as well.
    
    [self unset_userdata:@"is_shipping_valid" ];
    [self unset_userdata:@"customer_shipping_address_id"];
    [self unset_userdata:@"customer_billing_address_id"];
    [self unset_userdata:@"order_id"];
}

//-(BOOL) is_shipp_info_set
//{
//    if(
//       [imlb strToIntSecure: [self userdata:@"customer_shipping_address_id"]] > 0
//       &&
//       [imlb strToIntSecure: [self userdata:@"customer_billing_address_id"]] > 0
//       &&
//       [imlb strToIntSecure: [self userdata:@"is_shipping_valid"]] > 0
//       )
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//}

/***************************** location functions *********************************/

- (void) setGeoLocation:(NSString *)last_latitude longitude:(NSString*)last_longitude Text:(NSString*)last_location_text city:(NSString*)city
{
    [self set_userdata:@"last_city" withValue: city];
    [self set_userdata:@"last_latitude" withValue: last_latitude];
    [self set_userdata:@"last_longitude" withValue: last_longitude];
    [self set_userdata:@"last_location_text" withValue: last_location_text];
}

-(NSString*) getLocationText
{
    return [self userdata:@"last_location_text"];
}

-(NSString*) getLastLatitude
{
    return [self userdata:@"last_longitude"];
}

-(NSString*) getLastLongitude
{
    return [self userdata:@"last_latitude"];
}


/***************************** location functions ends *********************************/


/***************************** search session functions *********************************/

- (void) setSearchGeoLocation:(NSString *)last_latitude longitude:(NSString*)last_longitude Text:(NSString*)last_location_text city:(NSString*)city
{
    [self set_userdata:@"search_city" withValue: city];
    [self set_userdata:@"search_latitude" withValue: last_latitude];
    [self set_userdata:@"search_longitude" withValue: last_longitude];
    [self set_userdata:@"search_location_text" withValue: last_location_text];
}

-(NSString*) getSearchCity
{
    NSString *search_city = [self userdata:@"search_city"];
    if( [search_city isEqualToString:@""] )
    {
        return [self userdata:@"last_city"];
    }
    else
    {
        return search_city;
    }
}

-(NSString*) getSearchLatitude
{
    NSString *search_latitude = [self userdata:@"search_latitude"];
    if( [search_latitude isEqualToString:@""] )
    {
        return [self userdata:@"last_longitude"];
    }
    else
    {
        return search_latitude;
    }
}

-(NSString*) getSearchLongitude
{
    NSString *search_longitude = [self userdata:@"search_longitude"];
    if( [search_longitude isEqualToString:@""] )
    {
        return [self userdata:@"last_latitude"];
    }
    else
    {
        return search_longitude;
    }
}

-(NSString*) getSearchLocationText
{
    NSString *search_location_text = [self userdata:@"search_location_text"];
    if( [search_location_text isEqualToString:@""] )
    {
        return [self userdata:@"last_location_text"];
    }
    else
    {
        return search_location_text;
    }
}


/***************************** search session functions ends *********************************/


/************************************ chat session functions ***************************************/

/**
 *
 */
-(void) setChatLoginSessions:(UIViewController*) he_ControllerObj resObj:(NSDictionary*) resObj
{
    [self setChatLoginSessions:he_ControllerObj user_id:[resObj objectForKey:@"chat_user_id"] pass:[resObj objectForKey:@"chat_user_pass"] chat_usr_email:[resObj objectForKey:@"email"] chat_usr_fname:[resObj objectForKey:@"full_name"]];
}

/**
 *
 */
-(void) setChatLoginSessions:(UIViewController*) he_ControllerObj user_id:(NSString*) user_id pass:(NSString*) pass chat_usr_email:(NSString*) chat_usr_email chat_usr_fname:(NSString*) chat_usr_fname
{
    [[session singleton] set_userdata:@"chat_user_id" withValue: user_id];
    [[session singleton] set_userdata:@"chat_usr_email" withValue: chat_usr_email];
    [[session singleton] set_userdata:@"chat_pass" withValue: pass];
    [[session singleton] set_userdata:@"chat_usr_fname" withValue: chat_usr_fname];
}

/**
 * unset Login
 */
-(void) unsetChatLoginSessions
{
//    [chatHelperQuickBlox chat_bkg_doLogout];
//    
//    [self unsetChatConnectionLoginSessions];
//    
//    [self unset_userdata:@"chat_user_id"];
//    [self unset_userdata:@"chat_usr_email"];
//    [self unset_userdata:@"chat_pass"];
//    [self unset_userdata:@"chat_usr_fname"];
}

/**
 *
 */
-(void) setChatConnectionSessions
{
//    [self set_userdata:@"is_chat_connection_on" withValue:@"1"];
//    
//    [chatHelperQuickBlox startBackgroundProcess];
}

/**
 * unset Login
 */
-(void) unsetChatConnectionLoginSessions
{
    [self unset_userdata:@"is_chat_connection_on"];
}

/**
 *  check if user is loggedin
 */
-(BOOL) isChatConnected
{
    return ( [[self userdata:@"is_chat_connection_on"] isEqualToString:@"1"] ) ? true : false;
}

/************************************ chat session functions end ***************************************/


/**
 * de reference all references to object and variable it will help prevent memory leak/massive memory usage
 */
-(void) do_cleanup
{
    //it seems that due to ARC, releaseing memory is not necessary but needs over this
    //[sessionSingleton release];
}

@end
