module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'c0617d04396d9698d72961e042fa3ac3'),
  },
});
