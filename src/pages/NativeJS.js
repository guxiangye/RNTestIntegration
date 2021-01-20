/**
 * NativeJS .vue
 *  组件
 * Created by neil on 1/18/21
 * Copyright © 2018年. All rights reserved.
 * */

import React, {Component, Fragment} from 'react'
import {
	NativeModules, NativeEventEmitter,
	View, StyleSheet,
	findNodeHandle
} from 'react-native'
import {Button}  from '@ant-design/react-native'
import MyTestView from "../components/MyTestView"
const {
	TestModule,
	TestDemoViewManager,
	MiniProgressViewController,
	TestDemoEmitter
} = NativeModules
const myManagerEmitter = new NativeEventEmitter(TestDemoEmitter);


class NativeJS extends Component {
	constructor(props) {
		super(props)
		this.click = this.click.bind(this)
		this.tap = this.tap.bind(this)
		this.nativeToRnClick = this.nativeToRnClick.bind(this)
		this.goBack = this.goBack.bind(this)
	}

	componentDidMount() {
		myManagerEmitter.addListener('MYEmitter', (params) => {
			alert(JSON.stringify(params))
		});
	}
	goBack = () => {
		this.props.navigation.navigate("Exemple")
	}
	click = () => {
		MiniProgressViewController.addHelloWord('你的名字', '位置:上海')
	}
	tap = () => {
		let tag = findNodeHandle(this.refs.TestDemoView)
		alert(tag)
		TestDemoViewManager.changeTitle(tag, 'RN 插件测试1')
	}

	nativeToRnClick = (e) => {
		// RN读取原生控件的回调数据，使用e.nativeEvent读取。
		alert(JSON.stringify(e.nativeEvent))
	}

	render() {
		return (
		<>
			<View style={styles.container}>
				<Button style={{
					marginTop: 10,
					flexDirection: 'row',
					justifyContent: 'space-between',
					alignItems: 'center',
				}} type="ghost" onPress={() => this.goBack()}>
					返回
				</Button>
				<Button style={{
					marginTop: 10,
					flexDirection: 'row',
					justifyContent: 'space-between',
					alignItems: 'center',
				}} type="ghost" onPress={() => this.click()}>
					传 2 个参数给 native
				</Button>
				<Button style={{
					marginTop: 10,
					flexDirection: 'row',
					justifyContent: 'space-between',
					alignItems: 'center',
				}} type="ghost" onPress={() => this.tap()}>改变红色组件的 title</Button>
				<MyTestView
				ref="TestDemoView"
				style={{
					marginTop: 10,
					width: 200,
					height: 200,
					backgroundColor: 'red',
				}}
				onClickAction={(e) => {this.nativeToRnClick(e)}}
				/>
			</View>
		</>
		)
	}
}

const styles = StyleSheet.create({
	container: {
		marginTop: 100,
		flex: 1,
	},
})

// const TestDemoView = requireNativeComponent("TestDemoView", NativeJS)

export default NativeJS
