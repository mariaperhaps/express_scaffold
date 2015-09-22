


ARGV1=$1
mkdir $1
cd $1

touch app.js
npm init -f
npm install express --save
npm install ejs --save
npm install body-parser --save
npm install method-override --save
npm install sqlite3 --save

cat << EOF > app.js
var express = require('express');
var app = express();
var ejs = require('ejs');
var sqlite3 = require('sqlite3');
var db = new sqlite3.Database('$1.db');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var urlencodedBodyParser = bodyParser.urlencoded({extended: false});

app.use(express.static('public'));

app.use(urlencodedBodyParser);

app.use(methodOverride('_method'));

app.set('view_engine', 'ejs');

app.get('/', function(req, res){
	res.render('index.ejs')
});

app.listen(3000, function(){
	console.log('listening on port 3000!')
});

EOF



mkdir views public
cd views
touch index.ejs new.ejs edit.ejs show.ejs



head="<% include partials/layout %>"

 
echo $head > new.ejs
echo $head > edit.ejs
echo $head > show.ejs


cat << EOF > index.ejs
$head
<h1>Hello World</h1>
EOF

mkdir partials
cd partials
touch layout.ejs

cat << EOF > layout.ejs
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>$1</title>
	<link rel="stylesheet" type="text/css" href="/stylesheets/style.css">
</head>
<body>
	<script src="/scripts/script.js"></script>
</body>
</html>
EOF
 

cd ../../
cd public
mkdir stylesheets scripts img
touch stylesheets/style.css
touch scripts/script.js

echo 'console.log("linked")' > scripts/script.js



cat << "EOF"

 _______ _________ _       
(  ____ \\__   __/( (    /|
| (    \/   ) (   |  \  ( |
| (__       | |   |   \ | |
|  __)      | |   | (\ \) |
| (         | |   | | \   |
| )      ___) (___| )  \  |
|/       \_______/|/    )_)
                           
                          
EOF

