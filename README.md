# meteor-template-breakpoints
Reactive template media breakpoints.

Package provides `Template.mediaQueryBreakpoints` reactive variable which 
contains hash `{ screensize: breakpoint }`. `breakpoint` is minimum value for
a given screensize.
Defaults to [Foundation breakpoints](https://github.com/zurb/foundation-apps/blob/master/scss/helpers/_breakpoints.scss#L18-L24).

```javascript
  {
    small: 0, 
    medium: 640, 
    large: 1200, 
    xlarge: 1440, 
    xxlarge: 1920
  }
```

Set your own breakpoints (must be inside `Meteor.startup` callback):

```javascript
  Meteor.startup(function(){
    // Bootstrap breakpoints
    Template.mediaQueryBreakpoints.set({
      xs: 0,
      sm: 480,
      md: 768,
      lg: 992,
      xl: 1200
    })
  })
```

### Install

`meteor add sunstory:meteor-template-breakpoints`

### Use

`screensize` Template helper:

```handlebars
  {{#if screensize 'small'}}
    <p>If screensize less then 640px...</p>
  {{else}}
    <p>Otherwise...</p>
  {{/if}}
```

`screensize` `Session` variable:

```javascript
  if (Session.equals('screensize', 'xlarge')){
    ...
  } else {
    ...
  }
```
