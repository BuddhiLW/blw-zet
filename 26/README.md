---
title: "Software Idea"
description: 'The software has therefore some components. The main one that inserts chapters, sections, subsection, the type of the document, the packages, fonts etc. One can enter also a template to be used as headers and footer styles, as'
published: "2023-03-05"
image: "./images/image-post-26.png"
draft: false
---

# Software Idea

Create a program that generate a LaTeX document. One can specify tables that 
will appear in the text and generate them, by following the terminal client 
application. Also, one can add images, specifying their paths.

The software has therefore some components. The main one that inserts chapters, 
sections, subsection, the type of the document, the packages, fonts etc. One 
can enter also a template to be used as headers and footer styles, as well as 
the style of the document, avoiding to specify everything by terminal.

The other programs will generate the tables, given you supply the number of 
columns and rows. As well as if a table-element is two-row etc. Then, supply 
text inserts for each table-element, guiding the user through a terminal-sketch 
modeling the table.

Finally, we have the inserts of images programatically. Where one is asked to 
insert text, using the main program, then Enter, then chose to insert table, 
image, continue the section, or chose to start a new section (chapter, section 
etc.).

This will cover most basic use-cases for generating documents.

For now, I would like to write the table-generator in go, which will output a 
`.tex` file, representing the table.
