module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '499e5c117c92a4c648020dc3661aa3ee'),
  },
});
