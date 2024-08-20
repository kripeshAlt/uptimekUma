# Use the pre-built Uptime Kuma image
FROM louislam/uptime-kuma:1

# Expose the port Uptime Kuma will run on
EXPOSE 3001

# Set the entry point to start Uptime Kuma
CMD ["npm", "run", "start-server"]
