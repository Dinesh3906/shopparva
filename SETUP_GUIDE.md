# Setup Guide - Shopping Aggregator with RAG Backend

## Overview

This project combines:
- **Frontend**: React + TypeScript + Convex
- **Backend**: Python FastAPI with RAG, FAISS vector search, and OpenAI LLM

## Prerequisites

- Node.js 18+ and npm
- Python 3.9+
- pip (Python package manager)

## Backend Setup

### 1. Install Python Dependencies

```bash
cd backend
pip install -r requirements.txt
```

### 2. Configure API Keys

Copy the example environment file:

```bash
copy .env.example .env
```

Edit `backend/.env` and add your keys:

```env
# Required for LLM recommendations
OPENAI_API_KEY=sk-your-openai-key-here

# Required for real product data
RAPIDAPI_KEY=your-rapidapi-key-here

# Optional
EMBEDDING_MODEL=all-MiniLM-L6-v2
```

#### Getting API Keys:

**OpenAI API Key:**
1. Go to [OpenAI Platform](https://platform.openai.com/)
2. Sign up or log in
3. Navigate to API Keys section
4. Create new secret key

**RapidAPI Key:**
1. Go to [RapidAPI](https://rapidapi.com/)
2. Sign up for free account
3. Subscribe to these APIs (free tiers available):
   - [Real-Time Amazon Data API](https://rapidapi.com/letscrape-6bRBa3QguO5/api/real-time-amazon-data)
   - [Flipkart Scraper API](https://rapidapi.com/search/flipkart)
4. Copy your RapidAPI key from dashboard

### 3. Run Backend Server

```bash
cd backend
python main.py
```

Server will start at `http://localhost:8000`

## Frontend Setup

### 1. Install Dependencies

```bash
npm install
```

### 2. Configure Environment

Your `.env.local` should already have:

```env
VITE_CONVEX_URL=https://your-convex-url.convex.cloud
BACKEND_URL=http://localhost:8000
```

### 3. Run Convex Dev

In a new terminal:

```bash
npx convex dev
```

### 4. Run Frontend

In another terminal:

```bash
npm run dev
```

Frontend will start at `http://localhost:5173`

## Testing the Integration

### 1. Test Backend Directly

```bash
curl -X POST http://localhost:8000/search \
  -H "Content-Type: application/json" \
  -d '{"query": "bluetooth headphones", "top_k": 5}'
```

### 2. Test Frontend

1. Open `http://localhost:5173`
2. Sign in
3. Search for products (e.g., "wireless headphones under 2000")
4. Products from Amazon, Flipkart, and Meesho will appear

## Features

### Real API Integration
- Fetches live product data from Amazon and Flipkart
- Falls back to mock data if API keys not configured

### Vector Search
- Uses sentence-transformers for semantic embeddings
- FAISS for fast similarity search
- Finds products matching query intent, not just keywords

### LLM Recommendations
- OpenAI GPT-4 analyzes product options
- Provides reasoning for recommendations
- Considers price, ratings, features, and user preferences

### User Preferences
- Store user shopping preferences as vectors
- Personalized recommendations based on past preferences
- Semantic matching of preferences to products

## Architecture

```
Frontend (React + Convex)
    ↓
Convex Actions (convex/pythonBackend.ts)
    ↓
Python Backend (FastAPI)
    ↓
├── E-commerce APIs (Amazon, Flipkart)
├── Vector Store (FAISS)
└── LLM (OpenAI GPT-4)
```

## Troubleshooting

### Backend won't start
- Check Python version: `python --version` (need 3.9+)
- Install dependencies: `pip install -r requirements.txt`
- Check port 8000 is available

### No products showing
- Verify backend is running at `http://localhost:8000`
- Check API keys in `backend/.env`
- Look at backend console for error messages
- System will use mock data if APIs fail

### FAISS errors
- Install FAISS: `pip install faiss-cpu`
- For GPU: `pip install faiss-gpu`

### OpenAI errors
- Verify API key is valid
- Check you have credits in OpenAI account
- System will use fallback logic if OpenAI unavailable

## Development Notes

### Mock Data
Without API keys, the system uses mock data for:
- Amazon products
- Flipkart products
- Meesho products

### Vector Indices
FAISS indices are saved to disk:
- `products.faiss` - Product embeddings
- `products_meta.pkl` - Product metadata
- `user_prefs.faiss` - User preference embeddings
- `user_prefs_meta.pkl` - Preference metadata

### API Rate Limits
- RapidAPI free tier: Limited requests/month
- OpenAI: Pay per token
- Consider caching for production

## Next Steps

1. Add more e-commerce platforms
2. Implement price tracking
3. Add product comparison features
4. Enhance recommendation algorithm
5. Add user authentication to backend
6. Deploy to production (Vercel + Railway/Render)
