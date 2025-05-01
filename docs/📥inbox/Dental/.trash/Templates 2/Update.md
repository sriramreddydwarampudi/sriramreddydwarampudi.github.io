<%*
const content = tp.file.content;
const headings = content.match(/(#{1,6} .*)/g);
if (headings) {
    let updatedContent = content;
    headings.forEach(heading => {
        const text = heading.replace(/(#{1,6} )/, '');
        const id = text.toLowerCase().replace(/[^\w]+/g, '-');
        const headingWithId = `${heading}\n<a id="${id}"></a>`;
        updatedContent = updatedContent.replace(heading, headingWithId);
    });
    tp.file.write(updatedContent);
}
%>