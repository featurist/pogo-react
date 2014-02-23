(function (_dsl) {
    (function () {
        var self = this;
        module.exports = _dsl.component({
            getInitialState: function () {
                var self = this;
                return { secondsElapsed: 0 };
            },
            tick: function () {
                var self = this;
                return this.setState({ secondsElapsed: this.state.secondsElapsed + 1 });
            },
            componentDidMount: function () {
                var self = this;
                return this.interval = _dsl.setInterval(this.tick, 1000);
            },
            componentWillUnmount: function () {
                var self = this;
                return _dsl.clearInterval(this.interval);
            },
            render: function () {
                var self = this;
                return _dsl.div('Seconds Elapsed: ' + this.state.secondsElapsed);
            }
        });
    }.call(this));
})(require('../../src/pogo_react'))