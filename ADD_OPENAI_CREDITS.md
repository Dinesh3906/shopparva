# 💳 How to Add OpenAI Credits (5 Minutes)

## Why Add Credits?

Your OpenAI API key is valid, but needs credits to use GPT-4 for AI recommendations.

**Cost**: $5-10 (lasts for months of usage)
**Benefit**: Smart AI-powered product recommendations with reasoning

## Step-by-Step Guide

### 1. Go to OpenAI Billing
Visit: https://platform.openai.com/settings/organization/billing

### 2. Add Payment Method
- Click "Add payment method"
- Enter credit/debit card details
- Save

### 3. Add Credits
- Click "Add to credit balance"
- Choose amount: $5 or $10 recommended
- Confirm purchase

### 4. Wait for Activation
- Credits activate in 2-5 minutes
- You'll get email confirmation

### 5. Restart Your Backend
```bash
# Stop backend (Ctrl+C in backend terminal)
# Then restart:
python backend/main_lite.py
```

### 6. Test AI Recommendations
```bash
# Test the recommendation endpoint:
curl -X POST http://localhost:8000/recommend \
  -H "Content-Type: application/json" \
  -d '{"query": "best wireless mouse under 1000", "top_k": 5}'
```

## What You Get

### Without Credits (Current)
- Basic recommendation logic
- Selects top-rated product
- Simple reasoning

### With Credits (After Adding)
- GPT-4 powered analysis
- Considers multiple factors:
  - Value for money
  - User ratings
  - Brand reputation
  - Feature matching
- Detailed reasoning (2-3 sentences)
- Personalized recommendations

## Example Comparison

### Basic Logic (No Credits)
```json
{
  "product_name": "Logitech M185",
  "reasoning": "Top-rated option at ₹599"
}
```

### AI-Powered (With Credits)
```json
{
  "product_name": "Logitech M185",
  "reasoning": "The Logitech M185 offers exceptional value at ₹599 with a 4.3 rating from over 15,000 reviews. Its reliable wireless connectivity and 1-year battery life make it perfect for daily use, while the trusted Logitech brand ensures quality and durability within your budget."
}
```

## Cost Breakdown

| Usage | Approximate Cost |
|-------|-----------------|
| 100 recommendations | ~$0.50 |
| 500 recommendations | ~$2.50 |
| 1000 recommendations | ~$5.00 |

**$5 credit = ~1000 AI recommendations** (plenty for testing and demo)

## Alternative: Keep Using Without AI

Your app works great without OpenAI credits:
- ✅ Real Amazon products
- ✅ All features functional
- ✅ Basic recommendations
- ✅ Price comparison
- ✅ Wishlist, deals, kits

**You can add credits anytime later!**

## Troubleshooting

### "Payment method declined"
- Try different card
- Check international payments enabled
- Contact your bank

### "Credits not showing"
- Wait 5-10 minutes
- Refresh billing page
- Check email for confirmation

### "Still getting quota error"
- Restart backend after adding credits
- Wait 10 minutes for propagation
- Check billing page shows positive balance

## Need Help?

- OpenAI Support: https://help.openai.com/
- Check billing: https://platform.openai.com/settings/organization/billing
- View usage: https://platform.openai.com/usage

---

**Remember**: Your app works great right now with real Amazon data. OpenAI credits are just an enhancement for smarter recommendations!
