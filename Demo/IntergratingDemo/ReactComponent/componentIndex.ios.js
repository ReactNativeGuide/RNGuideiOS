'use strict';

var React = require('react-native');
var {
    Text,
    View
} = React;

var styles = React.StyleSheet.create({
                                     container: {
                                     flex: 1,
                                     backgroundColor: 'red'
                                     }
                                     });

class SimpleApp extends React.Component {
    render() {
        return (
                <View style={styles.container}>
                <Text>This is a simple application.</Text>
                </View>
                )
    }
}

React.AppRegistry.registerComponent('SimpleApp', () => SimpleApp);

// React-Native Module Example

var CalendarManager = require('react-native').NativeModules.CalendarManager;
CalendarManager.addEvent('Birthday Party', '4 Privet Drive, Surrey');
