component extends="coldbox.system.EventHandler" {
	property name = "UserService" inject;
	property name = "SocialService" inject;
	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	function index( event, rc, prc ) {
		return {};
	}

	function listSocial( event, rc, prc ) {
		return SocialService.listSocials(rc);
	}

}