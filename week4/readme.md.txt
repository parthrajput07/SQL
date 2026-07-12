# Azure Cloud Fundamentals and Data Pipeline Implementation using Azure Data Factory

## Overview

This project demonstrates the implementation of an end-to-end data pipeline using Microsoft Azure services. The pipeline reads a CSV file from Azure Blob Storage, validates the file metadata, and copies it to a destination location using Azure Data Factory (ADF).

---

## Objective

- Understand Azure cloud fundamentals.
- Create and manage Azure resources.
- Build a data pipeline using Azure Data Factory.
- Validate file metadata using Get Metadata activity.
- Copy data between Blob Storage containers.

---

## Azure Services Used

- Azure Resource Group
- Azure Storage Account
- Azure Blob Storage
- Azure Data Factory (ADF)

---

## Project Architecture

```
Local CSV File
      │
      ▼
Azure Blob Storage (Source Container)
      │
      ▼
Azure Data Factory
   ├── Linked Service
   ├── Source Dataset
   ├── Get Metadata
   └── Copy Data
      │
      ▼
Azure Blob Storage (Destination Container)
```

---

## Tasks Completed

### Task 1
- Created Resource Group

### Task 2
- Created Storage Account
- Created Blob Container
- Uploaded Superstore.csv

### Task 3
- Created Azure Data Factory
- Explored Author, Monitor, and Manage sections
- Created Linked Service
- Created Source Dataset
- Created Destination Dataset
- Configured Get Metadata activity

### Task 4
- Built pipeline using Copy Data activity
- Configured source and destination datasets

### Task 5
- Executed the pipeline successfully using Debug/Trigger
- Verified successful pipeline execution

### Task 6
- Assigned required IAM Roles (Reader and Contributor)

---

## Pipeline Workflow

1. Upload CSV file to Azure Blob Storage.
2. Create Linked Service connecting ADF to Storage Account.
3. Create Source and Destination datasets.
4. Retrieve file metadata using Get Metadata activity.
5. Copy CSV file using Copy Data activity.
6. Validate successful execution through ADF Monitor.

---

## Dataset Used

- Superstore.csv

---

## Output

- Resource Group created successfully.
- Storage Account created.
- CSV uploaded to Azure Blob Storage.
- Metadata validated successfully.
- Data copied successfully to destination.
- Pipeline executed with **Succeeded** status.

---

## Screenshots

- Resource Group
- Storage Account
- Blob Container
- Linked Service
- Dataset
- Get Metadata Activity
- Pipeline Design
- Pipeline Execution
- IAM Role Assignment

---

## Technologies Used

- Microsoft Azure
- Azure Blob Storage
- Azure Data Factory
- CSV Dataset

---

## Author

**Parth Rajput**

Celebal Technologies Internship - Week 4 Assignment