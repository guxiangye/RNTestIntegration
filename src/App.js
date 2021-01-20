/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from "react"
import AppNavigator from "./router/router"
import {
	StyleSheet, StatusBar, AppState
} from "react-native"
import codePush from "react-native-code-push";

@codePush
class App extends React.Component {
	constructor(props) {
		super(props)

		console.log(this.props.params)
		alert(JSON.stringify(this.props.params))
	}

	componentDidMount() {
		// 静默更新
		// codePush.sync();
		// 如果期望更及时的获得更新，可以在每次APP从后台进入前台的时候去主动的检查更新，执行如下代码：
		AppState.addEventListener("change", (newState) => {
			newState === "active" && codePush.sync();
		});
	}

	render() {
		return (
		<>
			<StatusBar barStyle="dark-content" />
			<AppNavigator />
		</>
		)
	}
}

const styles = StyleSheet.create({
	container: {
		flex: 1,
		justifyContent: "center",
		alignItems: "center",
		backgroundColor: "#FFFFFF",
	},
	highScoresTitle: {
		fontSize: 20,
		textAlign: "center",
		margin: 10,
	},
	scores: {
		textAlign: "center",
		color: "#333333",
		marginBottom: 5,
	},
})

export default App;


// import React from "react";
// import { AppRegistry, StyleSheet, Text, View } from "react-native";
//
// class App extends React.Component {
// 	render() {
// 		var contents = this.props["scores"].map((score) => (
// 		<Text key={score.name}>
// 			{score.name}:{score.value}
// 			{"\n"}
// 		</Text>
// 		));
// 		return (
// 		<View style={styles.container}>
// 			<Text style={styles.highScoresTitle}>2048 High Scores!</Text>
// 			<Text style={styles.scores}>{contents}</Text>
// 		</View>
// 		);
// 	}
// }
//
// const styles = StyleSheet.create({
// 	container: {
// 		flex: 1,
// 		justifyContent: "center",
// 		alignItems: "center",
// 		backgroundColor: "#FFFFFF",
// 	},
// 	highScoresTitle: {
// 		fontSize: 20,
// 		textAlign: "center",
// 		margin: 10,
// 	},
// 	scores: {
// 		textAlign: "center",
// 		color: "#333333",
// 		marginBottom: 5,
// 	},
// });
//
// export default App;
