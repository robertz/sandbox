'use strict'

Vue.config.productionTip = false
Vue.config.devtools = false

const app = new Vue({
	el: '#app',
	data: {
		user: window.kdfe.user,
		message: "Your message here",
		social: []
	},
	created() {
		this.loadSocial()
	},
	methods: {
		loadSocial(){
			fetch(`/api/listSocial`)
				.then(res => res.json())
				.then(res => {
					this.social = res
				});
		}
	}
})