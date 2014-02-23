module.exports = component {

    get initial state () =
        { seconds elapsed = 0 }

    tick () =
        this.set state { seconds elapsed = this.state.seconds elapsed + 1 }

    component did mount () =
        this.interval = set interval (this.tick, 1000)

    component will unmount () =
        clear interval (this.interval)

    render () =
        div "Seconds Elapsed: #(this.state.seconds elapsed)"

}