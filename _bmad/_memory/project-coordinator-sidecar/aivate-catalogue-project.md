# Aivate Catalogue - Portfolio Website Project

**Project Type:** Internal Portfolio/Showcase Website
**Status:** 🟢 Initiated
**Created:** 2026-02-03
**Coordinator:** Nova
**Lead Developer:** TBD (Cob/Marky/Fiona)
**Priority:** MEDIUM

---

## 📋 Project Overview

A premium, simple portfolio website showcasing Aivate's capabilities across three service categories:
1. Landing Pages
2. Dashboard/Admin Systems
3. Workflow Automation (n8n)

**Purpose:** Client-facing brochure/catalog to demonstrate Aivate's work and capabilities

---

## 🎯 Project Structure

### Page 1: Landing Page (Main Entry)
**URL:** `/` (root)
**Purpose:** Entry point with premium, simple design
**Content:**
- Aivate Catalogue branding/header
- Brief tagline or value proposition
- 3 prominent navigation buttons:
  1. "Landing Pages" → Page 2
  2. "Dashboard Systems" → Page 3
  3. "Workflow Automation" → Page 4

**Design Requirements:**
- Simple but premium aesthetic
- Clean, modern layout
- Minimal distractions
- Professional branding
- Responsive (mobile-friendly)

---

### Page 2: Landing Pages Portfolio
**URL:** `/landing-pages`
**Purpose:** Showcase all landing pages created by Aivate
**Content:**
- Grid/card layout of landing page projects
- Each project card includes:
  - Preview screenshot/thumbnail
  - Project name
  - Brief description (optional)
  - "View Live" button → Vercel deployment link
  - Technologies used (optional tags)

**Data Needed:**
- List of all landing page projects
- Vercel deployment URLs
- Screenshots/previews

---

### Page 3: Dashboard/Admin Systems Portfolio
**URL:** `/dashboard-systems`
**Purpose:** Showcase web admin, backoffice, and dashboard systems
**Content:**
- Grid/card layout of dashboard projects
- Each project card includes:
  - Preview screenshot
  - Project name
  - Brief description
  - "View Demo" button (if applicable)
  - Key features list
  - Technologies used

**Data Needed:**
- List of dashboard/admin projects
- Screenshots (can be multiple per project)
- Demo links (if available)

---

### Page 4: Workflow Automation Portfolio
**URL:** `/workflow-automation`
**Purpose:** Showcase n8n workflow implementations
**Content:**
- Grid/card layout of workflow projects
- Each workflow card includes:
  - Workflow diagram screenshot
  - Workflow name/type
  - Brief description of automation
  - Key features (triggers, actions, integrations)
  - Use case/industry

**Data Needed:**
- Screenshots of n8n workflows
- Workflow descriptions
- Use cases and benefits

---

## 🛠 Tech Stack (Recommended)

### Option 1: Next.js + Tailwind CSS (Recommended)
**Pros:**
- Fast, SEO-friendly
- Easy Vercel deployment
- Component reusability
- Great for portfolios

**Stack:**
- **Framework:** Next.js 14 (App Router)
- **Styling:** Tailwind CSS
- **UI Components:** shadcn/ui (optional)
- **Deployment:** Vercel
- **Image Optimization:** Next.js Image component

### Option 2: Static HTML + Tailwind CSS
**Pros:**
- Simplest approach
- No build process
- Direct deployment

**Stack:**
- **HTML/CSS/JS:** Vanilla
- **Styling:** Tailwind CSS (CDN)
- **Deployment:** Vercel or Netlify

### Option 3: React + Vite + Tailwind CSS
**Pros:**
- Fast development
- Modern tooling
- Component-based

**Stack:**
- **Framework:** React + Vite
- **Styling:** Tailwind CSS
- **Deployment:** Vercel

---

## 📂 Project Structure (Next.js Example)

