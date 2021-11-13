component extends="coldbox.system.web.context.RequestContextDecorator" {

	property name="Controller" inject="coldbox";

	function configure(){
		var rc = getRequestContext().getCollection();
		var prc = getRequestContext().getCollection(private = true);

		if(!client.keyExists("userid")) client['userid'] = "0042536a-0ccc-49a1-a5f4-d8aeb09e37ec";
		if(rc.keyExists("reversion") || !application.keyExists("v")) application['v'] = dateFormat(now(), "yyyymmdd")&timeFormat(now(), "Hmm")

		prc['header'] = {
			'title': "Sandbox",
			'description': "The Sandbox",
			'author': "KISDigital.com"
		};

		var us = new models.services.UserService();
		prc['user'] = us.getUser(id = client.userid);

		prc['userid'] = client.userid;
		prc['jsonData'] = {};
		prc['jsonData']['user'] = prc.user;

		prc['layout']['headerjs'] = [];
		prc['layout']['footerjs'] = [];

		return this;
	}

}