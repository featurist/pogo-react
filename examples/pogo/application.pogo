Todo List = component {
    render () =
        create item (item text) =
            li (item text)

        ul (this.props.items.map (create item))
}

Todo App = component {

    get initial state () =
        { items = [], text = '' }

    on change (e) =
        this.set state { text = e.target.value }

    handle submit (e) =
        e.prevent default ()
        next items = this.state.items.concat [this.state.text]
        next text = ''
        this.set state { items = next items, text = next text }

    render () =
        div (
            h3 'TODO'
            Todo List { items = this.state.items }
            form (on submit = this.handle submit) (
                input (on change: this.on change, value: this.state.text)
                button "Add ##(this.state.items.length + 1)"
            )
        )

}

module.exports = Todo App
