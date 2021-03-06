//
//  init.m
//  vcx
//
//  Created by GuestUser on 4/30/18.
//  Copyright © 2018 GuestUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectMeVcx.h"
#import "utils/NSError+VcxError.h"
#import "utils/VcxCallbacks.h"
#import "vcx.h"
#include "vcx.h"

void VcxWrapperCommonCallback(vcx_command_handle_t xcommand_handle,
                              vcx_error_t err) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *) = (void (^)(NSError *)) block;

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error);
        });
    }
}

void VcxWrapperCommonHandleCallback(vcx_command_handle_t xcommand_handle,
                                    vcx_error_t err,
                                    vcx_command_handle_t pool_handle) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, VcxHandle) = (void (^)(NSError *, VcxHandle)) block;

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, (VcxHandle) pool_handle);
        });
    }
}

void VcxWrapperCommonNumberCallback(vcx_command_handle_t xcommand_handle,
                                    vcx_error_t err,
                                    vcx_command_handle_t handle) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, vcx_command_handle_t) = (void (^)(NSError *, vcx_command_handle_t)) block;

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, handle);
        });
    }
}

void VcxWrapperCommonStringCallback(vcx_command_handle_t xcommand_handle,
                                    vcx_error_t err,
                                    const char *const arg1) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *) = (void (^)(NSError *, NSString *arg1)) block;
    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1);
        });
    }
}

void VcxWrapperCommonBoolCallback(vcx_command_handle_t xcommand_handle,
                                  vcx_error_t err,
                                  unsigned int arg1) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, BOOL) = (void (^)(NSError *, BOOL arg1)) block;

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, (BOOL) arg1);
        });
    }
}

void VcxWrapperCommonStringStringCallback(vcx_command_handle_t xcommand_handle,
                                          vcx_error_t err,
                                          const char *const arg1,
                                          const char *const arg2) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *arg1, NSString *arg2) = (void (^)(NSError *, NSString *arg1, NSString *arg2)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2);
        });
    }
}

void VcxWrapperCommonStringOptStringCallback(vcx_command_handle_t xcommand_handle,
                                             vcx_error_t err,
                                             const char *const arg1,
                                             const char *const arg2) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *arg1, NSString *arg2) = (void (^)(NSError *, NSString *arg1, NSString *arg2)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2);
        });
    }
}

void VcxWrapperCommonStringOptStringOptStringCallback(vcx_command_handle_t xcommand_handle,
                                                      vcx_error_t err,
                                                      const char *const arg1,
                                                      const char *const arg2,
                                                      const char *const arg3) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *arg1, NSString *arg2, NSString *arg3) = (void (^)(NSError *, NSString *arg1, NSString *arg2, NSString *arg3)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }
    NSString *sarg3 = nil;
    if (arg3) {
        sarg3 = [NSString stringWithUTF8String:arg3];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2, sarg3);
        });
    }
}

void VcxWrapperCommonStringStringStringCallback(vcx_command_handle_t xcommand_handle,
                                                vcx_error_t err,
                                                const char *const arg1,
                                                const char *const arg2,
                                                const char *const arg3) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *arg1, NSString *arg2, NSString *arg3) = (void (^)(NSError *, NSString *arg1, NSString *arg2, NSString *arg3)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }
    NSString *sarg3 = nil;
    if (arg3) {
        sarg3 = [NSString stringWithUTF8String:arg3];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2, sarg3);
        });
    }
}

/// Arguments arg1 and arg2 will be converted to nsdata
void VcxWrapperCommonDataCallback(vcx_command_handle_t xcommand_handle,
                                  vcx_error_t err,
                                  const uint8_t *const arg1,
                                  uint32_t arg2) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSData *arg) = (void (^)(NSError *, NSData *arg)) block;

    NSData *sarg = [NSData dataWithBytes:arg1 length:arg2];

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg);
        });
    }
}

void VcxWrapperCommonStringDataCallback(vcx_command_handle_t xcommand_handle,
                                        vcx_error_t err,
                                        const char *const arg1,
                                        const uint8_t *const arg2,
                                        uint32_t arg3) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *, NSData *) = (void (^)(NSError *, NSString *, NSData *)) block;

    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSData *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSData dataWithBytes:arg2 length:arg3];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, sarg1, sarg2);
        });
    }
}

