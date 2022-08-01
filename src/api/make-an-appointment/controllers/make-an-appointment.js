'use strict';

/**
 *  make-an-appointment controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::make-an-appointment.make-an-appointment');
