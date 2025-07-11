# 🔗 Low-Power 8x8 Wallace Tree Multiplier with Clock Gating and Pipelining (Verilog)

This project implements an **8-bit Wallace Tree Multiplier** in **Verilog** using **structural modeling**, featuring **clock gating**, **pipelining**, and **combinational compressor logic** for optimized speed and area. Designed for **FPGA/ASIC** use cases, the multiplier demonstrates practical low-power design principles suitable for real-world VLSI systems.

---

## 📌 Key Features

- ✅ **8x8 Wallace Tree Multiplier**
- ✅ **Clock Gating**: Dynamic power reduction using gated clocks
- ✅ **Pipelining**: Multi-stage registered datapath for higher throughput
- ✅ **Structural Modeling**: Built using `compressor_3_2` modules and gate-level instantiation
- ✅ **Synthesis & Simulation Ready**: Tested on **Xilinx Vivado WebPACK**

---

## 🧠 Architecture Highlights

### 🔧 Compressor-Based Wallace Tree
Uses **3:2 compressors** to reduce partial products layer by layer.

### ⚡ Clock Gating
Implements a **`clock_gating`** module to disable unnecessary switching when the enable signal (`en`) is low.

### 🏗 Structural Design Flow
Completely modeled at the **gate/module level**, mimicking industrial RTL development practices.

---

## 📁 File Structure

| File                         | Description                                      |
|------------------------------|--------------------------------------------------|
| `compressor_3_2.v`           | Core compressor module for 3-input to 2-output  |
| `clock_gating.v`             | Gated clock generator based on enable signal    |
| `wallace_tree_structural.v` | Structural design of 8x8 Wallace tree logic     |
| `wallace_multiplier_structural.v` | Wrapper top-level multiplier module            |
| `tb_wallace_structural.v`   | Testbench for functional simulation              |

---

## 📷 Waveform Output

> 📸 *Waveform simulation results are shown below to verify correct pipelined output generation.*

![waveform](waveform.png)

---

## ▶️ Simulation Instructions (Vivado)

1. Open **Vivado WebPACK** and create a new RTL project.
2. Add the following source files:
   - `compressor_3_2.v`
   - `clock_gating.v`
   - `wallace_tree_structural.v`
   - `wallace_multiplier_structural.v`
   - `tb_wallace_structural.v`
3. Set **`tb_wallace_structural`** as the **Simulation Top Module**.
4. Run **Behavioral Simulation**.
5. Use the **Waveform Viewer** to observe pipelined multiplier outputs.

---

## 🧱 Synthesis Instructions

1. Set `wallace_multiplier_structural` as the **Top Module**.
2. Run **RTL Elaboration** and **Synthesis**.
3. Check:
   - Resource Utilization Report (LUTs, FFs)
   - Timing Summary
   - RTL Netlist Viewer

💡 *No physical FPGA board required.*

---

## 📊 Applications

- ASIC/FPGA multiplier units in ALUs or DSPs
- Power-aware hardware accelerators
- Digital signal processing pipelines
- VLSI coursework or professional verification workflows

---

## 📃 License

This project is released under the [MIT License](LICENSE).

---

## 💬 Contact

If you have questions, suggestions, or ideas for improvement, feel free to connect via [GitHub Issues](https://github.com/).
