# DS Sales Forecasting

## Overview
This project demonstrates how sales data can be transformed, modeled, and used to generate business insights.  
It showcases an end-to-end workflow from raw data to forecasting.

## Tech Stack
- **dbt**: data cleaning + modeling
- **Python (pandas, Prophet)**: forecasting
- **Matplotlib/Seaborn**: visualization

## Workflow
1. Raw sales data → staged in dbt
2. Aggregated into daily sales fact table
3. Forecast next 30 days using Prophet
4. Visualize trends + predictions

## Next Steps
- Add anomaly detection for unusual sales spikes
- Deploy model in the cloud (Vertex AI / similar)
- Build dashboard in Tableau/Hex
