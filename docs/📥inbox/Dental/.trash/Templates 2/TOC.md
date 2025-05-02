*Table of Contents*
<%*
const headings = tp.file.content.match(/(#{1,6} .*)/g);
if (headings) {
  headings.forEach(heading => {
    const level = heading.match(/(#{1,6})/)[0].length;
    const text = heading.replace(/(#{1,6} )/, '');
    const id = text.toLowerCase().replace(/[^\w]+/g, '-');
    tR += `${'  '.repeat(level - 1)}- [${text}](#${id})\n`;
  });
} else {
  tR += 'No headings found.';
}
%>