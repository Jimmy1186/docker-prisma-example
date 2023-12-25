module.exports = {
  apps: [
    {
      name: 'test-backend',
      script: './index.js',
      max_memory_restart: '1000M',
      cron_restart: '0 0 * * *',
      port: 3000,
    },
  ],
};