void VcxWrapperCommonStringStringLongCallback(vcx_command_handle_t xcommand_handle,
                                              vcx_error_t err,
                                              const char *arg1,
                                              const char *arg2,
                                              unsigned long long arg3) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, NSString *, NSString *, NSNumber *) = (void (^)(NSError *, NSString *arg1, NSString *arg2, NSNumber *arg3)) block;
    NSString *sarg1 = nil;
    if (arg1) {
        sarg1 = [NSString stringWithUTF8String:arg1];
    }
    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }
    NSNumber *sarg3 = [NSNumber numberWithInt:arg3];


    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, (NSString *) sarg1, (NSString *) sarg2, (NSNumber *) sarg3);
        });
    }
}

void VcxWrapperCommonNumberStringCallback(vcx_command_handle_t xcommand_handle,
                                          vcx_error_t err,
                                          vcx_command_handle_t handle,
                                          const char *const arg2
                                          ) {
    id block = [[VcxCallbacks sharedInstance] commandCompletionFor:xcommand_handle];
    [[VcxCallbacks sharedInstance] deleteCommandHandleFor:xcommand_handle];

    void (^completion)(NSError *, vcx_command_handle_t arg1, NSString *arg2) = (void (^)(NSError *, vcx_command_handle_t arg1, NSString *arg2)) block;

    NSString *sarg2 = nil;
    if (arg2) {
        sarg2 = [NSString stringWithUTF8String:arg2];
    }

    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = [NSError errorFromVcxError:err];
            completion(error, handle, (NSString *) sarg2);
        });
    }
}


@implementation ConnectMeVcx

- (void)initWithConfig:(NSString *)config
            completion:(void (^)(NSError *error))completion
{
    const char *config_char = [config cString];
    vcx_command_handle_t handle= [[VcxCallbacks sharedInstance] createCommandHandleFor:completion] ;
    vcx_error_t ret = vcx_init_with_config(handle, config_char, VcxWrapperCommonCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"ERROR: initWithConfig: calling completion");
            completion([NSError errorFromVcxError: ret]);
        });
    }

}

- (void)agentProvisionAsync:(NSString *)config
               completion:(void (^)(NSError *error, NSString *config))completion
{
    const char *config_char = [config cString];
    vcx_command_handle_t handle= [[VcxCallbacks sharedInstance] createCommandHandleFor:completion] ;
    vcx_error_t ret = vcx_agent_provision_async(handle, config_char, VcxWrapperCommonStringCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"ERROR: agentProvision: calling completion");
            completion([NSError errorFromVcxError: ret], false);
        });
    }

}

- (void)connectionCreateWithInvite:(NSString *)invitationId
                inviteDetails:(NSString *)inviteDetails
             completion:(void (^)(NSError *error, NSInteger connectionHandle)) completion
{
   vcx_error_t ret;

   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char *invitationId_char = [invitationId cString];
   const char *inviteDetails_char = [inviteDetails cString];
   ret = vcx_connection_create_with_invite(handle, invitationId_char, inviteDetails_char, VcxWrapperCommonHandleCallback);
   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
   }
}

- (void)connectionConnect: (NSInteger) connectionHandle
        connectionType: (NSString *) connectionType
            completion: (void (^)(NSError *error, NSString *inviteDetails)) completion
{
   vcx_error_t ret;

   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char *connectionType_char = [connectionType cString];
    ret = vcx_connection_connect(handle, connectionHandle, connectionType_char, VcxWrapperCommonStringCallback);
   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
   }
}

- (void)connectionSerialize:(NSInteger)connectionHandle
                  completion:(void (^)(NSError *error, NSString *serializedConnection))completion{
    vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_connection_serialize(handle, connectionHandle, VcxWrapperCommonStringCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret],nil);
       });
   }
}

- (void)connectionDeserialize:(NSString *)serializedConnection
                    completion:(void (^)(NSError *error, NSInteger connectionHandle))completion{
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *serialized_connection=[serializedConnection cString];
    ret = vcx_connection_deserialize(handle, serialized_connection, VcxWrapperCommonHandleCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret],0);
       });
   }
}

