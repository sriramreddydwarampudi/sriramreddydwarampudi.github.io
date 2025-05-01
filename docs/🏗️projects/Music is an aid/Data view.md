```dataview

table file.link as "File", headings.text as "Heading"
from ""
where file.type == "markdown"
flatten file.headings as headings
sort file.path asc

```
