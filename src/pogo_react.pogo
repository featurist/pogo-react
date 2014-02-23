fs = require 'fs'
dslify = require 'dslify'
pogo = require 'pogo'
React = require 'react'

Pogo React = {

    compile! (file, output path) =
        component pogo = fs.read file! (file, 'utf-8')
        component js = pogo.compile (component pogo)
        output js = dslify.transform module (component js, 'pogo-react')
        fs.write file! (output path, output js)
        output js

    component (definition) =
        React.create class (definition)

}

module.exports = Pogo React

tag (react dom method) =
    @{
        args = Array.prototype.slice.call(arguments)
        if (is not attributes (args.0))
            args := [null].concat (args)

        react dom method.apply(this, args)
    }

is not attributes (obj) =
    !(obj :: Object) || (obj._lifeCycleState)

for @(key) in (React.DOM)
    Pogo React.(key) = tag (React.DOM.(key))
