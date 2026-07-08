# Hospital Patient Outcomes Analysis
> *Analyzed hospital patient data to identify the factors influencing patient outcomes, discharge against medical advice, chronic disease burden, mortality, and clinical performance, providing actionable insights to improve healthcare quality and hospital decision-making.*

---

## ⚙️ Project Type

**End-to-End Healthcare Analytics Project**

**Techniques Used**
- [x] Data Cleaning / Wrangling
- [x] Exploratory Data Analysis (EDA)
- [x] SQL Analysis / Querying
- [x] Dashboard / Data Visualization

---

## Table of Contents
1. [Project Overview](#1-project-overview)
2. [Objectives](#2-objectives)
3. [Project Scope & Tools](#3-project-scope--tools)
4. [Repository Structure](#4-repository-structure)
5. [Data Workflow](#5-data-workflow)
6. [Data Model & Schema](#6-data-model--schema)
7. [ERD - Entity Relationship Diagram](#7-erd---entity-relationship-diagram)
8. [Analysis & Metrics](#8-analysis--metrics)
9. [Key Insights](#9-key-insights)
10. [Recommendations](#10-recommendations)
11. [Limitations](#11-limitations)
12. [Deliverables](#12-deliverables)
13. [Author](#13-author)
---

## 1. Project Overview
**Context:**

Over several years, a specialist hospital accumulated a large volume of patient demographic, clinical, admission, and health outcome data while serving a diverse patient population.

Although this growing dataset captured valuable information about patient care and hospital operations, it remained underutilized for identifying trends, evaluating performance, and supporting evidence-based decision-making.

---

**Problem Statement:**

**Context:**

Over several years, a specialist hospital accumulated a large volume of patient demographic, clinical, admission, and health outcome data while serving a diverse patient population.

Although this growing dataset captured valuable information about patient care and hospital operations, it remained underutilized for identifying trends, evaluating performance, and supporting evidence-based decision-making.

**Problem Statement:**

Hospital management observed increasing rates of patients discharged against medical advice (DAMA), a growing burden of chronic diseases, and concerning mortality trends among certain patient groups.

However, the underlying patient, clinical, and operational factors driving these outcomes were not well understood, limiting the hospital's ability to implement targeted quality improvement initiatives.

**Approach:**

The dataset was first prepared for analysis by correcting data types, standardizing date fields, and resolving formatting issues to ensure successful import into PostgreSQL.

SQL was then used to analyze patient demographics, diagnoses, lifestyle factors, admission records, physician workload, and hospital outcomes, uncovering patterns associated with discharge against medical advice (DAMA), chronic disease prevalence, mortality, and provider performance.

These findings were synthesized into actionable operational and clinical insights to support evidence-based hospital decision-making.

**Outcome:**

The analysis identified the demographic, clinical, lifestyle, and operational factors associated with mortality and discharge against medical advice (DAMA).

It quantified the burden of chronic diseases, evaluated physician workload across specialties, and generated evidence-based recommendations to improve patient care, optimize resource allocation, and strengthen overall hospital performance.

## 2. Objectives

- **Primary Objective:** Identify the demographic, clinical, lifestyle, and operational factors influencing patient outcomes, including mortality and discharge against medical advice (DAMA), to support evidence-based healthcare decision-making.

- **Secondary Objective 1:** Quantify the prevalence and impact of chronic diseases, lifestyle factors, and patient demographics on hospital outcomes.

- **Secondary Objective 2:** Evaluate physician workload and specialization to identify variations in clinical performance and potential operational inefficiencies.

- **Secondary Objective 3:** Develop actionable, data-driven recommendations to improve patient care, optimize resource allocation, and enhance overall hospital performance.

## 3. Project Scope & Tools

### Scope

| Dimension | Details |
|-----------|---------|
| **In Scope** | Analysis of patient demographics, discharge against medical advice (DAMA), mortality, chronic disease prevalence, lifestyle risk factors, physician specialization, and workload using patient, admission, doctor, and risk factor data. |
| **Out of Scope** | No data domains were intentionally excluded. The analysis covered all variables available within the provided dataset. |
| **Granularity** | Patient-level analysis integrating demographic, admission, physician, and lifestyle risk factor records to evaluate hospital outcomes. |

### Tools & Technologies

| Category | Tool(s) Used |
|----------|--------------|
| **Data Storage** | CSV Files, PostgreSQL |
| **Data Processing** | Microsoft Excel, SQL |
| **Analysis** | PostgreSQL (SQL Views & Analytical Queries) |
| **Visualization** | Tableau |
| **Version Control** | Git, GitHub |
| **Documentation** | Markdown |
| **Other** | pgAdmin 4 |
---

## 4. Repository Structure

```text
hospital-patient-outcomes-analysis/
│
├── data/
│   ├── raw/
│   ├── processed/
│   └── README.md
│
├── queries/
│
├── dashboard/
│   └── README.md
│
├── reports/
│
├── visuals/
│
├── docs/
│
└── README.md
```

## 5. Data Workflow

```text
CSV Source Files
        ↓
Data Preparation (Microsoft Excel)
        ↓
PostgreSQL (pgAdmin Import)
        ↓
Table Integration & SQL Views
        ↓
Analytical SQL Queries
        ↓
Tableau Dashboards & Project Report
```

1. **Source:** The project used four relational datasets provided as CSV files: **Patient Details**, **Admission Details**, **Doctors**, and **Risk Factors**, containing demographic, clinical, physician, and lifestyle information.

2. **Ingestion:** The datasets were prepared in Microsoft Excel by correcting data types, standardizing date fields, and resolving formatting issues before being imported into PostgreSQL using the pgAdmin Import Tool.

3. **Integration & Transformation:** Primary and foreign key relationships were established across the four tables to create a relational database. SQL joins, Common Table Expressions (CTEs), and SQL views were then used to integrate patient, admission, physician, and lifestyle data into reusable analytical datasets.

4. **Analysis:** Analytical SQL queries were developed to calculate mortality, discharge against medical advice (DAMA), and chronic disease prevalence rates, while examining patient demographics, lifestyle risk factors, physician workload, and clinical performance across specialties.

5. **Output:** The project produced reusable SQL views, Tableau dashboards, visualizations, and an executive report containing evidence-based insights and recommendations to support hospital management and patient care decisions.

## 6. Data Model & Schema
### Dataset Overview

| Table | Purpose | Primary Key | Relationship |
|-------|---------|-------------|--------------|
| **Patient_Details** | Stores patient demographic information, occupation, education, and clinical characteristics. | `patient_id` | Linked to `Admission_Details` and `Risk_Factors` via `patient_id`. |
| **Admission_Details** | Contains admission, discharge, diagnosis, and hospital outcome information. | `admission_id` | Linked to `Patient_Details` via `patient_id` and `Doctors` via `doctor_id`. |
| **Doctors** | Stores physician information, specialization, and assigned patients. | `doctor_id` | Linked to `Admission_Details` via `doctor_id`. |
| **Risk_Factors** | Contains patient lifestyle and behavioral risk factors. | `patient_id` | Linked to `Patient_Details` via `patient_id`. |

> **Dataset Structure:** Four relational tables linked using patient and physician identifiers to support integrated healthcare analytics.

---

## 7. ERD - Entity Relationship Diagram

![Entity Relationship Diagram](visuals/DAMA%20ERD.png)

*Entity Relationship Diagram (ERD) illustrating the relational database schema. The analysis integrates patient demographics, admission records, physician information, and lifestyle risk factors through primary and foreign key relationships.*

---

### Table Relationships Summary

| Relationship | Join Key | Cardinality |
|--------------|----------|-------------|
| `Patient_Details` → `Admission_Details` | `patient_id` | One-to-Many |
| `Patient_Details` → `Risk_Factors` | `patient_id` | One-to-One |
| `Doctors` → `Admission_Details` | `doctor_id` | One-to-Many |

> **Dataset Size:** Approximately **2,017** patient records distributed across four relational tables.

---

## 8. Analysis & Metrics

### Analytical Approach

### Analytical Approach

This project followed an exploratory and descriptive analytical approach to investigate the patient, clinical, and operational factors associated with hospital outcomes.

SQL was used to integrate patient demographics, admission records, physician information, and lifestyle risk factors into a relational dataset, enabling comparisons across patient groups, chronic disease prevalence, discharge against medical advice (DAMA), mortality, and physician workload.

Key performance metrics, including mortality rates, DAMA rates, disease prevalence, and physician workload, were calculated and analyzed across relevant demographic and clinical dimensions. The resulting insights were translated into operational and clinical recommendations to support evidence-based decision-making and improve hospital performance.

### Key Metrics Defined

| Metric | Plain-Language Definition | Why It Matters |
|--------|--------------------------|----------------|
| **Mortality Rate** | The percentage of patients who died within a defined patient group, diagnosis, or clinical specialty. | Identifies high-risk patient groups and clinical areas requiring targeted intervention. |
| **DAMA Rate** | The percentage of patients discharged against medical advice within a defined patient group or category. | Helps identify populations at greater risk of incomplete treatment and barriers to continuity of care. |
| **Disease Prevalence Rate** | The proportion of patients diagnosed with a specific chronic disease within the study population. | Measures disease burden and supports resource planning and preventive healthcare initiatives. |
| **Patient Volume** | The total number of patients within a demographic group, diagnosis, or physician's workload. | Provides context for interpreting mortality, disease burden, and physician workload, ensuring findings are assessed alongside the number of patients affected. |

### Methods Used

- **Descriptive Statistics:** Summarized patient demographics, hospital outcomes, and chronic disease burden using counts, percentages, and rates.
- **Group Comparison:** Compared mortality and discharge against medical advice (DAMA) across age groups, occupations, chronic diseases, lifestyle factors, physician specialties, and individual doctors.
- **Relational Data Analysis:** Integrated patient, admission, physician, and risk factor data using SQL joins to enable cross-table analysis.
- **SQL Views & Common Table Expressions (CTEs):** Created reusable SQL views and CTEs to organize analytical logic and support downstream reporting.
- **Conditional Aggregation:** Used SQL aggregate functions with conditional logic to calculate mortality rates, DAMA rates, disease prevalence, and physician workload metrics.
- **Data Visualization:** Presented key findings through Tableau dashboards to communicate operational and clinical insights.

---

## 9. Key Insights

## Key Insights

### Insight 1: Socioeconomic barriers may be contributing to poorer patient outcomes.

Mortality and discharge against medical advice (DAMA) were both concentrated among patients in the **Basic occupation** category, particularly within the Adult (25–44), Middle-Aged (45–64), and Senior (65–79) age groups. This suggests that socioeconomic barriers may be limiting access to continuous care and successful treatment completion, highlighting the need for targeted support for financially vulnerable patient populations.

---

### Insight 2: Financial hardship is the primary factor driving treatment discontinuation.

Financial-related reasons accounted for **87.68%** of all recorded DAMA cases, representing **242 of the 275** patients discharged against medical advice. This indicates that financial constraints, rather than clinical recovery, are the principal barrier to treatment completion, suggesting that improving financial support services could substantially reduce avoidable DAMA cases.

---

### Insight 3: Disease prevalence alone may not be sufficient for prioritizing clinical resources.

Stroke (23.48%) and Chronic Kidney Disease (21.92%) were the most prevalent chronic illnesses, yet **Diabetes recorded the highest mortality rate (30.72%)**. This suggests that allocating clinical resources based solely on disease prevalence may overlook conditions with the greatest mortality burden. Resource planning should therefore consider both disease frequency and outcome severity to better target high-risk patient populations.

---

### Insight 4: Medication-related risk factors may warrant closer clinical surveillance.

NSAID use recorded the highest mortality rate (**16.35%**) among the lifestyle factors examined and affected the largest patient population. This suggests that medication-related exposures contribute meaningfully to adverse patient outcomes and should be considered when identifying patients who require closer monitoring and preventive interventions.

---

### Insight 5: Mortality patterns indicate the need to evaluate clinical workload and service delivery.

Emergency Medicine, Cardiology, and Nephrology demonstrated both high patient workloads and elevated mortality, while General Surgery recorded exceptionally high mortality despite a relatively lower patient volume. These findings suggest that differences in workload distribution, case complexity, or clinical care processes may be influencing patient outcomes and should be investigated through targeted clinical and operational audits.

## 10. Recommendations

| Priority | Recommendation | Based On | Suggested Owner |
|----------|---------------|----------|-----------------|
| **High** | Establish structured financial counselling, flexible payment plans, and medical social support for patients identified as being at high risk of discharge against medical advice (DAMA). | **Insight 2:** Financial hardship is the primary factor driving treatment discontinuation. | Hospital Management, Finance Department, Medical Social Services |
| **High** | Prioritize clinical resources, medication availability, and routine monitoring for Diabetes, Chronic Kidney Disease (CKD), and Stroke to reduce preventable mortality among high-risk patients. | **Insight 3:** Disease prevalence alone may not be sufficient for prioritizing clinical resources. | Clinical Leadership, Internal Medicine, Pharmacy Department |
| **Medium** | Introduce targeted patient education and medication review for patients with chronic NSAID use to reduce medication-related risks and improve clinical surveillance. | **Insight 4:** Medication-related risk factors may warrant closer clinical surveillance. | Clinical Governance Team, Pharmacy Department |
| **Medium** | Conduct operational and clinical audits within Emergency Medicine, Cardiology, General Surgery, and Nephrology to evaluate workload distribution, case complexity, and potential process inefficiencies affecting patient outcomes. | **Insight 5:** Mortality patterns indicate the need to evaluate clinical workload and service delivery. | Hospital Operations, Clinical Leadership, Quality Improvement Team |
| **Medium** | Develop targeted patient support programs for socioeconomically vulnerable populations through early identification, discharge planning, and community support initiatives to improve treatment adherence and continuity of care. | **Insight 1:** Socioeconomic barriers may be contributing to poorer patient outcomes. | Hospital Management, Care Coordination Team, Medical Social Services |

## 11. Limitations

- A significant proportion of records in the **Education** field were missing, limiting the ability to evaluate how educational attainment may influence patient outcomes, treatment adherence, or discharge against medical advice (DAMA).

- The absence of complete educational data means that any relationship between patient education and hospital outcomes could not be reliably assessed. A more comprehensive dataset would enable demographic risk stratification that includes educational status alongside age, occupation, and lifestyle factors.

## 12. Deliverables

| Deliverable | Description | Location |
|-------------|-------------|----------|
| **Project Documentation** | Complete project documentation, methodology, findings, recommendations, and supporting materials. | [`README.md`](README.md) |
| **Dataset** | Access to the datasets used in the analysis (see the `data` folder for dataset links and documentation). | [`data/`](data/) |
| **SQL Queries** | SQL scripts used for data transformation, and analytical queries. | [`queries/`](queries/) |
| **Tableau Dashboard** | Interactive dashboard visualizing hospital outcomes, DAMA, chronic disease burden, and physician performance. | [`dashboard/`](dashboard/) |
| **Project Report** | Executive report summarizing key findings, recommendations, and business implications. | [`reports/`](reports/) |
| **Project Visuals** | Entity Relationship Diagram (ERD) and dashboard screenshots used throughout the project. | [`visuals/`](visuals/) |
| **Supporting Documentation** | Data dictionary, documentation, and supplementary project notes. | [`docs/`](docs/) |
---

## 13. Author

## About the Author

**Ibukunoluwa Olanrewaju**  
Healthcare Data Analyst

- 🔗 LinkedIn: [Ibukunoluwa Olanrewaju](https://www.linkedin.com/in/ibukunoluwa-olanrewaju)
- 📧 Email: ibukunolanrewaju01@gmail.com
