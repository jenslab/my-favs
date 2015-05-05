<h1><a href="https://my-favs.herokuapp.com/">My Favs</a>: Social Bookmarking with Email Integration</h1>

<h2>Purpose</h2> 

Build an application that allow a user to bookmark URLs via email, peruse other user's bookmarks and maintain a personal index of categorized bookmarks.

<h2>Use case</h2>

It's easy enough to bookmark a URL in your browser, but eventually your bookmark library may get cluttered and it may require effort to manage bookmarks. We'd also like the ability to share bookmarks with friends, which is not something we can do easily from our native browser.My Favs will solve these problems by organizing bookmarks by topic and making them public so that other users can find them and add bookmarks to their own My Favs profile.

<h2>User Stories</h2>

The project's user stories are:

<ol>
<li>As a user, I want to sign up for a free account by providing a user name, password and email.</li> 
<li>As a user, I want to sign in and out of My Favs.</li> 
<li>As a user, I want to email a URL to My Favs and have it saved in the My Favs database.</li> 
<li>As a user, I want to see an index of all topics and their bookmarks.</li> 
<li>As a user, I want to create/read/update/delete bookmarks.</li> 
<li>As a user, I want to be the only one allowed to delete and update my bookmarks.</li> 
<li>As a user, I want to "like and unlike" bookmarks created by other users.</li> 
<li>As a user, I want to see a list of bookmarks on my personal profile that I've added or liked.</li>
</ol>

<h2>Gems used</h2>
<ul>
<li>gem 'bootstrap-sass'</li>
<li>gem 'devise'</li>
<li>gem 'figaro', '1.0'</li>
<li>gem 'faker'</li>
<li>gem 'pundit'</li>
<li>gem 'will_paginate', '~> 3.0.5'</li>
</ul>