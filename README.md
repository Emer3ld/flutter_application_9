# Nitinol Lotus Flower: Interactive Air Quality Sensor 

## 📌 Project Overview
This project explores the intersection of **architecture, environmental monitoring, and responsive design** by creating a **Nitinol-based kinetic sculpture** that reacts to **VOC (Volatile Organic Compounds) and PM2.5** levels in indoor spaces. Instead of traditional digital air quality displays, this **biomimetic installation** provides a sensory experience, enhancing occupant awareness and well-being.

## 🎯 Key Features
- **Air Quality Monitoring**: Reads VOC and PM2.5 levels from pre-recorded sensor data (CSV format).
- **Interactive Kinetic Response**: Uses **Nitinol shape memory alloy** to open/close a lotus flower sculpture in response to air quality changes.
- **Human-Centered Design**: Inspired by **biomimicry**, offering an intuitive, non-digital representation of environmental data.
- **Python & Arduino Integration**: Uses an **Arduino Portenta H7** with a Vision Shield SD card module to read sensor data and control a heating pad.
- **Cross-Disciplinary Research**: Merges **architecture, psychology, IoT, and environmental science** to explore responsive design.

---

## 🛠 Installation & Setup
### **Hardware Requirements**
- **Arduino Portenta H7** (with Vision Shield for SD card support)
- **Heating pad** (5V safe operation)
- **Nitinol wire** (Shape Memory Alloy for actuation)
- **SD card** (for storing sensor data)
- **Power Supply** (5V for safe operation)
- **Soldering Kit & Wiring** (for hardware connections)

### **Software Requirements**
- **Arduino IDE** (for flashing the Portenta H7)
- **Python 3.8+** (for data pre-processing)
- **Pandas** (for CSV handling)
- **RPi.GPIO** (for Raspberry Pi implementation, if applicable)

---

## 🚀 Usage Instructions
### **1. Hardware Setup**
- Connect the **heating pad** to the **Arduino Portenta H7** via GPIO pin **9**.
- Insert the **SD card** into the Vision Shield with **VOC sensor data stored in `voc_sensor_11.csv`**.
- Ensure all **wiring is secured**, and the device is powered via USB or an external 5V source.

### **2. Uploading Code to Arduino**
- Open **Arduino IDE**.
- Install necessary libraries (`SD.h`, `SPI.h` for SD card reading).
- Upload the provided **Arduino sketch** (`main.ino`) to the Portenta H7.

### **3. Running the Python Script (Optional for Data Analysis)**
- Navigate to the project directory.
- Run the script to analyze CSV sensor data:
  ```bash
  python analysis_script.py
  ```

---

## 📜 Code Explanation
### **Arduino Code (Heating Pad Activation)**
- Reads **VOC data** from `voc_sensor_11.csv` on the **SD card**.
- If VOC levels exceed **600 ppm**, **activates heating pad** to shape-change the **Nitinol Lotus Flower**.
- Runs in a **loop**, resetting to the start of the CSV once completed.

### **PythonCode**
- Uses **Pandas** to read **CSV sensor data**.
- Logs VOC levels over time.
- Outputs analysis of **VOC-PM2.5 correlation**.

---

## 📊 Research & Theory
### **Architectural & Psychological Impact**
- **Parallax Concept**: The interactive element shifts perception and engagement with environmental data.
- **Human-Centered Design**: Encourages users to form a **connection with air quality** through a tactile, organic representation.
- **Sick Building Syndrome (SBS) Prevention**: Real-time engagement helps occupants take **preemptive actions** to improve IAQ.

### **Scientific Basis**
- **VOC & PM2.5 Correlation**: Secondary Organic Aerosols (SOA) formation is influenced by humidity levels.
- **Shape Memory Alloy (SMA) Mechanics**: Nitinol responds to **heat**, enabling mechanical actuation based on IAQ metrics.

---

## 🔥 Future Improvements
- **Live Sensor Integration**: Upgrade from CSV-based readings to **real-time sensor data** using **IoT**.
- **AI Predictive Model**: Implement **machine learning** to forecast air quality trends.
- **Expanded Material Testing**: Explore more **heat-efficient** materials for **faster actuation**.


### **Contact**
- **Author**: Sarah Gomez
📜 Copyright Notice
© Sarah Gomez, 2025. All Rights Reserved.

This project, including its design, code, and documentation, is the intellectual property of the Author. Unauthorized reproduction, modification, distribution, or commercial use of any part of this project is strictly prohibited without explicit written permission from the author.
