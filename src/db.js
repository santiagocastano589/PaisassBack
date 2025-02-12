const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    host: 'aws-0-us-west-1.pooler.supabase.com',
    database: 'postgres',
    user: 'postgres.buypkihmsmdvyyrvqplu',
    password: 'scn1094893545',
    port: 6543, 
    ssl: {
      rejectUnauthorized: false,
    },
  });

module.exports = pool;

(async () => {
    try {
        await pool.query('SELECT NOW()');
        console.log('Conexión exitosa a la base de datos');
    } catch (error) {
        console.error('Error al conectar a la base de datos: ', error);
    }
})();

module.exports = {
    query: (text, params) => pool.query(text, params),
};
