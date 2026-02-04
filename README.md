# 🗳️ Election Forum Application

A complete political party platform with candidate profiles, feedback system, and community engagement.

**Live**: https://nepalicommunists.org

## 📋 Project Structure

```
election-app/
├── server/              # Express.js backend
│   ├── server.js
│   ├── package.json
│   ├── .env            (production only)
│   ├── routes/
│   ├── models/
│   ├── controllers/
│   └── middleware/
│
├── client/              # React frontend
│   ├── src/
│   ├── package.json
│   └── vite.config.ts
│
├── public/              # Built frontend (generated)
│
├── package.json         # Root scripts
├── .gitignore
└── deploy.sh           # Deployment script
```

## 🚀 Quick Start (Local Development)

### Install Dependencies
```bash
npm run install-all
```

### Run Both Frontend & Backend
```bash
npm run dev
```

This will start:
- Backend: http://localhost:3000
- Frontend: http://localhost:5173

### Build for Production
```bash
npm run build:all
```

This will:
1. Build React frontend to `dist/`
2. Copy build to `public/` directory
3. Backend serves frontend from `public/`

### Start Production Server
```bash
npm start
```

## 📦 Deployment to cPanel

### Initial Setup (One Time)

1. **SSH into your cPanel hosting:**
```bash
ssh baivab@nepalicommunists.org
```

2. **Navigate to Node.js apps directory:**
```bash
cd /home/baivab/nodesapps
```

3. **Clone the repository:**
```bash
git clone https://github.com/baivab22/election.git election-app
cd election-app
```

4. **Install dependencies:**
```bash
npm run install-all
```

5. **Build frontend:**
```bash
npm run build:all
```

6. **Create .env file:**
```bash
nano server/.env
```

Add these values:
```env
PORT=3000
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/election
NODE_ENV=production
JWT_SECRET=your_secret_key_here
CORS_ORIGIN=https://nepalicommunists.org
```

Save: **Ctrl+O** → **Enter** → **Ctrl+X**

7. **Setup Node.js App in cPanel:**
   - Go to cPanel → Setup Node.js App
   - Click **Create Application**
   - Application root: `/home/baivab/nodesapps/election-app`
   - Application startup file: `server/server.js`
   - Node.js version: Latest
   - Port: 3000 (or default)
   - Click **Create**
   - Click **Start**

8. **Verify it's running:**
```bash
curl http://localhost:3000
```

### Updating the Application

After making changes locally:

```bash
# Commit and push to GitHub
git add .
git commit -m "Your update message"
git push origin main
```

Then on the server:
```bash
/home/baivab/nodesapps/election-app/deploy.sh
```

Or manually:
```bash
cd /home/baivab/nodesapps/election-app
git pull origin main
npm run install-all
npm run build:all
# Restart app in cPanel or via PM2
```

## 🗂️ API Endpoints

### Candidates
- `GET /api/candidates` - Get all candidates
- `GET /api/candidates/:id` - Get candidate details
- `POST /api/candidates/:id/feedback` - Submit feedback for candidate
- `GET /api/candidates/:id/feedback` - Get candidate feedback

### Feedback
- `POST /api/feedback` - Submit general feedback
- `GET /api/feedback/:id` - Get feedback details

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration

## 🔧 Configuration

### Environment Variables

Create `.env` in `server/` directory:

```env
# Port
PORT=3000

# Database
MONGODB_URI=mongodb+srv://user:pass@cluster.mongodb.net/dbname

# Environment
NODE_ENV=production

# Security
JWT_SECRET=your_secret_key

# CORS
CORS_ORIGIN=https://nepalicommunists.org

# Optional
CLOUDINARY_CLOUD_NAME=xxx
CLOUDINARY_API_KEY=xxx
CLOUDINARY_API_SECRET=xxx
```

## 🗄️ Database

Uses MongoDB Atlas (cloud database)

1. Go to https://www.mongodb.com/cloud/atlas
2. Create a free account
3. Create a cluster
4. Get connection string
5. Add to `.env` file as `MONGODB_URI`

## 🌐 Domain Setup

In cPanel:

1. **DNS/Nameservers** or **CNAME Records**
2. Point domain to your server
3. Use **AutoSSL** to get free HTTPS certificate
4. Test: `https://nepalicommunists.org`

## 📊 File Structure Details

### Backend
- `server/server.js` - Main Express server (serves frontend + API)
- `server/routes/` - API endpoints
- `server/models/` - MongoDB schemas
- `server/controllers/` - Business logic
- `server/middleware/` - Auth, validation, etc.

### Frontend
- `client/src/pages/` - React pages
- `client/src/components/` - Reusable components
- `client/src/lib/api.ts` - API client
- `client/vite.config.ts` - Build configuration

## 🐛 Troubleshooting

### Backend won't start
```bash
cd /home/baivab/nodesapps/election-app/server
npm start
# Check error messages
```

### Frontend not loading
```bash
# Check if build exists
ls -la public/

# Rebuild if needed
npm run build:all
```

### MongoDB connection error
```bash
# Verify connection string in .env
# Check IP whitelist in MongoDB Atlas
# Make sure username/password are correct
```

### CORS errors
```bash
# Update CORS_ORIGIN in server/.env
# Restart the application
```

## 📝 Available Scripts

### Development
- `npm run dev` - Start both frontend & backend in dev mode
- `npm run client` - Start frontend only
- `npm run server` - Start backend only

### Production
- `npm run build` - Build frontend
- `npm run build:all` - Build frontend + copy to public
- `npm start` - Build and start production server
- `npm run deploy` - Build, commit, and push to GitHub

### Installation
- `npm run install-all` - Install all dependencies

## 🔐 Security

- HTTPS/SSL enabled via AutoSSL
- JWT authentication for admin routes
- Environment variables for sensitive data
- CORS configured for allowed domains
- Helmet.js for security headers
- Rate limiting on API endpoints

## 📞 Support

For issues or questions:
1. Check the troubleshooting section
2. Review error logs in cPanel
3. Check MongoDB Atlas dashboard
4. Contact hosting provider support

## 📄 License

MIT License - See LICENSE file

---

**Last Updated**: February 2026
**Maintainer**: Baivab Bidari
