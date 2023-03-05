# Session Management

Sessions provide state beyond individual HTTP requests.
Example uses are multi-step forms, login status or shopping carts.

This requires the server to identify subsequent requests belonging to the same user/session.
A session is the list of consecutive actions of an individual user.
This is usually implemented by labeling the requests, that label is called *Session ID* or
*Session Token*.
The ID is generated on the server side, and has to be unique and un-guessable (to prevent session
hijacking).
It is transmitted to the client in the first response, which then includes it in subsequent
requests. This allows the server to relate it to the session.

Sessions may end, either explicitly (discarding the session ID on server or client) or by timeout.

## URL Session Identifiers
Also called *URL rewriting*, this is a technique for handling session IDs.
It works by embedding the ID in the URL, which requires the server to rewrite
all hyperlinks in the response to include the ID.

Advantages:

* No client support needed
* No additional headers required
* No cookies required

Disadvantages:

* Security risk: Session ID easily exposed by sharing or logging an URL
* Correct rewriting might be difficult

## Cookies
Cookies are small chunks of data (KV pairs) related to one domain, which the client includes
for every request to the same domain.
Cookies provide a more secure way to attach IDs to session.

The server provides the cookies using `Set-Cookie` headers, which include the
session ID.

The client receives the cookie, saves it and sends it back to the server in subsequent
requests using the `Cookie` header.

## Session State
Once the server has the possibility to relate requests to sessions, session state can be
stored.
This session state can be arbitrary, and would usually stored in a database indexed by
the session ID.

In principle, the entire state could be stored in a cookie, which eliminates the need
for server-side storage but has several drawbacks such as limited size and the possibility
for the client to modify the state in unexpected ways.

## Securtity
There are multiple security considerations regarding sessions, in particular Leaking the ID,
which can lead to session hijacking and thus impersonating the user
