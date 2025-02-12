const pool = require('../db');  

const getJugadores = async (req, res) => {
    try {
        const result = await pool.query(`SELECT
            ltrim(rtrim(documento)) documento,
            ltrim(rtrim(tipo_documento)) tipo_documento,
            ltrim(rtrim(nombre)) nombre,
            fecha_nacimiento,
            ltrim(rtrim(correo)) correo,
            ltrim(rtrim(contrasena)) contrasena,
            ltrim(rtrim(sexo)) sexo,
            ltrim(rtrim(telefono)) telefono FROM jugador
        `);
        res.json(result.rows);
    } catch (err) {
        res.status(500).json({ error: err.message })
    }
}


module.exports = {
    getJugadores,
};