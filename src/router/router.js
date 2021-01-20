/**
 * AppStack .vue
 *  组件
 * Created by neil on 1/17/21
 * Copyright © 2018年. All rights reserved.
 * */

import {createStackNavigator} from 'react-navigation-stack'
import {createAppContainer} from 'react-navigation'

import Exemple from '../pages/Exemple'
import Webview from '../pages/Webview'
import NativeJS from '../pages/NativeJS'

const StackRouteConfigs = {
	Exemple: {
		screen: Exemple,
		navigationOptions: {
			header: null
		}
	},
	Webview: {
		screen: Webview,
		navigationOptions: {
			header: null
		}
	},
	NativeJS: {
		screen: NativeJS,
		navigationOptions: {
			header: null
		}
	}
};
const StackNavigatorConfigs = {
	initialRouteName: 'Exemple', // 初始化哪个界面为根界面
	mode: 'card', // 跳转方式：默认的card，在iOS上是从右到左跳转，在Android上是从下到上，都是使用原生系统的默认跳转方式。
	headerMode: 'screen', // 导航条动画效果：float表示会渐变，类似于iOS的原生效果，screen表示没有渐变。none表示隐藏导航条
	gesturesEnabled: false,
	navigationOptions: {
		cardStack: {
			gesturesEnabled: false, //是否可以使用手势关闭此屏幕。在iOS上默认为true，在Android上为false
		},
	},
};

const AppNavigator = createStackNavigator(StackRouteConfigs, StackNavigatorConfigs);


export default createAppContainer(AppNavigator);
