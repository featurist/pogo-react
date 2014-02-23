# pogo-react

A little DSL for writing [react.js](http://facebook.github.io/react/) components as [PogoScript](http://pogoscript.org) CommonJS modules, instead of using [JSX](http://facebook.github.io/react/docs/jsx-in-depth.html)

## Usage

Start with a module looking like this:

    module.exports = component {
        render () =
            div (
                p { id = 'para' } "First paragraph"
                p { class = 'zomg' } "Second paragraph"
            )
    }

...compile it to JavaScript like this:

    require('pogo-react').compile! ("./component.pogo", "./component.js")

...then use it from React like this:

    React.renderComponent(require('component.js'), document.body)

## License

BSD