```
aivate-catalogue/
├── app/
│   ├── page.tsx                    # Page 1: Landing
│   ├── landing-pages/
│   │   └── page.tsx                # Page 2: Landing Pages Portfolio
│   ├── dashboard-systems/
│   │   └── page.tsx                # Page 3: Dashboard Systems Portfolio
│   └── workflow-automation/
│       └── page.tsx                # Page 4: Workflow Automation Portfolio
├── components/
│   ├── Header.tsx                  # Shared header/nav
│   ├── Footer.tsx                  # Shared footer
│   ├── ProjectCard.tsx             # Reusable project card
│   └── WorkflowCard.tsx            # Workflow-specific card
├── data/
│   ├── landing-pages.json          # Landing page project data
│   ├── dashboards.json             # Dashboard project data
│   └── workflows.json              # Workflow project data
├── public/
│   ├── screenshots/
│   │   ├── landing-pages/
│   │   ├── dashboards/
│   │   └── workflows/
│   └── logo.svg
├── styles/
│   └── globals.css
├── package.json
├── tailwind.config.ts
└── README.md
```

---

## 🎨 Design System (To Be Generated)

**Recommendation:** Use Aurora + UI/UX Pro Max to generate design system

**Design Requirements:**
- Style: Premium + Minimalism
- Colors: Professional palette (to be determined)
- Typography: Clean, modern fonts
- Components: Buttons, cards, navigation
- Effects: Subtle shadows, smooth transitions

**Action Item:** Generate design system using Aurora:
```
"Generate a design system for a premium portfolio catalog website,
professional, minimalist, showcasing software development work"
```

---

## 📊 Data Collection Needed

Before building, collect:

### Landing Pages Data
```json
[
  {
    "id": 1,
    "name": "Project Name",
    "description": "Brief description",
    "url": "https://project.vercel.app",
    "screenshot": "/screenshots/landing-pages/project1.png",
    "technologies": ["Next.js", "Tailwind", "Vercel"]
  }
]
```

### Dashboard Systems Data
```json
[
  {
    "id": 1,
    "name": "Temp Power Systems CRM",
    "description": "Work order management system",
    "screenshots": [
      "/screenshots/dashboards/tps-dashboard.png",
      "/screenshots/dashboards/tps-work-order.png"
    ],
    "features": ["Work Orders", "Crew Management", "SOV"],
    "technologies": ["React", "PostgreSQL", "Salesforce API"]
  }
]
```

### Workflow Automation Data
```json
[
  {
    "id": 1,
    "name": "Invoice Processing Workflow",
    "description": "Automated invoice extraction and approval",
    "screenshot": "/screenshots/workflows/invoice-workflow.png",
    "useCase": "Accounts Payable Automation",
    "triggers": ["Email received"],
    "actions": ["Extract data", "Update database", "Send notification"],
    "integrations": ["Gmail", "QuickBooks", "Slack"]
  }
]
```

---

## 🚀 Development Phases

### Phase 1: Project Setup & Design (1-2 days)
- [x] Create project specification (this document)
- [ ] Generate design system using Aurora
- [ ] Choose tech stack (Next.js recommended)
- [ ] Initialize project repository
- [ ] Set up Vercel deployment

### Phase 2: Page 1 - Landing Page (1 day)
- [ ] Design layout (simple + premium)
- [ ] Implement header with Aivate branding
- [ ] Create 3 navigation buttons
- [ ] Add minimal content/tagline
- [ ] Make responsive

### Phase 3: Data Collection (1-2 days)
- [ ] Gather all landing page projects and URLs
- [ ] Collect dashboard screenshots and descriptions
- [ ] Take screenshots of n8n workflows
- [ ] Organize all assets in `/public/screenshots/`

### Phase 4: Page 2 - Landing Pages Portfolio (1 day)
- [ ] Create project card component
- [ ] Implement grid layout
- [ ] Add data from landing-pages.json
- [ ] Link to Vercel deployments
- [ ] Make responsive

