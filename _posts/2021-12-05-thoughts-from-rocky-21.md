---
title: "Interesting ideas from the 2021 ISCB Rocky Conference"
categories:
  - science
  - dev
tags:
  - research/science
  - conferences
  - science communication
  - software
  - development
toc: true
---

Returning from the International Society for Computational Biology's annual Rocky conference,
I'm full to bursting with other people's ideas.
I hope I'll have time to dig into some of these in detail in the future,
but for now the goal is to get everything down quickly so I don't lose too much.

In chronological order, then:

### Diane Korngiebel

The opening keynote presents a formal framework for improving outcomes from AI development.
Korngiebel argues that equity is a better goal than "deservingness" for AI-based tools,
and her framework is built on very broad stakeholder engagement, monitoring, and accountability.

Like Mayla Boguslave later,
Korngiebel spoke to the importance of identifying *absences* in her work.
The things not present in a data set, scoping, or development process
can be critical to the project's success or failure.

### Joe Wirth - ProTaxa

16s sequencing is sometimes insufficient for taxonomy assignment,
but if we intelligently add data from a manually curated database,
we can choose more effective biomarkers for identification.
ProTaxa builds a complete tree of closely related taxa to a given sequence,
and returns heatmaps describing quality of fit.
It also provides qualitative thresholds for selecting taxonomic levels.
Neat stuff!

### Yuval Tabach

Phylogenetic profiling lets us identify co-evolution of functional proteins/genes.
The success of the ID is affected by variations in the relative similarity of the genes being compared.
If we take this expected similarity into account,
a match between two mammals "means less" than match genes across divergent clades does.
This intelligent weighting gives us more power to select useful functional genes.

### Brendan Mumey

Brendan presented on RNA assembly of multiple sequences from mixed short reads.
Algorithmically, we build a splice graph, where:
- vertices are exons
- weights are read-count-derived

In these graphs, the fewest number of flow paths is often biologically correct
Optimizing this is np hard (even in approximation), and heuristics are spotty,
but there are some promising directions for how to make it workable:
- using long reads to impose subpath constraints
- Inexact Flow Decomp (handles errors in read counts that result in edge weights not summing to a flow where all input values are conserved)
- some other things I didn't catch quickly enough to note down. 😆

### Stephanie Hagstrom - [Research Data Alliance](https://rd-alliance.org)

The research data alliance is a global network working at local, regional, and global scales
to improve access to data sharing and reuse.

Membership is free for individuals, so consider joining!

### Nicholas Kinney

... gave an amazing talk about modeling chromosome folding quasi-mathematically.
Well beyond me, but he's mapping the chromosome to hilbert curves such that regions remain contiguous.
The Hilbert curves give us some useful properties,
and the success of contiguous model in simulations of chromosome unwinding
is an interesting result in a contested part of the field.

### Kerri-Ann Anderson

Kerri-Ann presented some of the most interesting ideas at the conference,
and took a best-poster runner up for her work on
social (or cultural?) evolutionary modeling of vaccine hesitancy.
In effect, she treats the hesitancy meme as a cultural phenotype,
and looks at the effects of different stimuli on vaccination rates
as generations transmit the meme to equilibrium. 

Among other things, she found that mandates drive up vaccination rate,
but that this may mask vaccine hesitancy in the population.
Similarly, vaccine inaccessibility will drive coverage down,
but may hide high levels of confidence in the vaccine.

This was a completely new idea for me,
and makes me wonder whether anyone is doing similar work using disease transmission models,
which seem like a closer analog to the distribution processes of cultural memes
than reproduction/inheritance.

### Andreas Dräger

The Systems Biology Modeling Language (SBML) is an unambiguous xml-based language
for describing concepts in sytems biology.
Many users don't have the access permissions they would need to install software
on their institutional machines,
or failed to install for other reasons.
The SBMLWebApp team dealt with this problem by building a web app
capable of performing ordinary differential equation (ODE) analysis on SBML models,
using server infrastructure housed with partners at Keio University.
They also package docker images, for users who need private/local run conditions.

### David Van Valen

Super impressive human-in-the-loop ML image labeling algorithms,
designed for labeling multi-cell still and video captures.
The key idea here is that (outside of an initial expert-annotated image set),
the ML tooling labels images,
while specialized crowd-source workers *correct* these labels with expert supervision.
As the labeled image library grows, it is cycled in as training data to improve the base model.
End products are the labeling model, and the libraries of labeled still and video.

### Varuni Sarwal

Attempted to benchmark 50+ variant calling tools. Benchmarked 15 of them.
Presented these benchmarks. But why only 15?
She and her team were unable to install or run 35+ of the tools,
for lack of good documentation, bad builds, or bugs.

### Mayla Boguslav

Statements of ignorance or absence may be as important as knowledge statements
in deriving meaning from a scientific corpus. 🤯
With this in mind,
we can survey the field to ask questions about the state of knowledge,
and what the open questions are.

### Ramy Aziz

Ramy presented on the Egyptian Center for Genome and Microbiome Research,
where he is working in close collaboration with other groups around the world.
Ramy was one of a few presenters who were very focused on the primary importance of data.
He argued that public data is widely available, but it can be difficult to access,
work with, or publish on quickly enough to be impactful.
As such, gathering your own data is important.

Incidentally, he mentioned that the COVID-19 pandemic and resulting public response
has forced his best students to remain in Egypt, rather than emigrating.
Proximally, this may be perceived as a harm to those students' career prospects,
but I wonder whether there will be positive long-term impacts on research prospects
in countries with developing science infrastructure.

