<cfoutput>
<div class="row vh-100 text-white">
	<div class="col-2"></div>
	<div class="col-2 sidebar text-dark">
		<h6>{{ user.display }}</h6>
	</div>
	<div class="col-4">
		<div class="feed-item p-2 mb-2 row" v-for="item in social">
			<div class="col-12 text-dark">{{ item.display }} posted {{ item.created | fromNow }}</div>
			<div class="col-5">
				<img :src="item.image" class="img-thumbnail img-responsive" alt="" />
			</div>
			<div class="col-7">
				<h6 class="text-dark"><a :href="item.link" target="_blank">{{ item.title }}</a></h6>
				<p class="text-dark small">
					{{ item.description }}
				</p>
			</div>
		</div>
	</div>
	<div class="col-2 sidebar">
		right column
	</div>
	<div class="col-2"></div>
</div>
</cfoutput>