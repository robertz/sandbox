<cfoutput>
<div class="row vh-100 text-white">
	<div class="col-2"></div>
	<div class="col-2 sidebar">
		<h6>{{ user.display }}</h6>
	</div>
	<div class="col-4">
		<div class="feed-item p-2 mb-2" v-for="item in social" >
			<h6 class="text-dark">{{ item.title }}</h6>
			<p class="text-dark small">{{ item.description }}</p>
		</div>
	</div>
	<div class="col-2 sidebar">
		right column
	</div>
	<div class="col-2"></div>
</div>
</cfoutput>