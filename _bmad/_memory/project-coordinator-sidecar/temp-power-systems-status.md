# Temp Power Systems — Project Status

**Project Name:** Temp Power Systems
**Client:** Temp Power Systems
**Phase:** Deliver — SHIP-READY
**Status:** ✅ SHIP-READY
**Started:** November 2025
**Last Updated:** 2026-04-04 (Nova — RBAC decision pending Fiona approval)

---

## Current Phase: Post-Ship-Ready — Pilot Preparation

System is fully built and production-hardened as of April 1, 2026. Open item before pilot launch: **RBAC role hierarchy decision.**

---

## ✅ Completed Milestones

| Date | Milestone |
|------|-----------|
| Apr 1, 2026 | SHIP-READY — Permit fields, Task Automation Engine, technical hardening, full docs |
| Mar 22, 2026 | All 6 backend tasks complete — 2,342 SF records live |
| Feb 28, 2026 | All 7 Wayne tasks complete — Fiona revisions addressed |
| Feb 26, 2026 | Marky completed all Feb-11 action items |

---

## 🟡 Open Item: RBAC Role Hierarchy

**Raised:** 2026-04-04 by Cob (during login/permissions implementation)
**Status:** Awaiting Fiona approval

### Background

The current system is **binary**:
- `admin/manager` → full admin portal (all routes, all data)
- `crew` → crew portal only (mobile, no admin access)

No RBAC exists within the admin side. Every admin-tier login sees everything.

### Nova's Recommendation — 3-Tier Role System

| Role | Who | Access |
|------|-----|--------|
| **Super Admin** | Chris Yates (Owner), J. Bray, solutions@aivate.com | Full access — all pages, create/edit/delete, manage users |
| **Manager** | Wayne McCoy, Angela Vaughn, Mark Moore | Dashboard, Jobs, Work Orders, People Mgmt — edit but no delete |
| **Viewer** | J. Clark, C. Quiroga, S. Ray, S. Morales | Read-only across all pages — no create/edit/delete |

### Page Access Matrix

| Page | Super Admin | Manager | Viewer |
|------|-------------|---------|--------|
| Dashboard | Full | Full | Read-only |
| Jobs / Pipeline | Full (CRUD) | Full (edit, no delete) | Read-only |
| Work Orders | Full (CRUD) | Full (create/assign) | Read-only |
| Billing Schedule | Full | Full | Read-only |
| People Management | Full (CRUD) | Full (edit, no delete) | Hidden |
| Materials Report | Full + Export | Full + Export | Read-only |
| SOV / Accounting | Full | Full | Read-only |
| User Management | Full | Hidden | Hidden |

### Implementation Plan (Cob)

1. Add `role` column to `employees` table: `super_admin | manager | viewer`
2. Default all current admin logins to `manager` — manually elevate Yates/Bray/Aivate to `super_admin`
3. Build `usePermissions()` hook with `canEdit`, `canDelete`, `canManageUsers` flags
4. Gate People Management delete buttons + User Management routes first, then add guards progressively

**Decision needed from Fiona:**
- Confirm 3-tier structure (Super Admin / Manager / Viewer)
- Confirm page access matrix above, especially: should Viewer see People Management at all?
- Confirm Angela Vaughn stays as Manager (not a separate Accounting role)

---

## Team Assignments

| Person | Role | Current Focus |
|--------|------|---------------|
| Cob | Backend/Full-Stack | Login permissions + RBAC implementation |
| Marky | Frontend | TBD post-pilot |
| Fiona | PM / Process Engineer | RBAC approval pending |

---

## User Accounts (Provisioned)

See: `temp-power-systems-users.md`

**Admin (3):** Chris Yates, J. Bray, solutions@aivate.com
**Manager (7):** Wayne McCoy, Angela Vaughn, Mark Moore, J. Clark, C. Quiroga, S. Ray, S. Morales
**Crew (5):** Jorge Abreu, Cristian Chavez, Jon-Paul Chavez, Jose Coronado, Eduardo Zuniga
