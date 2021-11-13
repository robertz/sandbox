component extends="coldbox.system.EventHandler" {
	property name = "UserService" inject;
	property name = "defaultUser" inject = "coldbox:setting:defaultUser";

	// Default event
	function index( event, rc, prc ) {
		if(prc.userid == defaultUser) relocate('main.login');
		// load libraries
		prc.layout.headerjs.append("https://unpkg.com/vue@2.6.12/dist/vue.js");
		prc.layout.headerjs.append("https://unpkg.com/moment@2.29.1/moment.js");
		prc.layout.footerjs.append("/includes/js/feed.js");
		event.setView( "main/index" );
	}

	// Login page
	function login( event, rc, prc ) {
		prc.header.title = "Login";
		event.setLayout('Login');
		event.setView('main/login');
	}

	// logout
	function logout( event, rc, prc ) {
		client['userid'] = defaultUser;
		relocate(url = "/");
	}

	// process login
	function processLogin( event, rc, prc ) {
		var em = rc.keyExists("user") ? rc.user : "";
		var pw = rc.keyExists("pass") ? rc.pass : "";
		var u = UserService.authenticateUser(em, pw);
		if (u != defaultUser) {
			client['userid'] = u;
			relocate(url = '/');
		}
		relocate(url = '/');
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit( event, rc, prc ) {
	}

	function onRequestStart( event, rc, prc ) {
	}

	function onRequestEnd( event, rc, prc ) {
	}

	function onSessionStart( event, rc, prc ) {
	}

	function onSessionEnd( event, rc, prc ) {
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ) {
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
