component {

	function listSocials( required struct criteria ) {
		var q = queryExecute("
			SELECT u.display, s.id, s.link, s.title, s.description, s.image, s.created, s.updated
			FROM users u, social s
			WHERE u.id = s.owner
			ORDER BY created DESC", [], { returnType: "array" });
		return q;
	}

}