'use strict';

/**
 * make-an-appointment service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::make-an-appointment.make-an-appointment');
