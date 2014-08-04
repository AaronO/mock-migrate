#!/bin/bash


# Launch static server
python -m SimpleHTTPServer 5566 &

# Keep PID
PID=$!
echo "PID is ${PID}"

# Wait for server to be up
sleep 2

# Clean out folder
rm -rf ./out/*

# Make tmp folder
mkdir -p /tmp/out_tmp

# Download and extract tar to tmp folder
curl "http://localhost:5566/in.tgz" 2>/dev/null | tar -C /tmp/out_tmp -zxv

# Migrate files
cp -R -n /tmp/out_tmp/home ./out/

# Kill server
kill -s KILL ${PID}

# Cleanup tmp folder
rm -rf /tmp/out_tmp

