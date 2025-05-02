

<%*

const toc = `<div id="toc">
  <h2>Table of Contents</h2>
  <ul>
    <% tp.frontmatter.headings.forEach(heading => { %>
      <li><a href="#<%- heading.slug %>"><%- heading.text %></a></li>
    <% }) %>
  </ul>
</div>`;
tR += toc;
%>