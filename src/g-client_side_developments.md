# Client-side Developments
The desire for more dynamic user interfaces in the web go beyond static HTML pages
delivered from the server, and interactions consisting mainly of navigating to
different pages.
This requires computation on the client-side, which is possible using javascript.
Today, the client-side of a web page consist of multiple elements of

* HTML, defining the content and structure of the page
* CSS, providing styling and display information
* JavaScript, providing interaction and defining the dynamic behavior

The JS execution model of a browser consists of an event loop processing callbacks.
Inside the callbacks, the JS code has access to multiple APIs, such as for reading
and modifying the DOM, setting timers or making (AJAX) requests.
