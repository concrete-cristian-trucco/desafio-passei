var restify = require('restify');
var errors = require('restify-errors');
var mysql = require('mysql');

var port = process.env.NODEJS_API_PORT;
if (!port) {
    port = 8080;
}
var connection = mysql.createConnection({
	host: 'localhost',
	port: '3306',
	database: 'notes',
	socketPath: '/var/run/mysqld/mysqld.sock',
	user: 'notes-api',
	password: 'notes-api',
	connectionLimit: 50,
    queueLimit: 0,
	waitForConnection: true,
	insecureAuth : true
});

var server = restify.createServer();

server.use(restify.plugins.bodyParser());

connection.connect(function(err) {
    if (err) {
        console.error('Error:- ' + err.stack);
        return;
    }
    console.log('Connected Id:- ' + connection.threadId);
});

// get all notes
server.get('/notes', function (request, response, next) {
	connection.query('select * from notes.Note order by Id desc', function (error, results, fields) {
		if (error) { next(error); return; }
		response.end(JSON.stringify(results));
	});
});

// create note
server.post('/notes', function (request, response, next) {
	if(!request.body) { return next(new errors.BadRequestError("texto inválido")); }
	connection.query('insert into notes.Note (Text) values ("?")', [request.body], function (error, results, fields) {
		if (error) { next(error); return; }
		response.end("Ok");
	});
});

// delete note
server.del('/notes/:id', function (request, response, next) {
	var id = request.params.id;
	
	if(!id || id <= 0) { return next(new errors.BadRequestError("id inválido")); }
	
	connection.query('delete from notes.Note WHERE Id=?', [id], function (error, results, fields) {
		if (error) { next(error); return; }
		if(!results.affectedRows) { next(new errors.BadRequestError("id inválido")); return; }
		response.end("Ok");
	});
});

server.listen(port, function () {
	console.log('%s listening at %s', server.name, server.url);
});

module.exports = server;
