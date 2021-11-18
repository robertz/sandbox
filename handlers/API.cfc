component extends="coldbox.system.EventHandler" {
	property name = "UserService" inject;
	property name = "SocialService" inject;
	property name = "SpiderService" inject;
	property name = "ChronService" inject;

	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	function index( event, rc, prc ) {
		return {};
	}

	function listSocial( event, rc, prc ) {
		return SocialService.listSocials(rc);
	}

	function spider( event, rc, prc ) {
		var u = event.getValue("u", "");
		var res = SpiderService.spider(linkUrl = u);

		var params = {
			id: { cfsqltype: 'cf_sql_varchar', value: createUUID() },
			owner: { cfsqltype: 'cf_sql_varchar', value: defaultUser },
			hash: { cfsqltype: 'cf_sql_varchar', value: lcase(hash(serializeJSON(res), "SHA-256")) },
			link: { cfsqltype: 'cf_sql_varchar', value: res.keyExists('og:url') ? res['og:url'] : "" },
			title: { cfsqltype: 'cf_sql_varchar', value: res.keyExists('og:title') ? res['og:title'] : "" },
			description: { cfsqltype: 'cf_sql_varchar', value: res.keyExists('og:description') ? res['og:description'] : "" },
			image: { cfsqltype: 'cf_sql_varchar', value: res.keyExists('og:image') ? res['og:image'] : "" },
			data: { cfsqltype: 'cf_sql_varchar', value: serializeJSON(res) }
		};

		var exists = queryExecute("SELECT id FROM social WHERE hash = :hash", {
			hash: { cfsqltype: 'cf_sql_varchar', value: params.hash.value }
		}).recordCount ? true : false;

		if(!exists){
			queryExecute("INSERT INTO social(id, owner, hash, link, title, description, image, data)
				values (:id, :owner, :hash, :link, :title, :description, :image, :data)", params);
		}

		ChronService.log({message = "Spider :: URL: " & u});

		return res;
	}

}