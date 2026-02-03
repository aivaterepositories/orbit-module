# Aivate Catalogue - Enhanced Features Specification

**Project:** Aivate Catalogue
**Date:** 2026-02-03
**Status:** Feature Specification

---

## 🎨 ENHANCED FEATURES IMPLEMENTATION GUIDE

### 1. Image Lightbox/Zoom Feature

**Library:** `yet-another-react-lightbox`

**Features:**
- Click any screenshot to view full-size
- Smooth zoom animation
- Keyboard navigation (arrows, ESC)
- Mobile swipe support
- Close on overlay click

**Implementation:**
```tsx
// components/Lightbox.tsx
import Lightbox from "yet-another-react-lightbox";
import "yet-another-react-lightbox/styles.css";
import Zoom from "yet-another-react-lightbox/plugins/zoom";

export function ProjectLightbox({ images, index, open, onClose }) {
  return (
    <Lightbox
      open={open}
      close={onClose}
      index={index}
      slides={images.map(img => ({ src: img }))}
      plugins={[Zoom]}
      animation={{ fade: 200 }}
      controller={{ closeOnBackdropClick: true }}
    />
  );
}
```

**Usage in Project Cards:**
```tsx
// On screenshot click
<img
  src={screenshot}
  onClick={() => openLightbox(index)}
  className="cursor-pointer hover:opacity-90 transition-opacity"
/>
```

---

### 2. Filter by Technology

**Implementation:** Multi-select filter with tech stack badges

**Available Technologies:**
- React
- Next.js
- Vue.js
- Tailwind CSS
- TypeScript
- Node.js
- PostgreSQL
- MongoDB
- Salesforce
- n8n
- OpenAI
- Vercel
- AWS

**UI Design:**
```tsx
// components/TechFilter.tsx
export function TechFilter({ technologies, selected, onChange }) {
  return (
    <div className="flex flex-wrap gap-2">
      <button
        onClick={() => onChange([])}
        className={`px-4 py-2 rounded-full transition-all ${
          selected.length === 0
            ? 'bg-[#2563EB] text-white'
            : 'bg-white text-[#18181B] border border-[#18181B]'
        }`}
      >
        All
      </button>
      {technologies.map(tech => (
        <button
          key={tech}
          onClick={() => toggleTech(tech)}
          className={`px-4 py-2 rounded-full transition-all ${
            selected.includes(tech)
              ? 'bg-[#2563EB] text-white'
              : 'bg-white text-[#18181B] border border-gray-200'
          }`}
        >
          {tech}
        </button>
      ))}
    </div>
  );
}
```

**Filter Logic:**
```tsx
const [selectedTechs, setSelectedTechs] = useState<string[]>([]);

const filteredProjects = projects.filter(project => {
  if (selectedTechs.length === 0) return true;
  return project.technologies.some(tech => selectedTechs.includes(tech));
});
```

---

### 3. Filter by Category

**Categories:**
- **Landing Pages:** SaaS, E-commerce, Portfolio, Service Business, Startup
- **Dashboards:** CRM, Analytics, Admin Panel, Inventory, Project Management
- **Workflows:** Data Processing, Email Automation, Integration, Notification, Reporting

**UI Design:**
```tsx
// components/CategoryFilter.tsx
export function CategoryFilter({ categories, selected, onChange }) {
  return (
    <div className="flex gap-3 overflow-x-auto pb-2">
      {categories.map(category => (
        <button
          key={category.id}
          onClick={() => onChange(category.id)}
          className={`px-6 py-3 rounded-lg transition-all whitespace-nowrap ${
            selected === category.id
              ? 'bg-[#18181B] text-white'
              : 'bg-white text-[#18181B] hover:bg-gray-50'
          }`}
        >
          {category.icon} {category.name}
        </button>
      ))}
    </div>
  );
}
```

---

### 4. Smooth Page Transitions

**Library:** `framer-motion`

**Implementation:**
```tsx
// app/layout.tsx
import { motion, AnimatePresence } from 'framer-motion';

export default function RootLayout({ children }) {
  return (
    <AnimatePresence mode="wait">
      <motion.div
        key={pathname}
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        exit={{ opacity: 0, y: -20 }}
        transition={{ duration: 0.2, ease: "easeInOut" }}
      >
        {children}
      </motion.div>
    </AnimatePresence>
  );
}
```

**Respect Reduced Motion:**
```tsx
import { useReducedMotion } from 'framer-motion';

const shouldReduceMotion = useReducedMotion();

const variants = {
  initial: shouldReduceMotion ? {} : { opacity: 0, y: 20 },
  animate: shouldReduceMotion ? {} : { opacity: 1, y: 0 },
};
```

---

### 5. Subtle Animations (Fade-in on Scroll)

**Implementation:** Intersection Observer + Framer Motion

