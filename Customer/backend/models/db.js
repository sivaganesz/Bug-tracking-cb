// models/db.js
const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'bug_tracking',
  password: '2004',
  port: 5432,
});

module.exports = pool;
