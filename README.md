***Risk and Reward Analysis Project***

This repository contains 10 different MATLAB/Python codes for risk and reward analysis using portfolio optimization techniques. Each script is designed with varying risk profiles and reward scenarios, ranging from low to high risk. The equity portion is gradually increased from Portfolio 1 to Portfolio 10, with a corresponding increase in international exposure.

__Project Structure__

data file.xlsx: Contains all financial data, including index members and asset returns.
Core Code: All codes use PortfolioCVaR to optimize portfolios based on Conditional Value-at-Risk (CVaR).
Scenario Generation: The mvnrnd function is used to generate scenarios for portfolio simulations.
Files

__Low Risk Portfolios (1-3)__
These portfolios have a higher allocation to bonds and money market instruments.

Low Risk Portfolio 1 (low_risk_code1.m)

Focuses heavily on bonds and money market instruments with minimal equity exposure.
Designed for highly risk-averse investors.
Low Risk Portfolio 2 (low_risk_code2.m)

Slightly increased exposure to equities while retaining a bond-heavy portfolio.
Low Risk Portfolio 3 (low_risk_code3.m)

Balanced allocation between bonds and a small portion of equities, with low international exposure.

__Medium Risk Portfolios (4-7)__
These portfolios gradually increase the equity allocation and introduce more international exposure.
4. Medium Risk Portfolio 4 (medium_risk_code4.m)

Moderate exposure to both bonds and equities, with growing international assets.
Medium Risk Portfolio 5 (medium_risk_code5.m)

Balanced exposure to global bonds, equities, and real assets like REITs.
Medium Risk Portfolio 6 (medium_risk_code6.m)

Higher equity exposure with a mix of international equities and bonds.
Medium Risk Portfolio 7 (medium_risk_code7.m)

A mix of global bonds, equities, and commodities, tailored for moderate risk tolerance.

__High Risk Portfolios (8-10)__
These portfolios are heavily skewed toward equities, with increasing international exposure.
8. High Risk Portfolio 8 (high_risk_code8.m)

High equity exposure with significant international investments.
High Risk Portfolio 9 (high_risk_code9.m)

Focuses on equities and high-risk assets such as global equities and REITs.
High Risk Portfolio 10 (high_risk_code10.m)

Maximized equity exposure, designed for aggressive investors seeking high returns. Includes substantial international exposure.
How to Run the Codes

Download the data file.xlsx and any of the code files you want to run.
Open the code file in MATLAB or Python.
Ensure that the necessary dependencies are installed (e.g., __Financial Toolbox in MATLAB__).
Run the script to generate portfolio weights and analyze risk and return profiles.
View the output pie charts and frontier plots for detailed insights.
Portfolio Risk and Return Metrics

The portfolio optimization is based on the following metrics:

Annualized Return: Computed by multiplying monthly returns by 12.
Annualized Risk: Derived from portfolio risk metrics using estimatePortRisk.
Portfolio CVaR: Optimized to minimize Conditional Value-at-Risk (CVaR) at the 90% confidence level.
Example Pie Chart and Frontier Plot

The pie charts represent portfolio allocations across different assets, while the efficient frontier plots showcase the risk-return trade-offs for each portfolio.
