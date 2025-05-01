# DentScript Overview

DentScript is a concise dental language designed to standardize the recording of patient information. This document provides an overview of the entities, relationships, syntax, and grammar used in DentScript.

## Key Entities
- [[Patient]]
- [[Tooth]]
- [[Diagnosis]]
- [[Treatment]]
- [[Appointment]]
- [[Dentist]]

## Relationships
- **Patient ↔ Tooth**: A patient has multiple teeth.
- **Tooth ↔ Diagnosis**: A tooth can have multiple diagnoses.
- **Diagnosis ↔ Treatment**: A diagnosis may lead to multiple treatments.
- **Patient ↔ Appointment**: A patient can have multiple appointments.
- **Appointment ↔ Dentist**: Each appointment is associated with a dentist.

## Syntax Overview
- See [[DentScript Syntax]] for detailed syntax rules.

## Grammar Rules
- Refer to [[DentScript Grammar]] for detailed grammar guidelines.


# DentScript UML Class Diagram



```plantuml

@startuml
' Define the Patient class
class Patient {
  +String id
  +String name
  +int age
  +String gender
  +String medicalHistory
  +List<Tooth> teeth
}

' Define the Tooth class
class Tooth {
  +String id
  +String location
  +String condition
  +List<Diagnosis> diagnoses
}

' Define the Diagnosis class
class Diagnosis {
  +String id
  +String type
  +String severity
  +Date diagnosedOn
  +List<Treatment> treatments
}

' Define the Treatment class
class Treatment {
  +String id
  +String type
  +String details
  +Date treatmentDate
}

' Define the Appointment class
class Appointment {
  +String id
  +Date date
  +String notes
  +Patient patient
  +Dentist dentist
}

' Define the Dentist class
class Dentist {
  +String id
  +String name
  +String specialization
}

' Relationships
Patient "1" -- "many" Tooth : has
Tooth "1" -- "many" Diagnosis : may have
Diagnosis "1" -- "many" Treatment : leads to
Patient "1" -- "many" Appointment : schedules
Appointment "1" -- "1" Dentist : with
@enduml




```





