const express = require('express');
const router = express.Router();

const {
    getTorneos,
} = require('../controllers/torneos.controller');

router.get('/torneos', getTorneos);

module.exports = router;