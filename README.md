📌 Post-Quantum Cryptography Optimization
This senior capstone project focuses on optimizing lattice-based cryptographic frameworks, with a particular emphasis on creating a twiddle factor generator for use in polynomial multiplication — a key performance bottleneck in post-quantum systems. Twiddle factors are complex roots of unity used in Number Theoretic Transforms (NTT), essential for efficient polynomial multiplication. By generating these values dynamically at runtime rather than precomputing them, we improve flexibility and reduce memory overhead in constrained environments.

The core algorithm implemented is based off of Falcon
![image](https://github.com/user-attachments/assets/ff271a77-4e8b-4900-8f7e-e1e99e5ada2c)

🔐 Problem Statement
The rise of quantum computing threatens classical cryptographic methods. This project explores resilient post-quantum cryptographic (PQC) solutions, specifically the Falcon digital signature algorithm — a lattice-based scheme requiring efficient polynomial operations.

⚙️ Core Contributions
Dynamic Twiddle Factor Generation: Implemented an algorithm to compute twiddle factors on-the-fly within the Falcon NTT pipeline, reducing static memory needs.

Montgomery Multiplier: Developed a pipelined and clock-efficient version of this multiplication engine in VHDL, optimized to complete in just 3 clock cycles.
![image](https://github.com/user-attachments/assets/1bf491db-97f1-414f-8999-acf9326b9d34)


Memory Access Optimization: Improved register access patterns to eliminate redundancy and enhance throughput, leveraging bit-reversed addressing.

System Architecture: Designed a modular execution flow including State Reset, Preload, First Run, Normal Run, and Completion stages.
![image](https://github.com/user-attachments/assets/15e8cb83-5816-4682-afec-6a7c0909868e)


🧠 Key Takeaways
Runtime Generation of Critical Values: Unlike conventional approaches that precompute and store twiddle factors, our system generates them during runtime, offering greater flexibility and lower static memory demands.

Hardware-Aware Design: Careful pipelining and logic optimization allow for high-speed arithmetic suited to FPGA or ASIC deployment.

Efficient Memory Control: Addressing strategies and pattern optimization reduce latency in polynomial operations critical to lattice-based cryptography.

![image](https://github.com/user-attachments/assets/496a9a3b-4d3d-46f3-a02a-c064a9ff214a)
