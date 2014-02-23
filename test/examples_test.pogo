React = require 'react'
Pogo React = require '../src/pogo_react'
domino = require 'domino'
fs = require 'fs'

describe 'examples'

    it 'includes a stateful component'
        window = render 'stateful_component' with {} !
        divs = window.document.query selector all 'div'
        divs.length.should.equal 1
        divs.0.innerHTML.should.equal 'Seconds Elapsed: 0'

    it 'includes a whole application'
        window = render 'application' with {} !
        buttons = window.document.query selector all 'button'
        buttons.length.should.equal 1
        buttons.0.innerHTML.should.equal 'Add #1'


replace (text) in (file) with (replacement) =
    fs.write file sync (
        file
        fs.read file sync (file, 'utf-8').replace (text, replacement)
    )

render (component) to window (callback) =
    React.render component to string (component) @(html)
        callback (null, domino.create window (html))

render (name) with (locals) ! =
    file = "#(__dirname)/../examples/pogo/#(name).pogo"
    compiled file = file.replace('.pogo', '.js')
    Pogo React.compile! (file, compiled file)
    replace 'pogo-react' in (compiled file) with '../../src/pogo_react'
    Component = require (compiled file)
    render (Component (locals)) to window!
