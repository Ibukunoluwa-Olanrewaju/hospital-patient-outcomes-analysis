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
## Key Insights



### Insight 1: Socioeconomic vulnerability is associated with poorer clinical outcomes.

Mortality and discharge against medical advice (DAMA) were both concentrated among patients in the **Basic occupation** category, particularly within the Adult (25–44), Middle-Aged (45–64), and Senior (65–79) groups. This pattern suggests that socioeconomic vulnerability may adversely influence treatment adherence, continuity of care, and overall clinical outcomes, highlighting the need for targeted support for high-risk patient populations.

---

### Insight 2: Financial barriers are the predominant driver of treatment discontinuation.

Financial reasons accounted for **87.68%** of all DAMA cases, with financial constraint and financial incapability responsible for 242 of the 275 recorded instances. This indicates that affordability, rather than clinical recovery, is the principal reason patients discontinue inpatient care, emphasizing the importance of financial counselling and patient support services.

---

### Insight 3: Disease prevalence does not necessarily correspond to the greatest mortality burden.

Stroke and Chronic Kidney Disease (CKD) were the most prevalent chronic illnesses, yet Diabetes recorded the highest mortality rate (**30.72%**). This demonstrates that the conditions placing the greatest burden on hospital resources are not always those associated with the poorest clinical outcomes, reinforcing the need to prioritize both disease prevalence and mortality risk in clinical resource planning.

---

### Insight 4: Medication-related exposure may represent an under-recognized contributor to adverse patient outcomes.

NSAID use involved the largest patient population and recorded the highest mortality rate (**16.35%**) among the lifestyle factors analyzed. This finding suggests that medication-related risk factors warrant closer clinical surveillance, particularly among patients with chronic diseases who may already be at elevated risk of adverse outcomes.

---

### Insight 5: Mortality patterns indicate potential operational pressure within high-burden clinical specialties.

Emergency Medicine, Cardiology, and Nephrology demonstrated a combination of high clinical workload and elevated mortality, while General Surgery recorded exceptionally high mortality despite lower patient volume. These findings suggest that workload distribution, case complexity, and clinical care processes should be further evaluated to optimize patient outcomes and service delivery.

## 10. Recommendations

<!--
  Action-oriented. Addressed to a real audience.
  Tied explicitly to the insight that supports each one.

  WHAT GOOD LOOKS LIKE:
  Priority: High
  Recommendation: "Conduct a fulfilment audit for home goods deliveries
                   in Region A - specifically investigating whether returns
                   correlate with a particular warehouse, carrier, or SKU batch."
  Based On: Insight 1 - return rate anomaly in Region A
  Owner: Operations / Supply Chain team

  WHAT TO AVOID:
  ❌ "Improve the return rate."
     (Not actionable. Doesn't say who, how, or where to start.)
  ❌ "Further analysis is needed."
     (This is a placeholder, not a recommendation.)
-->

| Priority | Recommendation | Based On | Suggested Owner |
|----------|---------------|----------|-----------------|
| High | [Specific, actionable step] | [Insight it comes from] | [Who should act] |
| Medium | [Specific, actionable step] | [Insight it comes from] | [Who should act] |
| Low | [Exploratory or longer-term suggestion] | [Insight it comes from] | [Who should act] |

---

## 11. Assumptions & Limitations

<!--
  WHAT GOOD LOOKS LIKE:
  Assumption: "Transaction records were assumed to be complete for all five regions.
               No validation was performed against source system record counts."
  Limitation: "The analysis cannot distinguish between returns initiated by
               the customer vs. returns initiated by the business (e.g., recalls).
               If business-initiated returns are concentrated in Region A, the
               return rate finding may reflect a policy decision, not a quality issue."

  WHAT TO AVOID:
  ❌ Leaving this section blank or writing "None known."
     Every project has limitations. Documenting them is a sign of
     analytical maturity - not a confession of failure.
-->

### Assumptions
- [What did you treat as true without being able to verify?]
- [What simplifications did you make for scope or feasibility?]
- [What domain rules or definitions did you accept as given?]

### Limitations
- [What gaps exist in the data?]
- [What analysis was out of scope but could affect interpretation?]
- [What would a more rigorous version of this project include?]
- [Are there known biases in the data source or collection method?]

> *The goal here is pre-emptive Q&A. What would a thoughtful skeptic push back on? Document the answer here, before they ask.*

---

## 12. Future Enhancements

<!--
  WHAT GOOD LOOKS LIKE:
  ✅ "Automate the monthly data pull from the POS export folder using
      a scheduled Python script, replacing the current manual process."
  ✅ "Expand the return rate analysis to include carrier-level data,
      which was unavailable in this dataset but exists in the logistics system."

  WHAT TO AVOID:
  ❌ "Add a machine learning model."
     (Vague, and disconnected from the actual findings of this project.)
  ❌ Listing aspirational features that don't follow logically from the work.
-->

- [ ] [Enhancement 1 - specific and traceable to a real gap in this project]
- [ ] [Enhancement 2]
- [ ] [Enhancement 3]
- [ ] [Enhancement 4]

---

## 13. Deliverables

| Deliverable | Description | Location |
|-------------|-------------|----------|
| [Name] | [What it contains] | [`/path/to/file`] |
| [Name] | [What it contains] | [`/path/to/file`] |
| [Name] | [What it contains] | [`/path/to/file`] |

---

## 14. Author

**[Your Name]**
[Your role or title - current or target]

- 🔗 [LinkedIn URL]
- 💼 [Portfolio or GitHub profile URL]
- 📧 [Email - optional]

---

*Last updated: [Month YYYY]*
*If this template helped you, consider starring the repository.*
