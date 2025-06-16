# One of the problems of Clean Architecture and DDD (Modern Computer Science and Software Engineering in general)

The names given to clean architecture are not always easy to understand. And, are poor semantically. The come from a utilitarian point of view, but they are not very descriptive.

## Clean Architecture proposal 

Here I propose a new set of names for the key concepts of Clean Architecture.

| Layer                | Classic Name         | Symbolic Proposal         | Etymology / Justification                                                              |
| -------------------- | -------------------- | ------------------------- | -------------------------------------------------------------------------------------- |
| 🧠 Core              | Entity               | **Cardon**                | Vital center of the system, articulator of identity                                    |
| ⚙️ Application Logic | Use Case             | **Praxis**                | From Greek *πρᾶξις* (deliberate and ethical action) — articulates intention and action |
| 🔌 Adapters          | Interface Adapters   | **Metaxis**               | From Greek *μεταξύ* = between, intermediary; evokes a “bridge” between domains         |
| 🏛️ External Infra   | Frameworks & Drivers | **Periphera** or **Ecos** | *Periphera* = periphery (of the system); *Ecos* = environment, technical surroundings  |



I prefer `Periphera`, instead of `Ecos`. But, contextually, one or the other could be used. Depending on the emphasis you want to give to the "exterior world".

Do you want to emphasize this, that is *outside of the system*? Use `Periphera`. Or, the idea is of a "surrounding environment"? Use `Ecos`, as in *ecosystem*.


## Domain Driven Design proposal

| DDD Term                | Hybrid Alternative |
| ----------------------- | ------------------ |
| **Entity**              | **Idention**       |
| **Value Object**        | **Valora**         |
| **Aggregate**           | **Synthese**       |
| **Repository**          | **Depositor**      |
| **Domain Service**      | **Operatio**       |
| **Factory**             | **Factoria**       |
| **Domain Event**        | **Evento**         |
| **Bounded Context**     | **Horizon**        |
| **Ubiquitous Language** | **Lexica**         |

| DDD Term                | Symbolic Term | Origin / Justification                                                              |
| ----------------------- | ------------- | ----------------------------------------------------------------------------------- |
| **Entity**              | **Idion**     | From Greek *ἴδιον* (idion) = "that which is one's own" → identity-bearing           |
| **Value Object**        | **Harmonon**  | From *harmonia* (ἁρμονία) = fitting, balance; defined by internal symmetry          |
| **Aggregate**           | **Syntagma**  | From *σύνταγμα* = composition, structured grouping; evokes disciplined structure    |
| **Repository**          | **Tamion**    | From *ταμιεῖον* = treasury, storehouse; echoes controlled access to domain "wealth" |
| **Domain Service**      | **Energeia**  | From *ἐνέργεια* = activity, operation; pure action, no identity                     |
| **Factory**             | **Technion**  | From *τέχνη* (technē) = craft/art + -ion = place of making                          |
| **Domain Event**        | **Krisis**    | From *κρίσις* = turning point, decision moment; events that change system state     |
| **Bounded Context**     | **Horion**    | From *ὅριον* = boundary, limit, frontier                                            |
| **Ubiquitous Language** | **Lexicon**   | From *λεξικόν* = wordbook; shared domain vocabulary                                 |


I propose:

Entity → Idion (Id) (Idiom, Idioma, etc., very common word in many languages) 
Value Object -> Valor (Val)
Aggregate -> Synthese (Synth)
Repository -> Archive (Arc) (from Archive, Arquivo, Arca, etc. common word in many languages)
Domain Service -> Act (Action, Activity) 
Factory -> Genesis (Gen) (from Genesis, Gene, etc. common word in many languages)
Domain Event -> Event (Ev) 
Bounded Context -> Horizon (Horizon, Horizon, etc. common word in many languages)
Ubiquitous Language -> Lexicon (Lex) (Lexicon, Lexicon, etc. common word in many languages)

## Why Greek? 

###  Linguistic Roots of Technical Vocabulary

Most scientific, medical, and philosophical vocabulary already has Greek roots:

`Architecture, logic, system, syntax, paradigm, schema, method` — are all Greek.

Using Greek terms feels natural in `technical discourse`, unlike forced neologisms in English. That are often awkward and lack depth. And, are favorable only to the English-native community.

Portuguese, Spanish, Italian, German, French, and others also have Greek and Latin roots to their vocabulary. So, these terms are not exclusive to English speakers.

## Why different names?

The English neologisms are so poor semantically, that coming from a different context, that `Entity` is used in both DDD and Clean Architecture. With totally different meanings. This is very confusing for someone who is not familiar with both. And, very often you have to explain "Entity as in DDD", or "Entity as in Clean Architecture" to someone. And this, in itself, is very cumbersome.


## Other terms

DTO: Data Transfer Object	-> Morphis (Morph) or Diathema (dia- through, transfer, passage) and Thema (topic, theme, subject).
Morph (DTO): the immutable form we pass across service or process boundaries - “shape of data” not domain logic.