### Yu-Ning (Eric) Huang
Eric gave a great presentation about issues of insufficient or absent metadata,
based on research into the state of metadata in public repositories.
During the Q&A, he was asked in quick succession about the absence of formal ontologies
from public repository metadata standards,
and about why public repository metadata standards are often overly formal or restrictive.

This inherent tension between correctness and flexibility is familiar and fascinating,
and any real solution to public-repository metadata standards will have to consider both camps.

### Wouter Meuleman

"Maps are useful because they are wrong"

This entire presentation was gorgeous.
Focused on work to improve the readability of visualizations of the human genome
by reducing the dimensionality of the data without sacrificing information content,
his argument was essentially that a good visualization provides the highest possible ratio
of desirable information per unit complexity.

### Jeff ? from BYU

Unfortunately, Jeff's name and presentation title didn't make the program,
but he gave a solid first talk on his work using ITS and metagenomics to split
the cosmopolitan lichen *Lecanora polytropa* into ~81 species.

### Chandrima Bhattacharya

While profiling communities of locally adapted extremophile microbes in NYC's Gowanus Canal,
Chandrima identified 3120 novel secondary metabolites that may be useful in drug discovery.
The idea of searching superfund sites for microbial metabolites that can be used in medical applications
is just too much woah.

### Rajeev Asad

Rajeev presented fascinating work applying higher-order Markov models to metagenome taxonomies.
His non-alignment-based classification approach allows him to identify reads
not present in the database at higher taxonomic levels.
That would be cool enough, but it also outperformed BLAST on speed and accuracy for all tested taxa.
I
Rajeev did another neat thing I've only seen before in Haley Sapers' work - 
he presented a taxonomy using a Sankey diagram,
which gives a really lovely sense of the relative representation of different clades,
and where they separate in the record.


### Mason Taylor

Mason and I spent some time talking about jupyter notebook-based interactive textbooks,
and some tools he's been using to make them work for teaching.
Among them, biograder... grades student work.
I haven't checked it out yet, but it's findable from paynelab.github.io


### Thomas Schaffter - NLPSandbox

Oh boy, there was so much here.
First, NLPSandbox solves a hard problem in a neat way.
Protected Health Information records have a lot of potential utility to research.
They're also, by virtue of their protected status, difficult for researchers to access.
NLPSandbox deals with this by presenting an interface into which researchers can plug Dockerized NLP models,
and receive scoring metrics on the effectiveness of their models at the task,
*without ever exposing the data*.
By providing access to training sets to the models but not the humans,
researchers get what they need, and also visibility for their successes,
and patients and institutions need not worry about data leakage.

Ok, since that wasn't cool enough,
they're using an [OpenAPI](https://oai.github.io/Documentation/introduction.html) generator
to write toolstub APIs in 15 languages.

And because they want to make contributing easy and encourage best practices,
they've set up JuptyerLab and RStudio interfaces,
and pushed model templates to Github so that developers have a starting framework
to build models with CI/CD tools already in place.

### Oscar Ospina - SpatialGE

Oscar presented an R package for applying spatial statistics tools to gene expression data.
Now you can krig you GE stuff, work with pretty images, and other cool things.

### Tiffany Callahan & Brook Santangelo

I feel bad lumping these two scientists into a single line,
but they both introduced me to knowledge graphs through their work,
and I got to see some of the cool things we can do with them -
like predict patient genotype from plain text clinician health records,
no sequencing required!

### Melissa Haendel

Melissa's talk was beautiful, and a perfect end to the program.
First, professional paths may wind, life presents many challenges,
and with persistence we can do amazing things.

Second, there is some awesome meta-work being done on open science.
The [Reusable data project](https://reusabledata.org/) checks repository licenses
for accessibility and reusability. 
Their ratings have pushed some important players toward more open access policies.
This is just the beginning of the cool stuff she's worked on. Tada!

### Recommendations for future Rocky attendees
- Present a poster - even if you're presenting a talk.
  You'll have great conversations.
- Make opportunities to socialize.
  This might mean skiing every day with new people,
  making it a point to eat with other attendees,
  or just saying hi to everyone.
  I learned so much, and had so many great conversations in my social time.
  What a welcoming bunch of brilliant people!
- If you can, stay an extra night after the conference.
  This will let you ski the last afternoon or even the following day if there's good snow,
  give you a quiet night to digest all the things you've learned,
  and you won't have to stress about checking out early on the final day of the conference.

### Final thoughts

First, there were many, many other amazing presentations I've left out here.
Jamie Morton on microbial co-occurrence networks,
Greg Way mashing up morphology and gene expression data,
tons of RAMP stuff, and scientific reproducibility stuff, and awesome stuff stuff.
If you're reading this and wondering why you're not here, my apologies -
I am limited by my attention span and my lack of domain literacy.

All in all, Rocky is the best-structured conference I've been to.
Short presentations keep things approachable and kept me engaged throughout.
A long mid-day ski break and a very high-impact poster session
provide opportunities for longer conversations.
The ski break also helped me maintain focus.
Getting some exercise and having some fun helped clear my head
and get me excited about the next set of presentations.

Many people this year spoke to the idea that data is key.
Quality, accessibility, reusability, etc, there were some really neat data-oriented talks.
The other trend I saw, though, was in the many, and powerful-looking imaging-based projects presented.
In addition to the presenters mentioned above,
Justin Couetil's DEGAS gave us something like
algebraic image manipulation for spatial transcriptomics.
Super solid presentation, too.

Finally, and of course, we live in a multi-omics world now.
Many of these presentations occur at the intersections of data types or disciplines,
and questions like "why didn't you integrate x data?" have started to emerge.
Very exciting.

This was my first time at Rocky. Given half a chance, I'll be back.