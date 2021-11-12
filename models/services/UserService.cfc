component {
	property name="defaultUser" inject="coldbox:setting:defaultUser";

	// authenticate a user and return a user id
	function authenticateUser(required string email, required string password){
		var u = queryExecute("SELECT id FROM users WHERE email = :email AND password = :password", {
			'email': { value: email, cfsqltype: "cf_sql_varchar" },
			'password': { value: hashString(password), cfsqltype: "cf_sql_varchar" }
		}, { returntype: "array" });
		return u.len() ? u[1].id : defaultUser;
	}

	// return data for a user
	function getUser(required string id) {
		var u = queryExecute("SELECT id, email, display FROM users WHERE id = :id", {
			'id': { value: id, cfsqltype: "cf_sql_varchar" }
		}, { returntype: "array" });
		return u[1];
	}

	// Generic method to return a salted/hashed string value
	function hashString(required string input) {
		var salt = ":e94edebc-8fa2-46c5-bf37-d3edac09b819:7e09d1eb-a7ec-4b5b-96a9-18f51b27fe2a";
		var hashed = lcase(hash(input & salt, "SHA-256"));
		for(var i = 1; i <= 237; i++) hashed = lcase(hash(hashed, "SHA-256"));
		return hashed;
	}

}