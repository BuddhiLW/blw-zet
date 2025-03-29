# Cursor

Use AI to use AI smartly.

## .cursorrules

An example of how you could prime your AI in a project!

``` md
**Project Context**
[PORTFOLIO] Next.js 14 App Router - TypeScript - next-intl - Tailwind CSS

**Aim**: Professional portfolio with i18n (en/pt-BR), projects showcase, and interactive elements

**Key Rules**:
1. Use App Router with colocated components
2. Server components by default, client only when necessary
3. TypeScript interfaces for all props/data
4. Follow /CLAUDE.md conventions
5. Priority to RSC patterns
6. Mobile-first responsive design
7. next-intl v3+ i18n implementation
8. Accessible semantic HTML
9. Error boundaries for all client components
10. Modular, reusable component architecture

**Quality Assurance**:
- **Clarification Process**: Seek requirements clarification before implementation
- **Code Standards**:
  - TypeScript interfaces for all component props
  - Inline comments referencing CLAUDE.md conventions
  - JSDoc for complex utilities
- **Performance**:
  - Optimize RSC payload sizes
  - Implement loading states for client components
  - Lazy-load non-critical assets
- **Accessibility**:
  - ARIA roles for interactive elements
  - Semantic HTML structure
  - Keyboard navigation support
- **Testing**:
  - Note required unit tests for complex logic
  - Suggest storybook stories for UI components
- **Documentation**:
  - Component-level JSDoc for complex pieces
  - Translation key documentation in comments

**Component Patterns**:
- Pages: Server components fetching data
- Layouts: Shared RSC layouts
- Interactive Elements: Client components with `use client`
- Forms: Pending RSC actions
- Reusables: Atomic design principles (atoms/molecules/organisms)

**Data Flow**:
API → Server Component (fetch) → Props → Client Components

**Avoid**:
- Context API in server components
- Client-side data fetching unless necessary
- Any UI framework besides Tailwind
- Prop drilling beyond 2 levels
- Non-accessible interactive elements
- Unoptimized image assets

**Validation Requirements**:
1. ESLint TypeScript rules (strict mode)
2. next-intl message validation
3. Responsive design breakpoint checks
4. Lighthouse accessibility score >90

**Current Focus**:
[Describe specific task/component/problem]
```
