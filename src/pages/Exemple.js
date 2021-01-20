/**
 * Exemple .vue
 *  组件
 * Created by neil on 1/17/21
 * Copyright © 2018年. All rights reserved.
 * */

import React, {Component, Fragment} from "react"

import {
	// 样式组件
	StyleSheet,
	// 基础组件
	View, Text,
	SectionList,
	// iOS
	SafeAreaView
} from "react-native"
import Webview from "./Webview"

const DATA = [
	{
		title: "单向数据流",
		data: ["BgColor", "ItemColor", "TitleColor"]
	},
	{
		title: "组件",
		data: ["Webview", "NativeJS", "Other"]
	},
	{
		title: "NativeJS",
		data: ["Water", "Coke", "Beer"]
	},
	{
		title: "Desserts",
		data: ["Cheese Cake", "Ice Cream"]
	}
]

class Exemple extends Component {
	constructor(props) {
		super(props)
		this.click = this.click.bind(this)

		console.log(this.props.scores)

		this.state = {
			BgColor: styles.container.backgroundColor,
			ItemColor: styles.item.backgroundColor,
			TitleColor: styles.title.color,
		};
	}

	click(item, index, section) {
		if (section["title"] === DATA[0]["title"]) {
			if (index === 0) {
				// 单向数据流
				this.setState(() => ({
					BgColor: "#000"
				}));
			} else if (index === 1) {
				this.setState(() => ({
					ItemColor: "blue"
				}));
			} else if (index === 2) {
				this.setState(() => ({
					TitleColor: "yellow"
				}));
			}
		} else if (section["title"] === DATA[1]["title"]) {
			if (index === 0) {
				this.props.navigation.navigate("Webview")
			} else if (index === 1) {
				this.props.navigation.navigate("NativeJS", this.props)
			}
		}
	}

	render() {
		const {BgColor, ItemColor, TitleColor} = this.state
		return (
		<SafeAreaView style={{...styles.container, backgroundColor: BgColor}}>
			<SectionList
			sections={DATA}
			keyExtractor={(item, index) => item + index}
			renderItem={({item, index, section }) => <View style={{...styles.item, backgroundColor: ItemColor}}>
				<Text style={{...styles.title, color: TitleColor}}
							onPress={() => this.click(item, index, section)}
				>
					{item}
				</Text>
			</View>}
			renderSectionHeader={({section: {title}}) => (
			<Text style={styles.header}>{title}</Text>
			)}
			/>
		</SafeAreaView>
		)
	}
}


const styles = StyleSheet.create({
	container: {
		flex: 1,
		marginTop: 100,
		marginHorizontal: 16
	},
	item: {
		backgroundColor: "#f9c2ff",
		padding: 20,
		marginVertical: 8
	},
	header: {
		fontSize: 32,
		backgroundColor: "#fff"
	},
	title: {
		color: "#333",
		fontSize: 24
	}
});

export default Exemple
