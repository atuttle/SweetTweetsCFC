<!---
LICENSE INFORMATION:

Copyright 2008, Adam Tuttle
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not 
use this file except in compliance with the License. 

You may obtain a copy of the License at 

	http://www.apache.org/licenses/LICENSE-2.0 
	
Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
CONDITIONS OF ANY KIND, either express or implied. See the License for the 
specific language governing permissions and limitations under the License.

VERSION INFORMATION:

This file is part of SweetTweetsCFC.
http://sweettweetscfc.riaforge.org/
--->
<cfapplication name="SweetTweetsCFC-ExampleCF8Ajax"
		applicationTimeout="#CreateTimeSpan(0,0,30,0)#"
		clientManagement="false"
		sessionManagement="false">

If you're running ColdFusion 8 or later, you will see a sweet ajax implementation here:

<!--- make sure you're *really* running CF8 --->
<cfif structKeyExists(server, "coldfusion")
		and structKeyExists(server.coldfusion, "productversion")
		and left(server.coldfusion.productversion, 1) gte "8">

	<!--- The un-shortened url of the page you're looking for tweetbacks to --->
	<cfset variables.uri = 'http://fusiongrokker.com/post/sweettweets-a-plugin-for-anything-including-mango'/>

	<!--- maximum number of tweets to show initially --->
	<cfset variables.limit = 5 />

	<!--- now show the short list that can grow to be the long list! --->
	<cfdiv id="cf8tweetbacks" 
		bind="url:SweetTweets.cfc?method=getTweetbacksHTML&limit=#variables.limit#&returnFormat=plain&uri=#urlEncodedFormat(variables.uri)#"></cfdiv>

</cfif>