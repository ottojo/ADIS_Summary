# Component-based Frameworks

This focuses on web component for the client side.

* Components are reusable view elements, which is desirable to
  avoid re-implementing features
* No standard way for re-using HTML blocks, templating

## Web Components Specification

* Standardized 2012

Building blocks:

* Custom Elements API: Custom DOM elements
  * associated JS class for behavior
  * callbacks for insertion, removal etc
* Shadow DOM: Scoped DOM, encapsulating style + markup
  * hides implementation of components
  * page styles not applied to shadow dom,
    shadow dom styles not applied on page level
* HTML Templates: Declare HTML fragments, instantiate at runtime
  * `<slot>` allows injection of instance specific data
* ES Modules: reuse of JS documents

## Component-based Application Frameworks

Those don't use the standard components directly, but implement
similar concepts.

* Angular
  * Declarative HTML templates
  * Typescript for defining components, which references HTML and CSS
  * 
* React
  * JSX templates: functional instead of declarative
  * components as state machines
  * no scoped styles
* Vue.js
  * Declarative HTML templates

Standard Components vs Frameworks:

* Component support is builtin to browsers
* Frameworks often more feature-rich
* Frameworks provide virtual DOM
* Some frameworks allow export to web components
