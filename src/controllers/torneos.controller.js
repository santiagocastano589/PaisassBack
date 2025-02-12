const pool = require('../db');

const getTorneos = async (req, res) => {
    try {
        const result = await pool.query(`SELECT
            id,
            ltrim(rtrim(nombre)) nombre,
            ltrim(rtrim(categoria)) categoria,
            ltrim(rtrim(disciplina)) disciplina,
            fecha_inicio,
            ltrim(rtrim(horario)) horario,
            fecha_final,
            costo_inscripcion,
            ltrim(rtrim(ubicacion)) ubicacion,
            ltrim(rtrim(estado)) estado,
            max_equipos,
            ltrim(rtrim(reglamento)) reglamento,
            ltrim(rtrim(organizador)) organizador,
            premio FROM torneo
        `)
        res.json(result.rows)
    } catch (err) {
        res.status(500).json({ error: err.message})
    }
};




module.exports = {
    getTorneos
};