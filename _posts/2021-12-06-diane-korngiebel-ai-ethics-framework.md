---
title: "Diane Korngiebel's AI ethics framework is Agile"
categories:
  - musings
tags:
  - research/science
  - conferences
  - artificial intelligence
  - ethics
  - software engineering
---

The opening keynote at the 2021 ISCB Rocky conference was by Dr. Diane Korngiebel,
who presented a formal framework for improving ethical outcomes from AI development.
Dr. Korngiebel argues that equity is a better goal than "deservingness" for AI-based tools,
and her process is built on very broad stakeholder engagement.
All impacted parties,
including patients, families, social workers, clinical staff, long-term care, etc.
should be part of the development process from day 1,
and their feedback should determine how (and even whether) projects proceed.
The framework calls for monitoring and accountability at every decision point.

Though I absolutely agree with her on this,
I feel like the same arguments could be made re: any new technology or policy decision.
If there's a critical point of distinction here
(and this was not discussed in the talk),
it is that artificial intelligences do not, themselves, have ethics.
As such, they may not have the ability to "notice" ethical challenges,
and cannot generally redirect themselves for better ethical outcomes.
They must either be programmed ethically upfront,
or flexibility and oversight must be built into the development and maintenance process
to allow course correction as challenges become apparent.

The idea that ethical ramifications could be mapped correctly upfront,
and that correct design decisions can be made the same way
feels a lot like a traditional [waterfall development methodology](https://en.wikipedia.org/wiki/Waterfall_model).
These have largely been replaced by agile methods, which, like Dr. Korngiebel's framework, 
prioritize working solutions, collaboration, and response to changing requirements.
The target outcomes here support equity and positive client outcomes,
which I would argue are almost always tightly coupled.
No company wants to be held responsible for a breach of ethics.

One of the most interesting technical ideas from the presentation
was the distinction Dr. Korngiebel drew between "explanability" and "interpretability" of AI models.
This was a new idea for me, and useful.
Model explanability describes a comprehensive and formal description of the model,
its inputs, parameters, and results.
Interpretability, on the other hand, is a looser standard,
focused on the degree to which model users can interpret model results.
Her argument that interpretability frequently trumps explainability in applied ML contexts
like healthcare systems seems like a useful razor -
"readability" by patients and practitioners allows the people most impacted by model results
to make the critical health decisions they face.