(function (_dsl) {
    (function () {
        var self = this;
        var TodoList, TodoApp;
        TodoList = _dsl.component({
            render: function () {
                var self = this;
                var createItem;
                createItem = function (itemText) {
                    return _dsl.li(itemText);
                };
                return _dsl.ul(this.props.items.map(createItem));
            }
        });
        TodoApp = _dsl.component({
            getInitialState: function () {
                var self = this;
                return {
                    items: [],
                    text: ''
                };
            },
            onChange: function (e) {
                var self = this;
                return this.setState({ text: e.target.value });
            },
            handleSubmit: function (e) {
                var self = this;
                var nextItems, nextText;
                e.preventDefault();
                nextItems = this.state.items.concat([this.state.text]);
                nextText = '';
                return this.setState({
                    items: nextItems,
                    text: nextText
                });
            },
            render: function () {
                var self = this;
                var onSubmit;
                return _dsl.div(_dsl.h3('TODO'), TodoList({ items: this.state.items }), _dsl.form(onSubmit = this.handleSubmit, _dsl.input({
                    onChange: this.onChange,
                    value: this.state.text
                }), _dsl.button('Add #' + (this.state.items.length + 1))));
            }
        });
        module.exports = TodoApp;
    }.call(this));
})(require('../../src/pogo_react'))