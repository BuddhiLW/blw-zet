# BitCENT -- Project

# Architectures

- Mainframe (server-focused)
- Client-Server (Object/Pascal, Delphi)
- Server-side web (PHP, ASP, HTML, CSS etc.)
- Client-side web (JavaScript, data-centric apps)
- "Modern" web: Client + Server (Next.js, React.js, etc.)
- Standalone + sync?: DataScript

# Client vs Server side rendering

- Client-side rendering: The server sends a minimal HTML page to the client, and the client uses JavaScript to render the page. This is often done with frameworks like React or Vue.
- Server-side rendering: The server generates the entire HTML page on the server, and sends it to the client. This is often done with frameworks like Next.js or Nuxt.js.

# History timeline

- Vanilla JS (1993 - 2006)
- Web 2.0 (2006 - 2011)
- Frameworks (2011 - 2016) {Angular, etc.}
- Frameworks based on Components (2016 - ) {Angular, React, Vue, etc.}
- JAMStack (2016 - ) {Next.js, Gatsby, etc.} (Fullstack + severside and client-side rendering)
- Fullstack (2020 - ) {Next.js, Clojure(Script), DataScript}


# Prompting

```
**Project Context**
[Fundamental] - [Next.js, React.js, Redux.js, DataScript] - [DDD, separation of concerns]

**Aim**: [Goal is to study these technologies, while implementing sample frontend]

---

### **Key Rules**:
1. Use appropriate architecture and file organization based on project requirements.
2. Prioritize [DDD, and clear State Management, optmize between server and client components and make it a modular design].
3. Implement robust type safety and data validation (e.g., TypeScript interfaces).
4. Follow project conventions as documented (e.g., /CONVENTIONS.md).
5. Prioritize performance optimizations and efficiency in resource usage.
6. Implement responsive and mobile-first design.
7. Ensure localization/internationalization (if applicable).
8. Follow accessibility best practices (e.g., ARIA roles, keyboard navigation).
9. Incorporate error boundaries where necessary.
10. Design with modular, reusable components for scalability.

---

### **Quality Assurance**:
- **Clarification Process**: Always seek clarification on ambiguous requirements.
- **Code Standards**:
  - Use consistent naming conventions and code formatting.
  - Write inline comments for complex logic and reference conventions when necessary.
  - Include documentation (e.g., JSDoc) for utilities and complex components.
- **Performance**:
  - Optimize resource usage and payload sizes.
  - Implement loading states for interactive elements.
  - Use lazy-loading techniques for non-critical assets.
- **Accessibility**:
  - Maintain semantic HTML structure.
  - Integrate ARIA roles for interactive elements.
  - Support keyboard navigation and screen readers.
- **Testing**:
  - Identify critical logic and suggest unit tests.
  - Utilize component testing for UI elements where applicable.
- **Documentation**:
  - Provide clear and concise documentation for complex components.
  - Maintain versioning and update notes.

---

### **Component Patterns**:
- **Containers**: Data-fetching and state management.
- **Presentational Components**: Pure UI elements without logic.
- **Interactive Elements**: Client components with dynamic behavior.
- **Layouts**: Shared structural elements (e.g., headers, footers).
- **Reusables**: Components following atomic design principles (atoms/molecules/organisms).

---

### **Data Flow**:
[Data Source] → [Data Fetching Layer] → [Component Hierarchy] → [Rendering/Display]

---

### **Avoid**:
- Mixing server and client logic without clear separation.
- Unoptimized asset usage (e.g., large images, uncompressed files).
- Deep prop drilling; use state management when necessary.
- Inconsistent use of libraries or frameworks.
- Non-semantic HTML or inaccessible interactive elements.

---

### **Validation Requirements**:
1. Code linting and formatting consistency.
2. Performance benchmarks (e.g., Lighthouse scores).
3. Accessibility checks (e.g., WCAG compliance).
4. Unit tests for core logic and integration tests for critical flows.

---

Consider using Storybook documentation

---

### **Current Focus**:
[Describe the specific task/component/problem at hand]
```
