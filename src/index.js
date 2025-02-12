const express = require('express');
const cors = require('cors');

const jugadoresRoutes = require('./routes/jugadores.routes');
const torneosRoutes = require('./routes/torneos.routes')

require('dotenv').config();

const pool = require('./db')

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());



app.use('/', jugadoresRoutes);
app.use('/', torneosRoutes);


app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
