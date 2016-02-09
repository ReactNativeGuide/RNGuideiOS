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

var { NativeAppEventEmitter } = require('react-native');

var subscription = NativeAppEventEmitter.addListener(
  'EventReminder',
  (reminder) => {
    console.log("notification arrived. in js ev");
    console.log(reminder.name)
  }
);

class SimpleApp extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>This is a simple application. \n try to flex width\n try to flex width try to flex width try to flex width try to flex width try to flex width try to flex width try to flex width try to flex width try to flex width try to flex width try to flex width try to flex width try to flex width </Text>
      </View>
    )
  }

  componentWillUnmount() {
    subscription.remove();
  }
}

React.AppRegistry.registerComponent('SimpleApp', () => SimpleApp);

// React-Native Module Example

var CalendarManager = require('react-native').NativeModules.CalendarManager;
var date = new Date();
//CalendarManager.addEvent('Birthday Party', '4 Privet Drive, Surrey');
//CalendarManager.addEvent('Birthday Party', '4 Privet Drive, Surrey', date.getTime()); // passing date as number of seconds since Unix epoch
//CalendarManager.addEvent('Birthday Party', '4 Privet Drive, Surrey', date.toISOString()); // passing date as ISO-8601 string

CalendarManager.addEvent('Birthday Party', {
  location: '4 Privet Drive, Surrey',
  time: date.getTime(),
  description: '...'
})

//CalendarManager.findEvents((error, events) => {
//  if (error) {
//    console.error(error);
//  } else {
//    console.log(events);
//  }
//})

async function updateEvents() {
  try {
    var events = await CalendarManager.findEvents();
    console.log(events);
  } catch (e) {
    console.error(e);
  }
}

updateEvents();

CalendarManager.doSomethingExpensive("input param", (error, results) => {
  console.log("error:" + error + " result:" + results);
});

console.log(CalendarManager.firstDayOfTheWeek);

CalendarManager.updateStatusBarAnimation(CalendarManager.statusBarAnimationFade, (error, result) => {
  console.log(result);
});