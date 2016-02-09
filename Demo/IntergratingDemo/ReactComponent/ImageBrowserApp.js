'use strict';

var React = require('react-native');
var {
  View,
  Image,
  Text
  } = React;

var styles = React.StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'blue'
  }
});

class ImageBrowserApp extends React.Component {
//  renderImage: function(imgURI) {
//  return (
//    <Image source={{uri: imgURI}} />
//  );
//},

  render() {
    return (
      //<View>
      //  {this.props.images.map(this.renderImage)}
      //</View>
      <View style={styles.container}>
        <Text>{this.props.images}</Text>
      </View>
    );
  }

  componentWillMount() {
    console.log("componentWillMount" + this.props);
  }

  componentWillReceiveProps() {
    console.log("componentWillReceiveProps" + this.props);
  }

  componentWillUpdateProps() {
    console.log("componentWillUpdateProps" + this.props);
  }
}

React.AppRegistry.registerComponent('ImageBrowserApp', () => ImageBrowserApp);