- (void)deleteConnection:(VcxHandle)connectionHandle
          withCompletion:(void (^)(NSError *error))completion
{
    vcx_command_handle_t handle= [[VcxCallbacks sharedInstance] createCommandHandleFor:completion] ;
    vcx_error_t ret = vcx_connection_delete_connection(handle, connectionHandle, VcxWrapperCommonCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"deleteConnection: calling completion");
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void)connectionSignData:(VcxHandle)connectionHandle
                   data:(NSData *)data
                completion:(void (^)(NSError *, NSData *signature))completion
{
    vcx_error_t ret;
    
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    uint8_t *data_raw = (uint8_t *) [data bytes];
    uint32_t data_length = (uint32_t) [data length];
    
    ret = vcx_connection_sign_data(handle, connectionHandle, data_raw, data_length, VcxWrapperCommonDataCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0);
        });
    }
}

- (void)connectionVerifySignature:(VcxHandle)connectionHandle
                             data:(NSData *)data
                        signature:(NSData *)signature
                       completion:(void (^)(NSError *, BOOL *valid))completion
{
    vcx_error_t ret;
    
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    uint8_t *data_raw = (uint8_t *) [data bytes];
    uint32_t data_length = (uint32_t) [data length];
    uint8_t *signature_raw = (uint8_t *) [signature bytes];
    uint32_t signature_length = (uint32_t) [signature length];
    
    ret = vcx_connection_verify_signature(handle, connectionHandle, data_raw, data_length, signature_raw, signature_length, VcxWrapperCommonBoolCallback);
    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0);
        });
    }
}


- (void)agentUpdateInfo: (NSString *) config
            completion: (void (^)(NSError *error)) completion
{
   vcx_error_t ret;

   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char *config_char = [config cString];
    ret = vcx_agent_update_info(handle, config_char, VcxWrapperCommonCallback);
   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
   }
}

- (void)getCredential:(NSInteger)credentialHandle
           completion:(void (^)(NSError *error, NSString *credential))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_get_credential(handle, credentialHandle, VcxWrapperCommonStringCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
    }
}

- (void)credentialCreateWithOffer:(NSString *)sourceId
            offer:(NSString *)credentialOffer
           completion:(void (^)(NSError *error, NSInteger credentialHandle))completion{
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * credential_offer=[credentialOffer cString];
   const char * source_id = [sourceId cString];
    ret = vcx_credential_create_with_offer(handle, source_id,credential_offer, VcxWrapperCommonNumberCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
   }
}

- (void)credentialCreateWithMsgid:(NSString *)sourceId
                 connectionHandle:(VcxHandle)connectionHandle
                            msgId:(NSString *)msgId
                       completion:(void (^)(NSError *error, NSInteger credentialHandle, NSString *credentialOffer))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char * source_id = [sourceId cString];
    const char * msg_id=[msgId cString];
    ret = vcx_credential_create_with_msgid(handle, source_id, connectionHandle, msg_id, VcxWrapperCommonNumberStringCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0, nil);
       });
    }
}

- (void)credentialSendRequest:(NSInteger)credentialHandle
             connectionHandle:(VcxHandle)connectionHandle
                paymentHandle:(vcx_payment_handle_t)paymentHandle
                   completion:(void (^)(NSError *))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_credential_send_request(handle, credentialHandle, connectionHandle, paymentHandle, VcxWrapperCommonCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
    }
}
- (void)credentialGetState:(NSInteger)credentialHandle
                completion:(void (^)(NSError *error, NSInteger state))completion{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_credential_get_state(handle, credentialHandle, VcxWrapperCommonNumberCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
    }
}

- (void)credentialUpdateState:(NSInteger)credentialHandle
                   completion:(void (^)(NSError *error, NSInteger state))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_credential_update_state(handle, credentialHandle, VcxWrapperCommonNumberCallback);

    if( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
    }
}

- (void)credentialGetOffers:(VcxHandle)connectionHandle
                   completion:(void (^)(NSError *error, NSString *offers))completion{
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_credential_get_offers(handle,connectionHandle, VcxWrapperCommonStringCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret],nil);
       });
   }
}
- (void)generateProof:(NSString *)proofRequestId
       requestedAttrs:(NSString *)requestedAttrs
  requestedPredicates:(NSString *)requestedPredicates
            proofName:(NSString *)proofName
           completion:(void (^)(NSError *error, NSString *proofHandle))completion;
{
    vcx_error_t ret;

    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *proofRequestId_char = [proofRequestId cString];
    const char *requestedAttrs_char = [requestedAttrs cString];
    const char *requestedPredicates_char = [requestedPredicates cString];
    const char *proofName_char = [proofName cString];
    ret = vcx_proof_create(handle, proofRequestId_char, requestedAttrs_char, requestedPredicates_char, proofName_char, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
    }
}

