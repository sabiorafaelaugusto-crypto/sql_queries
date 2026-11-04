# SaaS Marketing Funnel Analysis with SQL

A practical SQL (SQLite) case study for **Marketing Operations** at a SaaS company: tracking the journey from lead acquisition to paid subscription, measuring channel efficiency, conversion rates, and revenue.

> **Note on the data:** The database is **synthetic** and contains no real customer information. It is generated via a deterministic script—anyone running `00-setup.sql` will get identical results.

## Scenario

A sales automation software company invests in 12 campaigns across 8 channels (Google Ads, LinkedIn Ads, Meta Ads, Email, Webinars, Organic Content, Events, and Referrals). As a Marketing Ops analyst, your goal is to answer:

- Which channels and campaigns drive actual revenue rather than just lead volume?
- Where does the funnel (lead → trial → subscription) suffer the highest drop-off?
- What is the Cost Per Lead (CPL) and Customer Acquisition Cost (CAC) for each campaign?
- Is email engagement correlated with conversion?
- How do churn and MRR trend over time?

## Data Model

```mermaid
erDiagram
    campaigns ||--o{ leads : "generates"
    leads ||--o| trials : "initiates"
    leads ||--o| subscriptions : "converts to"
    leads ||--o{ email_events : "receives"