```tsx
// components/FadeInView.tsx
import { motion } from 'framer-motion';
import { useInView } from 'framer-motion';
import { useRef } from 'react';

export function FadeInView({ children, delay = 0 }) {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });
  const shouldReduceMotion = useReducedMotion();

  return (
    <motion.div
      ref={ref}
      initial={shouldReduceMotion ? {} : { opacity: 0, y: 30 }}
      animate={isInView && !shouldReduceMotion ? { opacity: 1, y: 0 } : {}}
      transition={{ duration: 0.4, delay, ease: "easeOut" }}
    >
      {children}
    </motion.div>
  );
}
```

**Usage:**
```tsx
// Stagger children animations
<div className="grid grid-cols-1 md:grid-cols-3 gap-8">
  {projects.map((project, i) => (
    <FadeInView key={project.id} delay={i * 0.1}>
      <ProjectCard project={project} />
    </FadeInView>
  ))}
</div>
```

---

### 6. Vercel Analytics

**Installation:**
```bash
npm install @vercel/analytics
```

**Setup:**
```tsx
// app/layout.tsx
import { Analytics } from '@vercel/analytics/react';

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        {children}
        <Analytics />
      </body>
    </html>
  );
}
```

**Tracked Metrics:**
- Page views per portfolio section
- Click-through rates on project cards
- Filter usage patterns
- Average session duration
- Mobile vs desktop usage

---

### 7. Search Functionality

**Implementation:** Client-side search with Fuse.js for fuzzy matching

```bash
npm install fuse.js
```

**Setup:**
```tsx
// hooks/useProjectSearch.ts
import Fuse from 'fuse.js';

export function useProjectSearch(projects: Project[], query: string) {
  const fuse = new Fuse(projects, {
    keys: ['name', 'description', 'technologies', 'category'],
    threshold: 0.3, // Fuzzy matching sensitivity
  });

  if (!query) return projects;
  return fuse.search(query).map(result => result.item);
}
```

**UI Component:**
```tsx
// components/SearchBar.tsx
import { Search } from 'lucide-react';

export function SearchBar({ value, onChange, placeholder }) {
  return (
    <div className="relative max-w-md">
      <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-[#3F3F46]" size={20} />
      <input
        type="text"
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className="w-full pl-12 pr-4 py-3 rounded-full border border-gray-200
                   focus:border-[#18181B] focus:outline-none focus:ring-2
                   focus:ring-[#18181B]/20 transition-all"
        style={{ fontFamily: 'Space Grotesk' }}
      />
    </div>
  );
}
```

---

### 8. Project Details Modal

**Implementation:** Modal overlay with project details

**Features:**
- Full project description
- All screenshots in carousel
- Technology stack list
- Live demo link (if available)
- View source code link (optional)

**UI Component:**
```tsx
// components/ProjectModal.tsx
import { X, ExternalLink, Github } from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';

export function ProjectModal({ project, open, onClose }) {
  if (!open) return null;

  return (
    <AnimatePresence>
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        exit={{ opacity: 0 }}
        className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50
                   flex items-center justify-center p-4"
        onClick={onClose}
      >
        <motion.div
          initial={{ scale: 0.95, opacity: 0 }}
          animate={{ scale: 1, opacity: 1 }}
          exit={{ scale: 0.95, opacity: 0 }}
          className="bg-white rounded-2xl max-w-4xl w-full max-h-[90vh]
                     overflow-y-auto p-8"
          onClick={(e) => e.stopPropagation()}
        >
          <div className="flex justify-between items-start mb-6">
            <h2 className="text-3xl font-bold text-[#18181B]"
                style={{ fontFamily: 'Archivo' }}>
              {project.name}
            </h2>
            <button onClick={onClose} className="p-2 hover:bg-gray-100 rounded-full">
              <X size={24} />
            </button>
          </div>

          {/* Screenshots Carousel */}
          <div className="mb-6">
            {/* Image carousel implementation */}
          </div>

          {/* Description */}
          <p className="text-[#3F3F46] mb-6" style={{ fontFamily: 'Space Grotesk' }}>
            {project.description}
          </p>

          {/* Technologies */}
          <div className="mb-6">
            <h3 className="font-semibold mb-3">Technologies Used:</h3>
            <div className="flex flex-wrap gap-2">
              {project.technologies.map(tech => (
                <span key={tech} className="px-3 py-1 bg-[#FAFAFA] rounded-full text-sm">
                  {tech}
                </span>
              ))}
            </div>
          </div>

          {/* Links */}
          <div className="flex gap-4">
            {project.url && (
              <a href={project.url} target="_blank"
                 className="flex items-center gap-2 px-6 py-3 bg-[#2563EB]
                            text-white rounded-lg hover:opacity-90 transition-opacity">
                <ExternalLink size={20} />
                View Live Demo
              </a>
            )}
            {project.github && (
              <a href={project.github} target="_blank"
                 className="flex items-center gap-2 px-6 py-3 border-2
                            border-[#18181B] rounded-lg hover:bg-[#18181B]
                            hover:text-white transition-all">
                <Github size={20} />
                View Source
              </a>
            )}
          </div>
        </motion.div>
      </motion.div>
    </AnimatePresence>
  );
}
```

