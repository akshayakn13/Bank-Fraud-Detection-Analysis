Project Overview

In the modern banking sector, raw transaction data is often fragmented and "noisy." This project demonstrates a complete analytical pipeline designed to protect bank assets by identifying fraudulent behavior before financial loss occurs.

By simulating a real-world banking environment, I transformed "dirty" transaction logs into a high-fidelity fraud monitoring system.
Core Objectives

    Data Integrity: Cleanse and standardize raw banking strings (currency symbols, inconsistent casing, and missing values).

    Behavioral Logic: Implement "Velocity Gates" to detect rapid-fire bot transactions (Card Testing).

    Risk Categorization: Isolate high-value anomalies and geographical outliers.
## 💡 Key Analytical Insights
> *How I translated raw data into banking security intelligence:*

1. **Velocity Tracking:** Found that 3+ daily transactions are a fingerprint for bot-driven card testing.
2. **Location Risk:** Isolated high-value anomalies by filtering for "UNKNOWN" and "International" locations.
3. **Data Integrity:** Built a SQL pipeline to neutralize "dirty" data that often hides fraudulent patterns.
