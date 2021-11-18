component {

	function log (required struct criteria) {
		cfhttp(url = "https://api.kisdigital.com/chron/log", method = "POST", charset = "utf-8"){
			cfhttpparam(type = "header", name = "Content-Type", value = "application/json");
			cfhttpparam(type = "body", value = serializeJSON({
				"appid": "882c8177-1c27-4f75-a854-6e9a2aa444d1",
				"type": criteria.keyExists("type") ? criteria.type : "information",
				"log": criteria.keyExists("log") ? criteria.log : "sandbox",
				"message": criteria.keyExists("message") ? criteria.message : "No message."
			}));
		}
	}

}