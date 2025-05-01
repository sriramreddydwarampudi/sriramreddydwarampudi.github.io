Step 5: Trace Dysfunction Progression (Causal Chains)


step 6: Integrate temporal evolution(markov chains)


Step 7: Segment Pathology Zones  (Fuzzy Logic Classification weights)

Objective: Identify and label regions of dysfunction.
Method: Fuzzy Topological Segmentation
Accounts for uncertainty and gradients in disease spread across anatomical space.

50% infected gums

Enamel weights

1. Attrition Classification



Turner & Missirlian (1988) Classification of Tooth Wear

Grade -1: No attrition
Grade -0.7: Minimal wear, slight flattening of cusps
Grade -0.5: Noticeable wear, dentin exposure
Grade -0.35: Severe wear, extensive dentin exposure
Grade 0: Pulp exposure

Smith & Knight Tooth Wear Index (TWI)

This is a more detailed scoring system for attrition, abrasion, erosion, and abfraction.

1. Caries Classification (ICDAS – International Caries Detection and Assessment System
1 – Sound tooth
1-2 – Initial (white spot, early demineralization)
3-4 – Moderate (enamel breakdown)
0– Severe (dentin involvement, deep cavities)



pulp

reversible pulpitis
Irreversible pulpitis
Acute irreversible pulpitis
Chronic irreversible pulpitis
pulp necrosis
Acute Apical periodontitis
Chronic apical periodontitis
Periapical abscess
Periapical granuloma
Periapical cyst
Periapical scar

Bacterial invasion through pulp exposure

D = 100·X + 100·Y + 10·Z

From grossman

Box4.3F
Clinical Classification of the Diseases of the Pulp

1. Inflammatory diseases of the dental pulp
(a) Reversible pulpitis
(i) Acute reversible pulpitis
(i) Chronic reversible pulpitis
(b) Irreversible pulpitis
(i) Symptomatic irreversible pulpitis (previously known as
acute irreversible pulpitis)
(i) Asymptomatic irreversible pulpitis (previously known as
chronic irreversible pulpitis)
(i) Chronic hyperplastic pulpitis (also known as pulpal
hyperplasia)
(iv) Internal resorption
Pulp degeneration
(a) Calcific degeneration (radiographic diagnosis)
(b) Fibrous degeneration


2. Pulp necrosis
(a) Pulp necrobiosis (part of pulp is necrotic and infected; the
rest is irreversibly inflamed)
(b) Pulp necrosis with no signs of infection
(c) Necrotic and infected pulp



Box 5.2
Classification of Diseases of Periradicular Tissues
Clinical classification of periradicular diseases

1. Symptomatic periradicular diseases
known as acute apical periodontitis)
(a) Primary symptomatic apical periodontitis (previously) Secondary symptomatic apical periodontitis (acute exacerbation of asymptomatic apical periodontitis or phoenix abscess)
(c) Symptomatic (acute) alveolar abscess


2. Asymptomatic periradicular diseases.
(a) Asymptomatic apical periodontitis (previously known as
chronic apical periodontitis)
(b) Asymptomatic (chronic) alveolar abscess
(c) Condensing osteitis


3. Persistent apical periodontitis


4. External root resorption


5. Diseases of the periradicular tissues of nonendodontic origin
. Histopathalogic classification of periradicular diseases:


6. Apical granuloma


7. Apical abscess


8. Apical cyst



Step 8: Clinical Manifestations (Symptom Mapping)

Objective: Observe signs and symptoms and associate them with affected coordinates. By Link states to observable symptoms.
Method: Symptomatological Mapping
Maps external symptoms to internal dysfunctions

paths
Symbolic Diagnostic Rules


Endo

1. If enamel loss ∧ sensitivity∧  pain → pulpitis


2. If enamel loss  ∧  sensitivity ∧ pain  ∧ tender on percussion → apical peridontisis



Perio
Swollen and beedling or Recession and pocket or abscess and  mobility

Give above in

