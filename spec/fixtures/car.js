(function() {
  /** @jsx React.DOM */;
  var Car, React;

  React = require('react');

  Car = React.createClass({displayName: "Car",
    render: function() {
      return React.createElement(Car, {
        "doors": 4.,
        "safety": getSafetyRating() * 2,
        "data-top-down": "yep",
        "checked": true
      }, React.createElement(FrontSeat, null), React.createElement(BackSeat, null), React.createElement("p", null, "Which seat can I take? ", this.props.seat));
    }
  });

  React.renderComponent(React.createElement(Car, {
    "seat": "front, obvs"
  }), document.getElementById('container'));

}).call(this);
