# RIA and SPA
## Thin vs. Thick Clients

In thin-client applications, the browser only handles inputs and renders
responses from the server.
Interactions between client and server are HTTP requests.

Thick-client applications move some business logic to the client side.
This typically allows for improvements in user experience.
Some actions are executed locally without server interaction.
Other interactions with the server might be application specific,
once the client application is loaded.

## Rich Internet Applications (RIA)

Basic idea: Resemble user experience of local desktop application.
This requires running some logic on the client side.
An extreme example would be a client side game engine running in the
browser.
RIAs allow platform independence, which might be an advantage compared
to native applications.

Examples of RIAs:

* Google Docs
* Web mail clients
* Flash games

Frameworks are available for both client- and server-side programming.

Today, RIA are "rich web applications", using native web technologies
such as HTML(5), CSS and JS.

## Single Page Applications (SPA)

SPAs are thick clients, using current web technologies (HTML5, CSS3)
and modern web APIs using JS.
The page is loaded only once, and the application dynamically modifies
the current page based on user input, instead of loading new pages.
Interaction with the server is done in the background.

Technologies used:

* Communication
  * Regular HTTP request for initial load
  * AJAX/fetch, server-push or WS for later communication
* Data formats
  * JSON and XML for structured data
  * Alternative: pre-generated HTML from the server

Challenges include:

* Slow initial loading time
* Programmatic access e.g. for search engines
* Handling of application state vs page location
* Partitioning of logic between client and server
