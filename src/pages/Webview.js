/**
 * Webview .vue
 *  组件
 * Created by neil on 1/17/21
 * Copyright © 2018年. All rights reserved.
 * */

import React, {Component} from 'react'
import {WebView} from 'react-native-webview'
import {
	View,
	Text,
	StyleSheet,
	TouchableOpacity,
	Alert,
	// Button
} from 'react-native'
import {Button, WingBlank}  from '@ant-design/react-native'

class Webview extends Component {
	constructor(props) {
		super(props)
		this.click = this.click.bind(this)
	}

	click() {
		this.props.navigation.navigate("Exemple")
	}

	render() {
		return (
		<>
			<View style={styles.container}>
				<TouchableOpacity style={{backgroundColor: 'white', height: 40}}
													onPress={() => {
														this.refs.webview.injectJavaScript(`receiveMessage("RN向H5发送消息");true;`)
													}}
				>
					<WingBlank
					style={{
						marginTop: 10,
						flexDirection: 'row',
						justifyContent: 'space-between',
						alignItems: 'center',
					}}
					>
						<Button type="ghost" size="small" onPress={this.click}>
							返回
						</Button>
						<Button type="ghost" size="small">点击</Button>
					</WingBlank>
				</TouchableOpacity>
				<WebView
				ref="webview"
				style={{flex: 1, backgroundColor: "gray", marginTop: 10}}
				source={{uri: 'https://www.baidu.com'}}
				injectedJavaScript="
                       window.receiveMessage = (msg) => {
                        alert(msg)
                    }
                    window.ReactNativeWebView.postMessage('H5向RN发送数据')
                    "
				onMessage={(e) => {
					console.log("h5发送过来的消息--->", e.nativeEvent.data)
				}}
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

export default Webview
