module.exports = async (tp) => {
  const headings = tp.file.content.split('\n').filter(line => line.match(/^(#+)\s/));
  const toc = headings.map(heading => {
    const level = heading.match(/^(#+)/)[1].length;
    const text = heading.replace(/^(#+)\s/, '');
    const id = text.toLowerCase().replace(/[^\w]+/g, '-');
    return `${' '.repeat((level - 1) * 2)}- [${text}](#${id})`;
  }).join('\n');
  return toc;
}