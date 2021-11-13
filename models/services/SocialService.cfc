component {

	function listSocials( required struct criteria ) {
		return queryExecute("SELECT * FROM social", [], { datasource: "kdfe", returntype: "array" });
	}

}