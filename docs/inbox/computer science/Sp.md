
```

CREATE TABLE odontograms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    tooth_number INT NOT NULL,
    condition ENUM('decayed', 'missing', 'stains', 'none') NOT NULL,
    findings TEXT,  -- Optional, for additional notes
    diagnosis TEXT, -- Optional, for diagnosis details
    treatment_plan TEXT, -- Optional, for treatment recommendations
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_tooth_per_patient (patient_id, tooth_number)
);

```
