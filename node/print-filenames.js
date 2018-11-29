var fs = require('fs');

var dir_name = process.argv[2];

fs.readdir(dir_name, function callback(err, list) {
	if(err) {
		console.log('an error occurred');
		console.log(err);
	} else {
		
		for(i=0;i<list.length;i++) {
			output_if_file(dir_name+list[i], list[i]);
		}
	}
});


function output_if_file(full_path, filename) {
	fs.stat(full_path, function (err, stats) {
	    if(err) {
	    	console.log("Error");
		    console.log(err);
	    } else {
		    if(stats.isDirectory()) {
		   		return;
		    } else if(stats.isFile()){
		    	console.log(filename);
		   		return;
		    } else {
		    	return;
		    }
	    }
	});
}