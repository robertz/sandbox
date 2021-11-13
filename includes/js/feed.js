'use strict'

Vue.config.productionTip = true
Vue.config.devtools = true

const app = new Vue({
	el: '#app',
	data: {
		user: window.kdfe.user,
		count: 0,
		social: []
	},
	created() {
		this.loadSocial()
		setInterval(() => {
			this.loadSocial()
		}, 60000)
	},
	methods: {
		loadSocial(){
			fetch(`/api/listSocial`)
				.then(res => res.json())
				.then(res => {
					this.social = res
				})
		}
	},
	filters: {
		fromNow: function(value){
			return new moment(value).fromNow()
		},
		moment: function(value, format) {
			return new moment(value).format(format)
		},
		time: function(value) {
			return new moment(value).format('LLL')
		}
	}
})