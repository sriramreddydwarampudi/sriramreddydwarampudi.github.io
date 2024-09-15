<%*
const vaultFiles = app.vault.getMarkdownFiles();
let definitionHeadings = "";

for (let file of vaultFiles) {
    const content = await app.vault.read(file);

    // Match all headings that contain '# definition'
    const headingsWithDefinition = content.match(/^#+.*# definition.*$/gm);

    if (headingsWithDefinition) {
        // Add the headings and file reference to the final output
        definitionHeadings += `## From file: [[${file.basename}]]\n`;
        headingsWithDefinition.forEach(heading => {
            definitionHeadings += `${heading}\n`;
        });
        definitionHeadings += "\n";
    }
}

tR += definitionHeadings;
%>

# Collected Definition Headings

<%- definitionHeadings %>