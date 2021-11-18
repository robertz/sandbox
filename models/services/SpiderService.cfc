component {
	property name = "jSoup" inject = "javaLoader:org.jsoup.Jsoup";

	function spider(required string linkUrl) {
		var meta = {};
		cfhttp(url = linkUrl);
		var jsDoc = jSoup.parse(cfhttp.fileContent);
		var el = jsDoc.select("meta");
		var filtered = el.filter((its) => {
		return its.attr("name").find("twitter:") ||
				its.attr("name").find("og:") ||
				its.attr("property").find("twitter:") ||
				its.attr("property").find("og:") ||
				its.attr("property").find("article:") ||
				its.attr("name").find("author") ||
				its.attr("name").find("keywords") ||
				its.attr("name").find("description") ||
				its.attr("name").find("dc.");
			});
		// set the value based on whether the value is a name or property
		filtered.each((i) => {
			len(i.attr("name")) ? meta[i.attr("name")] = i.attr("content") : meta[i.attr("property")] = i.attr("content");
		});
		return meta;
	}

	function content(required string linkUrl) {
		cfhttp(url = linkUrl);
		return cfhttp.fileContent;
	}

}