A lattice is a partially ordered set (poset) where every two elements have a unique least upper bound (join) and greatest lower bound (meet). In this case, the nodes represent stages of disease progression, and the arrows represent the order of progression.

Let  be the set of all disease states:

D = {E0, E1, E1.5, E2, E2.5, E3, E4, P1, P1.5, P2, P2.5, P3, P4}

Define the ordering between disease states (e.g., E0 < E1 < E1.5 < E2 < E2.5 < E3 < E4, etc.).

The lattice structure is represented by the partially ordered set:

(D, \leq)

2. Causal Chains: Natural Language and Mathematical Representation



Each disease state progression can be represented as a causal chain. A causal chain shows the deterministic or probabilistic relationship between stages.

Natural Language: "Enamel loss (E0) causes Reversible Pulpitis (E1), which can progress to Irreversible Pulpitis (E1.5), leading to Pulp Necrosis (E2), and so on."

Mathematical Representation: Using functions, we can write causal relations:

E1 = f(E0) \quad \text{(Enamel loss causes Reversible Pulpitis)}

E1.5 = f(E1) \quad \text{(Reversible Pulpitis progresses to Irreversible Pulpitis)} ]

Where  is a function that returns the next stage based on the current stage.

3. Markov Chains: Mathematical Representation



A Markov chain is a stochastic process where the probability of moving to the next state depends only on the current state, not on the sequence of events that preceded it.

State Space:

S = {E0, E1, E1.5, E2, E2.5, E3, E4, P1, P1.5, P2, P2.5, P3, P4}

Transition Matrix: This matrix contains the probabilities of transitioning from one state to another.

P = \begin{bmatrix}
P(E0 \to E1) & P(E0 \to E1.5) & \cdots \
P(E1 \to E2) & P(E1 \to E1.5) & \cdots \
\vdots & \vdots & \ddots
\end{bmatrix}

Example: Suppose the probability of transitioning from Reversible Pulpitis (E1) to Irreversible Pulpitis (E1.5) is 0.6, and to Pulp Necrosis (E2) is 0.4.

P(E1 \to E1.5) = 0.6, \quad P(E1 \to E2) = 0.4

The Markov process is memoryless:

P(E_{i+1} | E_i, E_{i-1}, \dots, E_0) = P(E_{i+1} | E_i)

Where  is the probability of transitioning to the next state given the current state.

4. Fuzzy Logic: Mathematical Representation



Fuzzy logic can represent the uncertainty and imprecision in mapping symptoms to disease states.

Fuzzy Set: Each disease state can be a fuzzy set, with membership functions that quantify how likely a symptom is associated with a particular disease state.

Membership Function: For a symptom like "pain," the membership function  could look like this:

\mu_{\text{pain}}(E1.5) = 0.7, \quad \mu_{\text{pain}}(E2) = 0.2

Fuzzy Rule Base:

\text{IF pain AND swelling THEN E3 = 0.8, P3 = 0.6}

Where:

means the disease state of E3 (Apical Abscess) is 80% likely.

means the disease state of P3 (Severe Periodontitis) is 60% likely.

Fuzzy Inference: After applying fuzzy rules, a defuzzification process gives crisp results. For example:

\text{Defuzzify}(E3, P3) = 0.7 \quad \text{(apical abscess is the most likely condition with 70% confidence)}

5. Signs and Symptoms Mapping: Natural Language and Mathematical Representation



Symptoms can be mapped to disease states using fuzzy logic or predefined mappings.

Natural Language: "Pain can be a symptom of both Irreversible Pulpitis (E1.5) and Pulp Necrosis (E2), but the severity of the pain will influence which stage is more likely."

Mathematical Representation: A symptom  is mapped to a disease state  with a membership value:

\mu_{\text{symptom}}(E_i) \quad \text{for each disease stage}

\mu_{\text{sharp pain}}(E1.5) = 0.9, \quad \mu_{\text{sharp pain}}(E2) = 0.1


---