- (void)credentialSerialize:(NSInteger)credentialHandle
                  completion:(void (^)(NSError *error, NSString *state))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_credential_serialize(handle, credentialHandle, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
    }
}

- (void)credentialDeserialize:(NSString *)serializedCredential
                    completion:(void (^)(NSError *error, NSInteger credentialHandle))completion{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *serialized_credential = [serializedCredential cString];
    ret = vcx_credential_deserialize(handle, serialized_credential, VcxWrapperCommonNumberCallback);

    if ( ret != 0 )
    {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
    }
}

- (void)exportWallet:(NSString *)exportPath
            encryptWith:(NSString *)encryptionKey
           completion:(void (^)(NSError *error, NSInteger exportHandle))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * export_path=[exportPath cString];
   const char * encryption_key = [encryptionKey cString];
    ret = vcx_wallet_export(handle, export_path, encryption_key, VcxWrapperCommonCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], 0);
       });
   }
}

- (void)importWallet:(NSString *)config
           completion:(void (^)(NSError *error))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_wallet_import(handle, [config cString], VcxWrapperCommonCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
   }
}

- (void)addRecordWallet:(NSString *)recordType
               recordId:(NSString *)recordId
            recordValue:(NSString *) recordValue
             completion:(void (^)(NSError *error))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * record_type =[recordType cString];
   const char * record_id = [recordId cString];
   const char * record_value =[recordValue cString];
   const char * record_tag = "{}";
    ret = vcx_wallet_add_record(handle, record_type, record_id, record_value, record_tag, VcxWrapperCommonCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
   }
}

- (void)getRecordWallet:(NSString *)recordType
            recordId:(NSString *)recordId
             completion:(void (^)(NSError *error, NSString* walletValue))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * record_type =[recordType cString];
   const char * record_id = [recordId cString];
   const char * record_tag = "{}";
    ret = vcx_wallet_get_record(handle, record_type, record_id, record_tag, VcxWrapperCommonStringCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret], nil);
       });
   }
}

- (int)vcxShutdown:(BOOL *) deleteWallet {
    int delete_wallet = deleteWallet;
    return vcx_shutdown(delete_wallet);
}

- (void)deleteRecordWallet:(NSString *)recordType
            recordId:(NSString *)recordId
           completion:(void (^)(NSError *error))completion {
   vcx_error_t ret;
   vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
   const char * record_type =[recordType cString];
   const char * record_id = [recordId cString];
   ret = vcx_wallet_delete_record(handle, record_type, record_id, VcxWrapperCommonCallback);

   if( ret != 0 )
   {
       [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

       dispatch_async(dispatch_get_main_queue(), ^{
           completion([NSError errorFromVcxError: ret]);
       });
   }
}

- (void)updateRecordWallet:(NSString *)recordType
              withRecordId:(NSString *)recordId
           withRecordValue:(NSString *) recordValue
            withCompletion:(void (^)(NSError *error))completion {

    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char * record_type =[recordType cString];
    const char * record_id = [recordId cString];
    const char * record_value =[recordValue cString];

    ret = vcx_wallet_update_record_value(handle, record_type, record_id, record_value, VcxWrapperCommonCallback);

    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void) proofCreateWithMsgId:(NSString *)sourceId
         withConnectionHandle:(vcx_connection_handle_t)connectionHandle
                    withMsgId:(NSString *)msgId
               withCompletion:(void (^)(NSError *error, vcx_proof_handle_t proofHandle, NSString *proofRequest))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *source_id = [sourceId cStringUsingEncoding:NSUTF8StringEncoding];
    const char *msg_id = [msgId cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_disclosed_proof_create_with_msgid(handle, source_id, connectionHandle, msg_id, VcxWrapperCommonNumberStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0, nil);
        });
    }
}

- (void) proofRetrieveCredentials:(vcx_proof_handle_t)proofHandle
                   withCompletion:(void (^)(NSError *error, NSString *matchingCredentials))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_disclosed_proof_retrieve_credentials(handle, proofHandle, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void) proofGenerate:(vcx_proof_handle_t)proofHandle
