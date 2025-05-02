


----
1.0 sets

# set
Synonyms for “set” are “class,” “collection,” and “family.

A set is defined as any well-defined collection of objects or elements.

usually uses capital letters A, B, X, Y, Y,..., to denote sets, and lowercase letters a, b, x, y, y,..., to denote elements of sets. 
Membership in a set is denoted as follows: a ∈ S denotes that a belongs to a set S a, b ∈ S denotes that a and b belong to a set S
Here ∈ is the symbol meaning “is an element of.” 


Example 1
1. \mathbb Prime numbers {P} = \{2, 3, 5, 7, 11, 13, 17, 19, 23, \dots\} $

2. Staff = Set of  professors  in a college 

3. in medicine we classify and group things like diseases based on anatomical it belongs to ,histological for pathology,etiology.

4.  ```mermaid

	graph TD
    subgraph Set A
        A1["Element 1"]
        A2["Element 2"]
        A3["Element 3"]
    end
	
	```


Problem 1.1 define sets of dentition

$\mathbb Primary dentition = \{41,42,43,44,45 \dots\}$

$\mathbb Permanent  dentition = \{18,17,16,15,14,13,12,11,21,22,23,24,25,26,27,28,31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48 \dots\}$

# Set operations


Example: Rock ,paper and scissors

problem 1 Find the type of tooth in 32 set of teeth


natural language method






mathematical method




computer method
# Tooth Classification Widget

<div style="border: 1px solid #ddd; padding: 20px; border-radius: 5px; max-width: 500px; margin: 0 auto;">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .tooth-widget {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0 auto;
            padding: 20px;
        }
        .tooth-widget input {
            padding: 10px;
            font-size: 16px;
        }
        .tooth-widget button {
            padding: 10px 15px;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
        }
        .tooth-widget #result {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
            min-height: 24px;
        }
    </style>
</head>
<body>
<div class="tooth-widget">
    <h2>Tooth Classification</h2>
    <p>Enter a tooth number (11-48) to classify it:</p>
    <input type="number" id="toothInput" min="11" max="48">
    <button onclick="classifyTooth()">Classify</button>
    <p id="result"></p>
</div>

<script>
    const Teeth = new Set([18,17,16,15,14,13,12,11,21,22,23,24,25,26,27,28,
                           31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48]);

    const anteriorTeeth = new Set([11,12,21,22,31,32,41,42]);
    const posteriorTeeth = new Set([...Teeth].filter(t => !anteriorTeeth.has(t)));

    const incisors = new Set([11,12,21,22,31,32,41,42]);
    const lateralIncisors = new Set([12,22,32,42]);
    const centralIncisors = new Set([11,21,31,41]);

    const maxillaryTeeth = new Set([18,17,16,15,14,13,12,11,21,22,23,24,25,26,27,28]);
    const mandibularTeeth = new Set([...Teeth].filter(t => !maxillaryTeeth.has(t)));

    const canines = new Set([13,23,33,43]);
    const firstPremolars = new Set([14,24,34,44]);
    const secondPremolars = new Set([15,25,35,45]);

    const firstMolars = new Set([16,26,36,46]);
    const secondMolars = new Set([17,27,37,47]);
    const thirdMolars = new Set([18,28,38,48]);

    const premolars = new Set([...firstPremolars, ...secondPremolars]);
    const molars = new Set([...firstMolars, ...secondMolars, ...thirdMolars]);

    const rightTeeth = new Set([11,12,13,14,15,16,17,18,41,42,43,44,45,46,47,48]);
    const leftTeeth = new Set([...Teeth].filter(t => !rightTeeth.has(t)));

    function classifyTooth() {
        const tooth = parseInt(document.getElementById("toothInput").value);
        if (!Teeth.has(tooth)) {
            document.getElementById("result").innerText = "Invalid tooth number";
            return;
        }

        let classification = [];

        // Maxillary or Mandibular
        classification.push(maxillaryTeeth.has(tooth) ? "Maxillary" : "Mandibular");

        // Right or Left
        classification.push(rightTeeth.has(tooth) ? "Right" : "Left");

        // Anterior or Posterior
        classification.push(anteriorTeeth.has(tooth) ? "Anterior" : "Posterior");

        // Incisors
        if (centralIncisors.has(tooth)) {
            classification.push("Central Incisor");
        } else if (lateralIncisors.has(tooth)) {
            classification.push("Lateral Incisor");
        }

        // Canines
        if (canines.has(tooth)) {
            classification.push("Canine");
        }

        // Premolars
        if (firstPremolars.has(tooth)) {
            classification.push("First Premolar");
        } else if (secondPremolars.has(tooth)) {
            classification.push("Second Premolar");
        }

        // Molars
        if (firstMolars.has(tooth)) {
            classification.push("First Molar");
        } else if (secondMolars.has(tooth)) {
            classification.push("Second Molar");
        } else if (thirdMolars.has(tooth)) {
            classification.push("Third Molar");
        }

        document.getElementById("result").innerText = classification.join(" ");
    }
</script>

</body>
</html>
</div>




Subset or if then or ->