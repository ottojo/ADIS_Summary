# Progressive Web Applications

Principles of PWAs:

* discoverable: indexable by search engines
* installable: integrates with platform app-launcher/homescreen/whatever
* linkable: sharing via URI
* network independent: PWA can work offline or with limited connectivity
* progressive: basic feature set for old browser, extended features for new browsers
  * graceful degradation: mitigation techniques for missing features
  * shims, polyfills: re-implementation of modern web APIs for browsers without native support in plain JS
  * progressive enhancements: opposite of graceful degradation: upgrade basic functionality if available
  * transpilation of modern JS to version compatible with older browser version
* re-engageable: can send notifications to users
* responsive: adapts to device and screen size
* safe: secure communication, protection of sensitive data

Implementing PWAs:

* secure contexts
  * browser allows access to sensitive APIs only if requirements fulfilled
  * requirements might be e.g. a secure connection
* web app manifests
  * declares information about web app such as
    * homescreen icons
    * appearance options such as full-screen mode
    * screen orientation
    * system colors
  * referenced by link from HTML header
* service workers
  * proxy between application and network
  * implements:
    * offline support
    * cache control
    * pre-fetching resources
    * background tasks such as data sync, push notifications
  * fully asynchronous
  * only available in secure context
