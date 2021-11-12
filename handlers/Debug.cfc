component {

	function index (event, rc, prc) {
		var q = new select('*').from('social').execute();
		var res = [];
		q.each((item) => {
			res.append(deserializeJSON(q.data));
		});
		return res;
	}

	function prc (event, rc, prc) {
		writeDump(var = prc, abort = 1);
	}

}