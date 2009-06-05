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
<cfapplication name="SweetTweetsCFC-SimpleExample-1"
		applicationTimeout="#CreateTimeSpan(0,0,30,0)#"
		clientManagement="false"
		sessionManagement="false">

<!--- the un-shortened url to get tweetbacks for --->
<cfset variables.uri = 'http://localhost/SweetTweetsCFC/example.cfm'/>

<!--- maximum number of tweets to display --->
<cfset variables.limit = 2 />

<!---	INSTANTIATION:
			passing `false` to init() stores the cache in the application scope.
			passing `true` to init()  [DEFAULT] stores the cache in the CFC variables scope; you are then responsible for persisting the CFC instance.
---> 
<cfset sweetTweets = createObject("component","SweetTweets").init(false)/>

<!--- <cfset application.sweettweetcache.tweetbacks = structNew() /> --->
<cfdump var="#application#">
<cfdump var="#sweetTweets.getShortUrls(variables.uri)#">

<!---	GENERATION:
			URL: The un-shortened URL to find tweetbacks for
			Limit: The maximum number of tweetbacks to display. Most recent tweetbacks displayed if limit is exceeded.
--->
<cfset tweetbacks = sweettweets.getTweetbacksHTML(variables.uri, variables.limit)/>

<!--- output --->
<cfoutput>#tweetbacks#</cfoutput>

<!---	OTHER NOTES:

You can also use chaining/shorthand, like so:
	<cfoutput>
		#createObject("component","SweetTweets").init().getTweetbacksHTML('http://fusiongrokker.com/post/log-viewer-plugin-for-mango-blog',2)#
	</cfoutput>

Resulting HTML (for your CSS styling needs):
		
	<div id="tweetbacks">
		<h3>2 Tweetbacks</h3>
		Showing 2 most recent - <a id="viewAllTweetbacks" href="[you specify]">View All Tweetbacks</a>
		<ul>
			<li style="clear:left;">
				<img src="person.jpg" align="left" vspace="2" hspace="4"/>
				<a href="http://twitter.com/person" style="background:none;"><strong>Person</strong></a>
				<span class="tweetback_tweet">Tweet text here</span>
				<span class="tweetback_timestamp"><a href="http://twitter.com/person/statuses/11111111111">Timestamp</a></span>
			</li>
			<li style="clear:left;">
				<img src="person.jpg" align="left" vspace="2" hspace="4"/>
				<a href="http://twitter.com/person" style="background:none;"><strong>Person</strong></a>
				<span class="tweetback_tweet">Tweet text here</span>
				<span class="tweetback_timestamp"><a href="http://twitter.com/person/statuses/11111111111">Timestamp</a></span>
			</li>
		</ul>
	</div>
--->
