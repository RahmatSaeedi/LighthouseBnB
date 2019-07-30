//password for postgres pSQL account
const { Pool } = require('pg');
const { password } = require('./pSQLConfig');

const pool = new Pool({
  user: 'postgres',
  password,
  host: 'localhost',
  database: 'lightbnb'
});


module.exports = {
  query: (text, params, callback) => {
    return pool.query(text, params, callback);
  }
};