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
   The Logic: Implemented a detection threshold for "Card Testing" bots.

    The Finding: Identified that 3 transactions within 24 hours for nominal amounts (₹1.00 - ₹3.00) serve as a leading indicator for future high-value fraud.

    Action: By catching 'Anshu Kant' at this stage, the system prevents the "Big Move" before it happens.
   ![Fraud Scatter Plot](Screenshots/scatter_plot.png)

*The red dot on the far right represents Amit Shah (High Value), and the high-point represents Anshu Kant (High Velocity).*
   
3. **Location Risk:** Isolated high-value anomalies by filtering for "UNKNOWN" and "International" locations.
   The Logic: Correlated customer transaction history with geographical metadata.

   The Finding: Flagged transactions in Dubai and London for customers with no prior international travel profile.

    The Red Flag: Highlighted that 100% of high-value outliers (like Amit Shah’s ₹50,000) occurred in "UNKNOWN" locations, indicating a bypass of standard             merchant GPS tagging
4. **Data Integrity:** Built a SQL pipeline to neutralize "dirty" data that often hides fraudulent patterns.
   The Logic: Created a robust SQL preprocessing layer to handle "Injected" or "Messy" data.

    The Finding: Standardized inconsistent currency formats (e.g., converting $, NULL strings, and whitespace) into a unified decimal format.

    The Value: Proved that fraud analysis is only as good as the data cleaning—preventing "False Negatives" caused by formatting errors.
