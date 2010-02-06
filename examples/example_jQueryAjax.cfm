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
<cfapplication name="SweetTweetsCFC-ExamplejQueryAjax"
		applicationTimeout="#CreateTimeSpan(0,0,30,0)#"
		clientManagement="false"
		sessionManagement="false">

<!--- this is the un-shortened url of the page you're looking for tweetbacks to --->
<cfset variables.uri = 'http://fusiongrokker.com/post/sweettweets-a-plugin-for-anything-including-mango'/>

<!--- maximum number of tweets to show initially --->
<cfset variables.limit = 5 />

<!--- URL to get Tweetback data. You may need to change the path to SweetTweets.cfc, but shouldn't have to change anything else... --->
<cfset variables.ajaxURI = "SweetTweets.cfc?method=getTweetbacksHTML&limit=#variables.limit#&returnFormat=plain&uri=#urlEncodedFormat(variables.uri)#"/>

<!--- include the jQuery library :) --->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js"></script>

<!-- jQuery code to do the refreshing -->
<script type="text/javascript">
	$(document).ready(function(){
		$.get('<cfoutput>#variables.ajaxURI#</cfoutput>',{},function(data){
			//if data is returned in a WDDX packet (as it will be if the server is CF7), clean it up
			if (data.indexOf('<wddxPacket') > -1){
				data = data.replace("<wddxPacket version='1.0'><header/><data><string>", "");
				data = data.replace("</string></data></wddxPacket>", "");
				data = data.replace(/&gt\;/gi, ">");
				data = data.replace(/&lt\;/gi, "<");
			}
			$("#jQtweetbacks").html(data);
		});
	});
</script>

<!--- div that will hold our ajax content --->
<div id="jQtweetbacks">Loading Tweetbacks...</div>
