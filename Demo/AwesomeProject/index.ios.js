/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';
import React, {
  AppRegistry,
  Component,
  StyleSheet,
  Text,
  View,
  Image,
  ListView,
} from 'react-native';

/**
 * For quota reasons we replaced the Rotten Tomatoes' API with a sample data of
 * their very own API that lives in React Native's Github repo.
 */
var REQUEST_URL = 'https://raw.githubusercontent.com/facebook/react-native/master/docs/MoviesExample.json';

//var MOCKED_MOVIES_DATA = [
//  {title: 'Title', year: '2015', posters: {thumbnail: 'http://i.imgur.com/UePbdph.jpg'}},
//];

class AwesomeProject extends Component {
  constructor(props) {
    super(props);
    //this.state = {
    //  movies: null,
    //};
    this.state = {
      dataSource: new ListView.DataSource({
        rowHasChanged: (row1, row2) => row1 !== row2,
      }),
      loaded: false,
    };
  }

  componentDidMount() {
    this.fetchData();
  }

  fetchData() {
    fetch(REQUEST_URL)
      .then((response) => response.json())
      .then((responseData) => {
        //this.setState({
        //  movies: responseData.movies,
        //});
        this.setState({
          dataSource: this.state.dataSource.cloneWithRows(responseData.movies),
          loaded: true,
        });
      })
      .done();
  }

  //render() {
  //  var movie = MOCKED_MOVIES_DATA[0];
  //  return (
  //    <View style={styles.container}>
  //      <Image
  //        source={{uri: movie.posters.thumbnail}}
  //        style={styles.thumbnail}
  //      />
  //      <View style={styles.rightContainer}>
  //        <Text style={styles.title}>{movie.title}</Text>
  //        <Text style={styles.year}>{movie.year}</Text>
  //      </View>
  //    </View>
  //  );
  //}

  render() {
    //if (!this.state.movies) {
    if (!this.state.loaded) {
      return this.renderLoadingView();
    }

    //var movie = this.state.movies[0];
    //return this.renderMovie(movie);
    return (
      <ListView
        dataSource={this.state.dataSource}
        renderRow={this.renderMovie}
        style={styles.listView}
      />
    );
  }

  renderLoadingView() {
    return (
      <View style={styles.container}>
        <Text>
          Loading movies...
        </Text>
      </View>
    );
  }

  renderMovie(movie) {
    return (
      <View style={styles.container}>
        <Image
          source={{uri: movie.posters.thumbnail}}
          style={styles.thumbnail}
        />
        <View style={styles.rightContainer}>
          <Text style={styles.title}>{movie.title}</Text>
          <Text style={styles.year}>{movie.year}</Text>
        </View>
      </View>
    );
  }
}

var styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  thumbnail: {
    width: 53,
    height: 81,
  },
  rightContainer: {
    flex: 1,
  },
  title: {
    fontSize: 20,
    marginBottom: 8,
    textAlign: 'center',
  },
  year: {
    textAlign: 'center',
  },
  listView: {
    paddingTop: 20,
    backgroundColor: '#F5FCFF',
  },
});

AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);
