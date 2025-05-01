# Patient


---
tags: [dentistry, language, DentScript]
created: 2024-08-17

---

# Patient
...

The `Patient` entity represents an individual receiving dental care. Key attributes include:

- **ID**: A unique identifier for the patient.
- **Name**: Full name of the patient.
- **Age**: Patient's age.
- **Gender**: Patient's gender.
- **Medical History**: Relevant medical history that could affect dental treatment.

### Relationships
- **Patient ↔ Tooth**: One-to-many relationship. A patient has multiple teeth.
- **Patient ↔ Appointment**: One-to-many relationship. A patient can have multiple appointments.

### Example
```markdown
PATIENT: John Doe (ID: 001)
Age: 35
Gender: Male
Medical History: None