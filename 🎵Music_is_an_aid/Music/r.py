import os
import re
import json
from flask import Flask, send_from_directory
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import threading

# Path to your Obsidian vault
vault_path = '/data/data/com.termux/files/home/storage/shared/obsidian/dental'

app = Flask(__name__)

# Function to extract headings and links from a file
def extract_headings(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
    headings = re.findall(r'^(#+) (.+)$', content, re.MULTILINE)
    links = re.findall(r'\[\[(.*?)\]\]', content)
    return headings, links

def generate_graph_data():
    nodes = []
    links = []
    node_id = 0
    node_map = {}

    for root, dirs, files in os.walk(vault_path):
        for file in files:
            if file.endswith('.md'):
                file_path = os.path.join(root, file)
                note_name = os.path.splitext(file)[0]
                
                # Add a node for the filename
                filename_node_id = node_id
                nodes.append({"id": filename_node_id, "label": note_name, "group": note_name, "type": "filename"})
                node_map[note_name] = node_id
                node_id += 1

                headings, note_links = extract_headings(file_path)
                for i, (level, heading) in enumerate(headings):
                    node_key = f"{note_name}#{heading}"
                    if node_key not in node_map:
                        node_map[node_key] = node_id
                        nodes.append({"id": node_id, "label": heading, "group": note_name, "type": "heading"})
                        node_id += 1

                    # Link headings to the filename node
                    links.append({"source": filename_node_id, "target": node_map[node_key]})
                    
                    if level.count('#') > 1:
                        parent_level = level.count('#') - 1
                        parent_key = None
                        # Search for the nearest parent heading
                        for j in range(i-1, -1, -1):
                            prev_level, prev_heading = headings[j]
                            if prev_level.count('#') == parent_level:
                                parent_key = f"{note_name}#{prev_heading}"
                                break
                        if parent_key in node_map:
                            links.append({"source": node_map[parent_key], "target": node_map[node_key]})
                for link in note_links:
                    if link in node_map:
                        links.append({"source": node_map[note_name], "target": node_map[link]})

    # Save the data to a JSON file
    graph_data = {"nodes": nodes, "links": links}
    with open('graph_data.json', 'w', encoding='utf-8') as f:
        json.dump(graph_data, f)

    print("Graph data saved to graph_data.json")

    # HTML template with embedded JavaScript
    html_content = f"""
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Obsidian Notes Graph</title>
        <style>
            body {{
                background-color: #1e1e1e;
                color: #c0c0c0;
                font-family: Arial, sans-serif;
            }}
            .node {{
                stroke: #fff;
                stroke-width: 1.5px;
                fill: #6baed6;
            }}
            .link {{
                stroke: #999;
                stroke-opacity: 0.6;
            }}
            text {{
                font-size: 12px;
                fill: #c0c0c0;
                pointer-events: none;
            }}
            .filename {{
                fill: red;
            }}
            .search-container {{
                position: fixed;
                top: 10px;
                left: 50%;
                transform: translateX(-50%);
                z-index: 10;
            }}
            .search-input {{
                padding: 5px;
                font-size: 14px;
            }}
        </style>
    </head>
    <body>
        <div class="search-container">
            <input type="text" id="search-input" class="search-input" placeholder="Search nodes...">
        </div>
        <script src="https://d3js.org/d3.v6.min.js"></script>
        <script>
            // Load the data
            d3.json('graph_data.json').then(function(graph) {{
                
                const width = window.innerWidth;
                const height = window.innerHeight;

                const svg = d3.select("body").append("svg")
                    .attr("width", width)
                    .attr("height", height)
                    .call(d3.zoom().on("zoom", function (event) {{
                        svg.attr("transform", event.transform)
                    }}))
                    .append("g");

                const simulation = d3.forceSimulation(graph.nodes)
                    .force("link", d3.forceLink(graph.links).id(d => d.id).distance(100))
                    .force("charge", d3.forceManyBody().strength(-200))
                    .force("center", d3.forceCenter(width / 2, height / 2));

                const link = svg.append("g")
                    .attr("class", "links")
                    .selectAll("line")
                    .data(graph.links)
                    .enter().append("line")
                    .attr("class", "link");

                const node = svg.append("g")
                    .attr("class", "nodes")
                    .selectAll("circle")
                    .data(graph.nodes)
                    .enter().append("circle")
                    .attr("class", "node")
                    .attr("r", 5)
                    .call(drag(simulation));

                const label = svg.append("g")
                    .attr("class", "labels")
                    .selectAll("text")
                    .data(graph.nodes)
                    .enter().append("text")
                    .attr("class", "label")
                    .attr("dy", -10)
                    .attr("dx", 6)
                    .text(d => d.label);

                const filenameLabel = svg.append("g")
                    .attr("class", "filenames")
                    .selectAll("text")
                    .data(graph.nodes.filter(d => d.type === "filename"))
                    .enter().append("text")
                    .attr("class", "filename")
                    .attr("dy", 10)
                    .attr("dx", 6)
                    .text(d => d.label);

                node.append("title")
                    .text(d => d.label);

                simulation.on("tick", () => {{
                    link
                        .attr("x1", d => d.source.x)
                        .attr("y1", d => d.source.y)
                        .attr("x2", d => d.target.x)
                        .attr("y2", d => d.target.y);

                    node
                        .attr("cx", d => d.x)
                        .attr("cy", d => d.y);

                    label
                        .attr("x", d => d.x)
                        .attr("y", d => d.y - 10);

                    filenameLabel
                        .attr("x", d => d.x)
                        .attr("y", d => d.y + 10);
                }});

                function drag(simulation) {{
                    function dragstarted(event, d) {{
                        if (!event.active) simulation.alphaTarget(0.3).restart();
                        d.fx = d.x;
                        d.fy = d.y;
                    }}

                    function dragged(event, d) {{
                        d.fx = event.x;
                        d.fy = event.y;
                    }}

                    function dragended(event, d) {{
                        if (!event.active) simulation.alphaTarget(0);
                        d.fx = null;
                        d.fy = null;
                    }}

                    return d3.drag()
                        .on("start", dragstarted)
                        .on("drag", dragged)
                        .on("end", dragended);
                }}

                // Search functionality
                document.getElementById('search-input').addEventListener('input', function(event) {{
                    const searchTerm = event.target.value.toLowerCase();
                    label.style('display', d => d.label.toLowerCase().includes(searchTerm) ? '' : 'none');
                    filenameLabel.style('display', d => d.label.toLowerCase().includes(searchTerm) ? '' : 'none');
                    node.style('display', d => d.label.toLowerCase().includes(searchTerm) ? '' : 'none');
                }});
            }});
        </script>
    </body>
    </html>
    """

    # Save the HTML content to a file
    with open('index.html', 'w', encoding='utf-8') as f:
        f.write(html_content)

    print("HTML file saved to index.html")

generate_graph_data()

class ChangeHandler(FileSystemEventHandler):
    def on_modified(self, event):
        if event.src_path.endswith('.md'):
            print(f"Change detected in {event.src_path}. Regenerating graph data...")
            generate_graph_data()

@app.route('/')
def index():
    return send_from_directory('.', 'index.html')

@app.route('/graph_data.json')
def graph_data():
    return send_from_directory('.', 'graph_data.json')

if __name__ == "__main__":
    event_handler = ChangeHandler()
    observer = Observer()
    observer.schedule(event_handler, path=vault_path, recursive=True)
    
    # Start the observer in a separate thread
    observer_thread = threading.Thread(target=observer.start)
    observer_thread.start()
    
    try:
        app.run(debug=True, use_reloader=False)
    except KeyboardInterrupt:
        print("Stopping server...")
        observer.stop()
    
    observer.join()
    observer_thread.join()