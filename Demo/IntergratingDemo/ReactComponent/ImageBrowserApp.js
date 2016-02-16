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
  },
  subContainer: {
    flex: 1,
    backgroundColor: 'green'
  }
});

class ImageBrowserApp extends React.Component {
//  renderImage: function(imgURI) {
//  return (
//    <Image source={{uri: imgURI}} />
//  );
//},

  testGestureHandleStartShouldSetResponder() {
    console.log("testGestureHandleStartShouldSetResponder");
    return true;
  }

  testGestureHandleMoveShouldSetResponder() {
    console.log("testGestureHandleMoveShouldSetResponder");
    return true;
  }

  testGestureHandleResponderGrant(e, dispatchID) {
    console.log("testGestureHandleResponderGrant" + " e:" + e + " dispatchID:" + dispatchID);
    // Since e is used in a callback invoked on another event loop
    // (as in setTimeout etc), we need to call e.persist() on the
    // event to make sure it doesn't get reused in the event object pool.
    e.persist();
  }

  testGestureHandleResponderReject() {
    console.log("testGestureHandleResponderReject");
  }

  testGestureHandleResponderMove(evt) {
    console.log("testGestureHandleResponderMove event: " + evt + " x: " + evt.locationX + " y:" + evt.locationY);
  }

  render() {
    return (
      //<View>
      //  {this.props.images.map(this.renderImage)}
      //</View>
      <View style={styles.container}>
        <Text>{this.props.images}</Text>

        <View style={styles.subContainer}
              onStartShouldSetResponder = {this.testGestureHandleStartShouldSetResponder}
              onMoveShouldSetResponder = {this.testGestureHandleMoveShouldSetResponder}
              onResponderGrant = {this.testGestureHandleResponderGrant}
              onResponderReject = {this.testGestureHandleResponderReject}
              onResponderMove = {this.testGestureHandleResponderMove}
        >
          <Text>Test Gesture</Text>
        </View>
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