withSelectedCredentials:(NSString *)selectedCredentials
 withSelfAttestedAttrs:(NSString *)selfAttestedAttributes
        withCompletion:(void (^)(NSError *error))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *selected_credentials = [selectedCredentials cStringUsingEncoding:NSUTF8StringEncoding];
    const char *self_attested_attributes = [selfAttestedAttributes cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_disclosed_proof_generate_proof(handle, proofHandle, selected_credentials, self_attested_attributes, VcxWrapperCommonCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void) proofSend:(vcx_proof_handle_t)proof_handle
withConnectionHandle:(vcx_connection_handle_t)connection_handle
    withCompletion:(void (^)(NSError *error))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_disclosed_proof_send_proof(handle, proof_handle, connection_handle, VcxWrapperCommonCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void) proofCreateWithRequest:(NSString *) source_id
               withProofRequest:(NSString *) proofRequest
                 withCompletion:(void (^)(NSError *error, vcx_proof_handle_t proofHandle))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *sourceId = [source_id cStringUsingEncoding:NSUTF8StringEncoding];
    const char *proof_request = [proofRequest cStringUsingEncoding:NSUTF8StringEncoding];
    ret = vcx_disclosed_proof_create_with_request(handle, sourceId, proof_request, VcxWrapperCommonNumberCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0);
        });
    }
}

- (void) proofSerialize:(vcx_proof_handle_t) proofHandle
         withCompletion:(void (^)(NSError *error, NSString *proof_request))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_disclosed_proof_serialize(handle, proofHandle, VcxWrapperCommonStringCallback);

    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void) proofDeserialize:(NSString *) serializedProof
           withCompletion:(void (^)(NSError *error, vcx_proof_handle_t proofHandle)) completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char *serialized_proof = [serializedProof cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_disclosed_proof_deserialize(handle, serialized_proof, VcxWrapperCommonNumberCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], 0);
        });
    }
}


- (void)createPaymentAddress:(NSString *)seed
              withCompletion:(void (^)(NSError *error, NSString *address))completion {
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    const char *c_seed = [seed cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_wallet_create_payment_address(handle, c_seed, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void)getTokenInfo:(vcx_payment_handle_t)payment_handle
      withCompletion:(void (^)(NSError *error, NSString *tokenInfo))completion
{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    ret = vcx_wallet_get_token_info(handle, payment_handle, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void)sendTokens:(vcx_payment_handle_t)payment_handle
        withTokens:(NSString *)tokens
     withRecipient:(NSString *)recipient
    withCompletion:(void (^)(NSError *error, NSString *recipient))completion
{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];

    const char* c_recipient = [recipient cStringUsingEncoding:NSUTF8StringEncoding];
    const char* c_tokens = [tokens cStringUsingEncoding:NSUTF8StringEncoding];

    ret = vcx_wallet_send_tokens(handle, payment_handle, c_tokens, c_recipient, VcxWrapperCommonStringCallback);

    if ( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void)downloadMessages:(NSString *)messageStatus
                    uid_s:(NSString *)uid_s
                  pwdids:(NSString *)pwdids
              completion:(void (^)(NSError *error, NSString* messages))completion{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char * message_status = [messageStatus cString];
    const char * uids = [uid_s cString];
    const char * pw_dids = [pwdids cString];
    ret = vcx_messages_download(handle, message_status, uids, pw_dids, VcxWrapperCommonStringCallback);

    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

- (void)updateMessages:(NSString *)messageStatus
                 pwdidsJson:(NSString *)pwdidsJson
              completion:(void (^)(NSError *error))completion{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    const char * message_status = [messageStatus cString];
    const char * msg_json = [pwdidsJson cString];
    ret = vcx_messages_update_status(handle, message_status, msg_json, VcxWrapperCommonCallback);

    if( ret != 0 )
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];

        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret]);
        });
    }
}

- (void) getLedgerFees:(void(^)(NSError *error, NSString *fees)) completion
{
    vcx_error_t ret;
    vcx_command_handle_t handle = [[VcxCallbacks sharedInstance] createCommandHandleFor:completion];
    ret = vcx_ledger_get_fees(handle, VcxWrapperCommonStringCallback);
    
    if (ret != 0)
    {
        [[VcxCallbacks sharedInstance] deleteCommandHandleFor: handle];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([NSError errorFromVcxError: ret], nil);
        });
    }
}

@end
