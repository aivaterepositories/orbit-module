# Aurora Component Playbook

**Purpose:** Single source of truth for all component integrations. Aurora loads this file and follows the protocol for any component listed below.

---

## Universal Integration Protocol

When integrating ANY component from this playbook:

### Step 1 — Stack Validation

The codebase MUST support:
- shadcn project structure
- Tailwind CSS
- TypeScript

If any are missing, STOP and provide setup instructions:
- shadcn: `npx shadcn@latest init`
- Tailwind: follow official Tailwind CSS install guide for the framework
- TypeScript: `npx tsc --init` or framework-specific setup

### Step 2 — Component Path Verification

Determine the default path for components and styles.
If the default component path is NOT `/components/ui`:
- Explain that `/components/ui` is the shadcn convention
- shadcn CLI installs primitives there by default
- Third-party shadcn-compatible components expect this path
- Import aliases like `@/components/ui/button` are standard across the ecosystem
- Provide instructions to create the folder: `mkdir -p src/components/ui`

### Step 3 — Component Placement

Copy-paste the component file to `/components/ui/[component-name].tsx`
- Preserve the exact file name provided
- Do NOT rename or restructure the component
- Verify all imports resolve correctly

### Step 4 — Demo Usage

Provide the demo code from the component entry below.

### Step 5 — Dependency Check

Install any dependencies listed in the component entry. If unlisted, scan the component source for external imports and flag them.

### Step 6 — Log to Sidecar

Log the integration to `aurora-sidecar/design-decisions.md` with:
- Component name and source
- Path placed
- Any setup steps performed
- Dependencies added

---

## Components

<!-- To add a new component: copy the template below, fill it in, and append it here. -->

### E-Commerce Product Detail
- **File:** `e-commerce-product-detail.tsx`
- **Source:** 21st.dev
- **Dependencies:** none (self-contained SVG icons)
- **Notes:** Includes product gallery with thumbnails, color/size selectors, quantity picker, tabs (description/details/shipping), wishlist, and add-to-cart. Fully self-contained — no external icon libraries needed.
- **Demo:**
  ```tsx
  import ProductDetail from "@/components/ui/e-commerce-product-detail";

  export default function Demo() {
    return <ProductDetail />;
  }
  ```

---

<!-- TEMPLATE — Copy everything between the dashes to add a new component:

### [Component Name]
- **File:** `component-name.tsx`
- **Source:** [21st.dev / custom / shadcn / etc.]
- **Dependencies:** [npm packages or "none"]
- **Notes:** [Brief description of what the component does]
- **Demo:**
  ```tsx
  import ComponentName from "@/components/ui/component-name";

  export default function Demo() {
    return <ComponentName />;
  }
  ```

---

-->
