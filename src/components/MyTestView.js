/**
 * MyTestView .vue
 *  组件
 * Created by neil on 1/19/21
 * Copyright © 2018年. All rights reserved.
 * */

import React, {Component, Fragment} from 'react'
import {
	requireNativeComponent
} from "react-native"


class MyTestView extends Component {
	constructor(props) {
		super(props)
	}

	render() {
		return (
		<>
			<TestDemoView {...this.props}
										style={{
											marginTop: 10,
											width: 200,
											height: 200,
											backgroundColor: 'red',
										}}/>
		</>
		)
	}
}

const TestDemoView = requireNativeComponent("TestDemoView", MyTestView)


export default MyTestView
