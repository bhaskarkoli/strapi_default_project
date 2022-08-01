'use strict';

/**
 * dropdown-service service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::dropdown-service.dropdown-service');
