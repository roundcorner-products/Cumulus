/*
    Copyright (c) 2014 Salesforce.com Foundation
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
    
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Salesforce.com Foundation nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
 
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN 
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
    POSSIBILITY OF SUCH DAMAGE.
*/
/**
* @author Salesforce.com Foundation
* @date 2014 
* @description test Class which holds test methods for common utilities, 
* such as detecting whether we are in a managed package, and some string helpers.
*/
@isTest
public with sharing class UTIL_Namespace_TEST {

    static testmethod void TestNamespacePrefixFixups() {
        if (UTIL_Namespace.InManagedPackage) {
            system.assertEquals('npsp__foo', UTIL_Namespace.StrTokenNSPrefix('foo'));
            system.assertEquals('npsp__foo__c', UTIL_Namespace.StrTokenNSPrefix('foo__c'));     
            system.assertEquals('foo', UTIL_Namespace.StrAllNSPrefix('foo'));
            system.assertEquals('npsp__foo__c', UTIL_Namespace.StrAllNSPrefix('foo__c'));
            system.assertEquals('npsp__foo_bar_baz__c', UTIL_Namespace.StrAllNSPrefix('foo_bar_baz__c'));
            system.assertEquals('select npsp__foo__c, bar, npsp__baz1__c, npsp__biz_buz__c from Contact', UTIL_Namespace.StrAllNSPrefix('select foo__c, bar, baz1__c, biz_buz__c from Contact'));
        } else {
            system.assertEquals('foo', UTIL_Namespace.StrTokenNSPrefix('foo'));
            system.assertEquals('foo__c', UTIL_Namespace.StrTokenNSPrefix('foo__c'));     
            system.assertEquals('foo', UTIL_Namespace.StrAllNSPrefix('foo'));
            system.assertEquals('foo__c', UTIL_Namespace.StrAllNSPrefix('foo__c'));
            system.assertEquals('foo_bar_baz__c', UTIL_Namespace.StrAllNSPrefix('foo_bar_baz__c'));
            system.assertEquals('select foo__c, bar, baz1__c, biz_buz__c from Contact', UTIL_Namespace.StrAllNSPrefix('select foo__c, bar, baz1__c, biz_buz__c from Contact'));           
        }       
    }               

}