---

### 9. Tech Stack Badges

**Visual Design:**
```tsx
// components/TechBadge.tsx
const techColors = {
  'React': 'bg-blue-50 text-blue-600 border-blue-200',
  'Next.js': 'bg-black text-white border-black',
  'Tailwind': 'bg-cyan-50 text-cyan-600 border-cyan-200',
  'TypeScript': 'bg-blue-50 text-blue-700 border-blue-300',
  'Node.js': 'bg-green-50 text-green-600 border-green-200',
  // ... more colors
};

export function TechBadge({ technology }) {
  const colorClass = techColors[technology] || 'bg-gray-50 text-gray-600 border-gray-200';

  return (
    <span className={`px-3 py-1 rounded-full text-xs font-medium border ${colorClass}`}>
      {technology}
    </span>
  );
}
```

---

### 10. Loading States (Skeleton Loaders)

**Implementation:**
```tsx
// components/ProjectCardSkeleton.tsx
export function ProjectCardSkeleton() {
  return (
    <div className="bg-white rounded-xl p-6 border border-gray-200 animate-pulse">
      <div className="bg-gray-200 h-48 rounded-lg mb-4"></div>
      <div className="bg-gray-200 h-6 rounded w-3/4 mb-3"></div>
      <div className="bg-gray-200 h-4 rounded w-full mb-2"></div>
      <div className="bg-gray-200 h-4 rounded w-5/6 mb-4"></div>
      <div className="flex gap-2">
        <div className="bg-gray-200 h-6 rounded-full w-16"></div>
        <div className="bg-gray-200 h-6 rounded-full w-20"></div>
      </div>
    </div>
  );
}
```

**Usage:**
```tsx
// Show skeleton while loading data
{isLoading ? (
  <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
    {[...Array(6)].map((_, i) => (
      <ProjectCardSkeleton key={i} />
    ))}
  </div>
) : (
  <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
    {projects.map(project => (
      <ProjectCard key={project.id} project={project} />
    ))}
  </div>
)}
```

---

## 📦 COMPLETE PACKAGE.JSON DEPENDENCIES

```json
{
  "dependencies": {
    "next": "14.1.0",
    "react": "^18",
    "react-dom": "^18",
    "framer-motion": "^11.0.0",
    "yet-another-react-lightbox": "^3.15.0",
    "fuse.js": "^7.0.0",
    "lucide-react": "^0.316.0",
    "@vercel/analytics": "^1.1.0"
  },
  "devDependencies": {
    "@types/node": "^20",
    "@types/react": "^18",
    "@types/react-dom": "^18",
    "autoprefixer": "^10.0.1",
    "postcss": "^8",
    "tailwindcss": "^3.3.0",
    "typescript": "^5"
  }
}
```

---

## 🎯 FEATURE IMPLEMENTATION PRIORITY

### Week 1 (Core Features)
1. ✅ Project setup + Dependencies
2. ✅ Page 1: Landing with navigation
3. ✅ Reusable ProjectCard component
4. ✅ Basic page layouts

### Week 2 (Enhanced Features)
1. ✅ Filter by Technology
2. ✅ Filter by Category
3. ✅ Search functionality
4. ✅ Image Lightbox
5. ✅ Tech Stack Badges
6. ✅ Loading states

### Week 3 (Polish)
1. ✅ Page transitions
2. ✅ Fade-in animations
3. ✅ Project details modal
4. ✅ Vercel Analytics
5. ✅ Accessibility audit

---

## ✅ ACCEPTANCE CRITERIA

Each feature must meet:

### Image Lightbox
- [ ] Smooth open/close animation
- [ ] Keyboard navigation (ESC to close, arrows to navigate)
- [ ] Mobile swipe support
- [ ] High-resolution images load properly

### Filters
- [ ] Multiple filters can be active simultaneously
- [ ] Filter state preserved on page navigation
- [ ] "Clear all filters" button works
- [ ] Filter counts show number of projects per filter

### Search
- [ ] Fuzzy matching works (typos don't break search)
- [ ] Search across name, description, technologies
- [ ] Results update in real-time as user types
- [ ] "No results" state shown when appropriate

### Animations
- [ ] Respects `prefers-reduced-motion`
- [ ] Smooth 60fps animations
- [ ] No layout shifts during animation
- [ ] Loading states prevent content jumping

### Analytics
- [ ] Pageviews tracked correctly
- [ ] Custom events for filter usage
- [ ] Click events on project cards
- [ ] No PII (Personally Identifiable Information) tracked

---

**Feature Spec Version:** 1.0
**Last Updated:** 2026-02-03
**Status:** Ready for Implementation
