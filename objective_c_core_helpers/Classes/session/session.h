//
//  session.h
//  XClient
//
//  Created by Hitesh Khunt on 29/04/15.
//  Copyright (c) 2015 XClient. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface session : NSObject

+(session *) singleton;

-(NSString *) getSessionId;

-(void) setSessionId:(NSString *) session_id;

-(BOOL) isSession:(NSString *) key;

-(NSString *) userdata:(NSString *) key;

-(float) getTimeZone;

//public Map<String, String> userdata_map( String key )

-(void) set_userdata:(NSString *) key withValue:(NSString *) val;

//public void set_userdata( String key, Map<String, String> map );

-(void) unset_userdata:(NSString *) key;

-(void) setFlashMessage:(NSString *) key withValue:(NSString *) msg;

-(NSString *) getFlashMessage:(NSString *) key;

-(void) _flashdata_sweep:(NSString *) key;

//	function _flashdata_mark();

//	function _flashdata_sweep();

-(void) setLoginSessions:(NSDictionary*) responseObj;

-(void) setShippSessions:() responseObj;

//-(BOOL) isCartLoggedIn;

//-(void) unsetLoginSessions;

-(void) unsetCheckOutSession;

-(void) updateLangSession:() responseObj withValue:(NSString *) lang;

-(void) setJSONSession:(NSString *) key withValue:(NSDictionary *) jsonObj;

-(NSDictionary *) getJSONSession:(NSString *) key;

-(void) setArray:(NSMutableArray *) saveValue key :(NSString*)arrayKey;

-(NSMutableArray *) getArray: (NSString*)arrayKey;

-(void) setObject:(id) saveValue key :(NSString*)arrayKey;

-(id) getObject: (NSString*)arrayKey;

/**
 */
//-(BOOL) is_shipp_info_set;

/**
 *
 */
-(BOOL) isSellerLoggedIn;

/**
 *
 */
//-(BOOL) isLoggedIn;

-(BOOL) isAdmin;
-(BOOL) isOwner;
-(BOOL) isManager;
-(BOOL) isStaff;

/***************************** location functions *********************************/

- (void) setGeoLocation:(NSString *)last_latitude longitude:(NSString*)last_longitude Text:(NSString*)last_location_text city:(NSString*)city;

-(NSString*) getLocationText;

-(NSString*) getLastLatitude;

-(NSString*) getLastLongitude;

/***************************** location functions ends *********************************/


/***************************** search session functions *********************************/

- (void) setSearchGeoLocation:(NSString *)last_latitude longitude:(NSString*)last_longitude Text:(NSString*)last_location_text city:(NSString*)city;

-(NSString*) getSearchCity;

-(NSString*) getSearchLatitude;

-(NSString*) getSearchLongitude;

-(NSString*) getSearchLocationText;

/***************************** search session functions ends *********************************/


/************************************ chat session functions ***************************************/

-(void) setChatLoginSessions:(UIViewController*) he_ControllerObj resObj:(NSDictionary*) resObj;

-(void) setChatLoginSessions:(UIViewController*) he_ControllerObj user_id:(NSString*) user_id pass:(NSString*) pass chat_usr_email:(NSString*) chat_usr_email chat_usr_fname:(NSString*) chat_usr_fname;

-(void) unsetChatLoginSessions;

-(void) setChatConnectionSessions;

-(void) unsetChatConnectionLoginSessions;

//-(BOOL) isChatCredentialAvailable;

-(BOOL) isChatConnected;

/************************************ chat session functions end ***************************************/


-(void) do_cleanup;

@end
