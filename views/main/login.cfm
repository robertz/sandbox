<cfoutput>
<div class="row login pt-5">
	<div class="col-4"></div>
	<div class="col-4 vh-100">
		<form action="/main/processLogin" method="post">
			<div class="login-input m-2 p-2 text-white">
				<h5>Sandbox</h5>
				<label class="form-label" for="user">Email:</label>
				<input id="user" placeholder="user@email.com" type="text" name="user" class="form-control" />

				<label class="form-label" for="pass">Password:</label>
				<input id="pass" placeholder="Password" type="password" name="pass" class="form-control" />

				<input type="Submit" class="btn btn-outline-primary mt-4" value="Login" />
			</div>
		</form>
	</div>
	<div class="col-4"></div>
</div>
</cfoutput>