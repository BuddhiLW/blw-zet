---
title: "Coursera - TDD/BDD, IBM"
description: 'default description'
published: "2025-03-17"
image: "https://example.com/placeholder.jpg"
draft: false
---

# Coursera - TDD/BDD, IBM

20250317171524

## Testing Levels and Release Cycles 

20250317171729

GOAL:
- What are the levels of software testing?
- What are the steps of a release cycles?

### Unit Tests

Test the smallest component's behaviours, up to a minimum unit. We aim to test if this quantum behaves as expected.

So, we have `fact`, `expected` and `actual` results. We state a fact about the quantum. Then we give empirical expected cases, and test against the actual behaviour.

#### Path following unit tests

Track **happy** and **sad** paths. Sad paths you try to break the code and see where it leads you; malformed data etc are thrown at the functionalities. What happens then? Leave no stone unturned (as much as you can predict).

**happy** paths are tests that comprises the core functionalities, in an ideal situation and flow of information.

### Integration tests

Running many-to-many services and see how they interact.

API compliance etc.

### System Testing

How everything works when it goes into a production-environment.

### Acceptance Testing

Feedback from end-users in terms of usability etc.