### Phase 5: Page 3 - Dashboard Systems Portfolio (1 day)
- [ ] Reuse/adapt project card component
- [ ] Implement dashboard-specific layout
- [ ] Add data from dashboards.json
- [ ] Multiple screenshots per project (carousel/modal)
- [ ] Make responsive

### Phase 6: Page 4 - Workflow Automation Portfolio (1 day)
- [ ] Create workflow card component
- [ ] Implement workflow grid layout
- [ ] Add data from workflows.json
- [ ] Workflow diagram zoom/modal feature
- [ ] Make responsive

### Phase 7: Polish & Deploy (1 day)
- [ ] Add shared header/footer navigation
- [ ] Optimize images (Next.js Image)
- [ ] SEO metadata (title, description, OG tags)
- [ ] Test responsive design (mobile/tablet/desktop)
- [ ] Deploy to Vercel
- [ ] Share URL with team for review

---

## 🎯 Success Criteria

**Must Have:**
- ✅ 4 pages total (landing + 3 portfolio pages)
- ✅ Simple, premium design aesthetic
- ✅ All landing pages linked to live Vercel deployments
- ✅ Dashboard screenshots showcased professionally
- ✅ n8n workflow screenshots clearly displayed
- ✅ Mobile-responsive design
- ✅ Fast loading (optimized images)
- ✅ Deployed to Vercel with custom URL

**Nice to Have:**
- Image zoom/lightbox feature
- Filtering by technology or category
- Search functionality
- Animations/transitions
- Testimonials or case studies
- Contact form

---

## 📅 Timeline Estimate

**Total Time:** 7-9 days (single developer)

| Phase | Days | Owner |
|-------|------|-------|
| Setup & Design | 1-2 | TBD |
| Page 1 (Landing) | 1 | TBD |
| Data Collection | 1-2 | Team |
| Page 2 (Landing Pages) | 1 | TBD |
| Page 3 (Dashboards) | 1 | TBD |
| Page 4 (Workflows) | 1 | TBD |
| Polish & Deploy | 1 | TBD |

**Parallel Work Opportunity:** Data collection can happen while Page 1 is being built

---

## 🔗 Repository & Deployment

**GitHub Repository:** TBD (create new repo: `aivate-catalogue`)
**Deployment:** Vercel
**URL:** TBD (suggest: `catalogue.aivate.com` or `showcase.aivate.com`)

---

## 🛡️ Risks & Considerations

| Risk | Mitigation |
|------|-----------|
| Missing project data | Start data collection immediately |
| Screenshot quality | Take high-resolution screenshots (1920x1080+) |
| Vercel link changes | Use permanent deployment URLs, not preview URLs |
| Workflow diagram readability | Zoom feature, high-res exports from n8n |
| Mobile responsiveness | Test on real devices, use responsive images |

---

## 📞 Next Actions

**Immediate (Today):**
1. ✅ Document project (this file)
2. [ ] Generate design system using Aurora
3. [ ] Decide on tech stack (Next.js vs static HTML)
4. [ ] Create GitHub repository
5. [ ] Start data collection (landing pages, dashboards, workflows)

**This Week:**
1. [ ] Build Page 1 (Landing)
2. [ ] Set up Vercel deployment
3. [ ] Complete data collection

**Next Week:**
1. [ ] Build Pages 2, 3, 4
2. [ ] Polish and deploy
3. [ ] Share with team for feedback

---

## 📝 Notes

- This is an internal project (not client work) - can be done in parallel with Temp Power Systems
- Focus on "show, don't tell" - let the work speak for itself
- Keep design simple and fast-loading (clients will browse on mobile)
- Consider adding analytics (Vercel Analytics) to track which sections get most views

---

**Project Initiated By:** Cob
**Coordinator:** Nova
**Status:** 🟢 ACTIVE - Ready to Start Phase 1
**Last Updated:** 2026-02-03
