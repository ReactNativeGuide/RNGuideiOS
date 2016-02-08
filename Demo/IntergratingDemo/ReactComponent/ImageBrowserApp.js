'use strict';

var React = require('react-native');
var {
  View,
  Image
  } = React;

class ImageBrowserApp extends React.Component {
//  renderImage: function(imgURI) {
//  return (
//    <Image source={{uri: imgURI}} />
//  );
//},

  render() {
    return (
      <View>
        {this.props.images.map(this.renderImage)}
      </View>
    );
  }
}

React.AppRegistry.registerComponent('ImageBrowserApp', () => ImageBrowserApp);


//componentWillMount() {
//  console.log("componentWillMount" + this.props);
//}
//
//componentWillReceiveProps() {
//  console.log("componentWillReceiveProps" + this.props);
//}
//
//componentWillUpdateProps() {
//  console.log("componentWillUpdateProps" + this.props);
//}