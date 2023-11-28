const express = require("express");
const mysql = require("mysql2");
const myconn = require("express-myconnection");
//const bodyParser = require("body-parser");

const routes = require('./routes');

const app = express();
app.set('port', process.env.PORT || 9000); /*¿Este era el puerto correcto?*/
const dbOptions = ({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'flopypeluchito20046.',
    database: 'inventario'
});

// Middleware
app.use(myconn(mysql, dbOptions, 'single'));
app.use(express.json())

// Routes
app.get('/', (req, res)=>{
    res.send('Welcome to my API')
});

app.use('/api', routes);

// Server running
app.listen(app.get('port'), () => {
    console.log('Server runing on port ', app.get('port'))
});