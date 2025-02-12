const express = require('express');
const router = express.Router();
const {
    getJugadores,
} = require('../controllers/jugadores.controller');


router.get('/jugadores', getJugadores);

module.exports = router;