# Step 01: Project Information Gathering

**Objective:** Collect essential project information and create project identifier.

---

## 1. Project Information Collection

Ask the user for the following project details:

### Required Information

**1. Project Name**
- What is the name of this project?

**2. Project Description**
- Provide a brief description (2-3 sentences) of what this project aims to deliver.

**3. Client Information**
- Client name or organization
- Primary contact person (if applicable)
- Client technical level (tech-savvy, semi-technical, non-technical)

**4. Initial Requirements**
- What are the high-level requirements or goals?
- What problem does this project solve?
- What's the expected outcome or deliverable?

**5. Project Type** (select one or more):
- Web Application
- Mobile Application
- Dashboard/Analytics
- E-commerce/Shopify
- Automation Workflow
- Infrastructure/AWS
- Integration Project
- Other (specify)

**6. Timeline Expectations**
- Target completion date (if known)
- Any hard deadlines or milestones

**7. Technology Stack** (if known):
- Frontend framework preference
- Backend technology preference
- Database preference
- Hosting/infrastructure preference

---

## 2. Generate Project Slug

Create a URL-friendly project identifier:

```
project-slug = lowercase(project-name) with spaces replaced by hyphens
Example: "Client Portal Dashboard" → "client-portal-dashboard"
```

---

## 3. Document Initial Information

Create temporary notes (you'll finalize in step 04):

```yaml
project:
  name: [Project Name]
  slug: [project-slug]
  description: [Project Description]
  client:
    name: [Client Name]
    contact: [Contact Person]
    technical_level: [tech-savvy/semi-technical/non-technical]
  type: [Project Type(s)]
  timeline:
    target_completion: [Date or TBD]
    hard_deadlines: [Any deadlines]
  tech_stack:
    frontend: [Framework or TBD]
    backend: [Technology or TBD]
    database: [Database or TBD]
    hosting: [Hosting or TBD]
  requirements: |
    [High-level requirements summary]
  problem_statement: |
    [What problem this solves]
  expected_outcome: |
    [Expected deliverable or outcome]
```

---

## 4. Continue to Next Step

Present continuation menu:

```
✅ Project information collected!

Project: [Project Name]
Slug: [project-slug]
Client: [Client Name]

[C] Continue to Team Assignment
[E] Edit Information
```

**Actions:**
- **C (Continue)**: Load step-02-team-assignment.md
- **E (Edit)**: Re-run this step with corrections

**HALT and wait for user selection.**
