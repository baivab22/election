#!/bin/bash

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}🚀 Election Forum Deployment Script${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Navigate to app directory
cd /home/baivab/nodesapps/election-app || {
    echo -e "${RED}❌ App directory not found!${NC}"
    exit 1
}

# Pull latest code from GitHub
echo -e "${YELLOW}📥 Pulling latest code from GitHub...${NC}"
git pull origin main || {
    echo -e "${RED}❌ Failed to pull from GitHub${NC}"
    exit 1
}
echo -e "${GREEN}✅ Code pulled successfully${NC}\n"

# Install dependencies
echo -e "${YELLOW}📦 Installing dependencies...${NC}"
npm run install-all || {
    echo -e "${RED}❌ Failed to install dependencies${NC}"
    exit 1
}
echo -e "${GREEN}✅ Dependencies installed${NC}\n"

# Build frontend
echo -e "${YELLOW}🔨 Building frontend...${NC}"
npm run build:all || {
    echo -e "${RED}❌ Failed to build frontend${NC}"
    exit 1
}
echo -e "${GREEN}✅ Frontend built successfully${NC}\n"

# Verify public directory
if [ -d "public" ] && [ -f "public/index.html" ]; then
    echo -e "${GREEN}✅ Frontend files copied to public directory${NC}\n"
else
    echo -e "${RED}❌ Frontend build failed - no index.html found${NC}"
    exit 1
fi

# Restart Node.js app via cPanel (if using cPanel's built-in restart)
echo -e "${YELLOW}🔄 Node.js app will restart automatically via cPanel...${NC}"
echo -e "${YELLOW}If auto-restart doesn't work, restart manually in cPanel → Setup Node.js App${NC}\n"

# Final success message
echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}✅ Deployment complete!${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}🌐 Visit: https://nepalicommunists.org${NC}"
echo -e "${BLUE}📁 App location: $(pwd)${NC}"
echo -e "${BLUE}✏️  Last updated: $(date)${NC}"
echo -e "${BLUE}========================================${NC}\n"
