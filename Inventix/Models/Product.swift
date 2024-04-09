//
//  Product.swift
//  Inventix
//
//  Created by Khanh Chung on 3/28/24.
//

import Foundation

struct Product: Identifiable, Equatable, Hashable {
    var name: String
    var description = ""
    var category: Category
    var price: Decimal
    var sku: String
    var stock: Int = 0
    var minStock: Int
    var imageUrl: String
    var warehouse: Warehouse
    
    let id = UUID()
    
    static let example: [Product] = [
        Product(name: "Quantix Capacitor",
                description: "State-of-the-art energy storage device that harnesses quantum principles to provide unprecedented power density and fast recharge capabilities.",
                category: Category(name: "Energy Storage", description: "Products in this category focus on storing and managing energy efficiently, often utilizing advanced materials or principles such as quantum mechanics to enhance power density, recharge speed, and overall performance."),
                price: Decimal(string: "620.00") ?? 0,
                sku: "ERO-921",
                stock: 1000,
                minStock: 500,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/R7EsuQbHunkxH2Ff7myK.png",
                warehouse: Warehouse.example[0]),
        
        Product(name: "OmniGlide Transmitter",
                description: "Advanced wireless communication technology, enabling seamless data transmission across vast distances with minimal latency.",
                category: Category(name: "Communication", description: "This category includes products that facilitate the transmission of data and information, typically through wireless or wired channels. These products often prioritize speed, reliability, and low latency to enable seamless communication across various devices and networks."),
                price: Decimal(string: "780.00") ?? 0,
                sku: "ERO-CC1",
                stock: 2000,
                minStock: 2500,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/m07LDrMVvXbuv53I7ly2.png",
                warehouse: Warehouse.example[0]),
        
        Product(name: "Pulse Processor",
                description: "Signal amplification with its cutting-edge spectral analysis algorithms, delivering crystal-clear audio and unmatched fidelity.",
                category: Category(name: "Signal Processing", description: "Products in this category are designed to manipulate, analyze, and enhance signals, such as audio, video, or data streams. They may incorporate cutting-edge algorithms and technologies to amplify signals, extract relevant information, or remove noise, resulting in clearer and more accurate outputs."),
                price: Decimal(string: "776.00") ?? 0,
                sku: "ERO-CV1",
                stock: 5500,
                minStock: 5000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/mJqvJq2agaypGxgLPn9y.png",
                warehouse: Warehouse.example[0]),
        
        Product(name: "Wave Resonator",
                description: "Neurocomputing marvel, mimicking the complexity of the human brain to process and analyze vast amounts of data with lightning-fast speed.",
                category: Category(name: "Computing", description: "This category encompasses products related to computing hardware, software, and systems. These products may include components like processors, memory modules, and storage devices, as well as software applications and algorithms that enable data processing, analysis, and computation. They aim to improve computational speed, efficiency, and accuracy for various applications and industries."),
                price: Decimal(string: "377.00") ?? 0,
                sku: "ERO-LI1",
                stock: 1000,
                minStock: 2500,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/hXA1EjzahHpZwcuYlirB.png",
                warehouse: Warehouse.example[1]),
        
        Product(name: "Nanofiber Tube",
                description: "Components that enable ultra-compact and highly efficient electronic circuits, revolutionizing miniaturization in the field of electronics.",
                category: Category(name: "Electronics", description: "Electronics category description."),
                price: Decimal(string: "997.00") ?? 0,
                sku: "ERO-LC1",
                stock: 4500,
                minStock: 3500,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/hqV7lIkgf7GKL3duJSlo.png",
                warehouse: Warehouse.example[1]),
        
        Product(name: "Circuitbox",
                description: "An intense and precisely controllable beam of light that outshines conventional solutions.",
                category: Category(name: "Electronics", description: "Electronics category description."),
                price: Decimal(string: "24.00") ?? 0,
                sku: "ERO-WG1",
                stock: 1000,
                minStock: 2000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/aUB5oBbRpDWUCWdolWQj.png",
                warehouse: Warehouse.example[1]),
        
        Product(name: "Morphic Transistor",
                description: "Plasma-based magnetic fields to achieve unprecedented energy efficiency and compactness in energy storage and transfer systems.",
                category: Category(name: "Energy Storage", description: "Products in this category focus on storing and managing energy efficiently, often utilizing advanced materials or principles such as quantum mechanics to enhance power density, recharge speed, and overall performance."),
                price: Decimal(string: "693.00") ?? 0,
                sku: "ERO-CS1",
                stock: 2100,
                minStock: 1000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/8vaGMt5c6TckVD4nkduy.png",
                warehouse: Warehouse.example[2]),
        
        Product(name: "HyperLux Diode",
                description: "Resonator utilizes quantum entanglement to create stable and reliable oscillations, making it a cornerstone of advanced quantum computing and communication systems.",
                category: Category(name: "Computing", description: "This category encompasses products related to computing hardware, software, and systems. These products may include components like processors, memory modules, and storage devices, as well as software applications and algorithms that enable data processing, analysis, and computation. They aim to improve computational speed, efficiency, and accuracy for various applications and industries."),
                price: Decimal(string: "263.00") ?? 0,
                sku: "SDI-989",
                stock: 0,
                minStock: 1500,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/Z1NivEP9kiOxcJKs948A.png",
                warehouse: Warehouse.example[2]),
        
        Product(name: "Drive Amplifier",
                description: "Ipsum duis velit laborum non culpa. Irure excepteur elit cupidatat culpa do ipsum duis laboris ipsum commodo ipsum. Sit et veniam in velit non irure irure veniam sit nulla deserunt irure laboris. Reprehenderit anim cillum dolore anim officia amet in ad pariatur consequat. Proident qui eiusmod labore velit quis et commododolore ipsum reprehenderit sit elit consequat voluptate eiusmod tempor aliquip.",
                category: Category(name: "Miscellaneous", description: "Miscellaneous category description."),
                price: Decimal(string: "380.00") ?? 0,
                sku: "DSSO-790",
                stock: 2100,
                minStock: 2000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/SiFIpq1jrZkulqSca9dA.png",
                warehouse: Warehouse.example[2]),
        
        Product(name: "Gyro Actuator",
                description: "Secure data storage and processing by employing advanced encryption algorithms and impenetrable physical barriers to safeguard against cyber threats.",
                category: Category(name: "Security", description: "Security category description."),
                price: Decimal(string: "355.00") ?? 0,
                sku: "DSF-DD0",
                stock: 4000,
                minStock: 3500,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/KkRAlfLrTs0dNZ4mBG9D.png",
                warehouse: Warehouse.example[3]),
        
        Product(name: "Sync Stabilizer",
                description: "Advanced power management solution that regulates and stabilizes energy flow, ensuring a steady supply of electricity to critical systems.",
                category: Category(name: "Energy Management", description: "Energy Management category description."),
                price: Decimal(string: "1043.00") ?? 0,
                sku: "WID-WI9",
                stock: 4000,
                minStock: 2000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/8hD5yH8zZwGDWB3zoVRt.png",
                warehouse: Warehouse.example[3]),
        
        Product(name: "Core Inductor",
                description: "A highly adaptable material composed of exceptionally thin nanofibers, enabling its integration into numerous industries, from high-performance textiles to advanced filtration systems.",
                category: Category(name: "Material Science", description: "Material Science category description."),
                price: Decimal(string: "568.00") ?? 0,
                sku: "DSSO-790",
                stock: 2500,
                minStock: 1500,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/nbgqKgPY9QW99ZH9zTov.png",
                warehouse: Warehouse.example[3]),
        
        Product(name: "Quantum Relay",
                description: "Cutting-edge technology for transmitting data across quantum entangled particles, ensuring secure and instantaneous communication.",
                category: Category(name: "Communication", description: "This category includes products that facilitate the transmission of data and information, typically through wireless or wired channels. These products often prioritize speed, reliability, and low latency to enable seamless communication across various devices and networks."),
                price: Decimal(string: "767.00") ?? 0,
                sku: "SDI-966",
                stock: 2100,
                minStock: 1000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/sHMvlihrP8weChdytnyj.png",
                warehouse: Warehouse.example[0]),
        
        Product(name: "NanoProcessor",
                description: "Miniaturized computing powerhouse capable of executing complex algorithms with unparalleled efficiency and speed.",
                category: Category(name: "Computing", description: "This category encompasses products related to computing hardware, software, and systems. These products may include components like processors, memory modules, and storage devices, as well as software applications and algorithms that enable data processing, analysis, and computation. They aim to improve computational speed, efficiency, and accuracy for various applications and industries."),
                price: Decimal(string: "736.00") ?? 0,
                sku: "HRO-CS1",
                stock: 1200,
                minStock: 2000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/eAWESBLJyueYyB07WUS5.png",
                warehouse: Warehouse.example[0]),
        
        Product(name: "Photon Amplifier",
                description: "Amplifies and directs photon emissions for various applications in telecommunications, optical computing, and laser technology.",
                category: Category(name: "Electronics", description: "Electronics category description."),
                price: Decimal(string: "524.00") ?? 0,
                sku: "ERO-WG2",
                stock: 2300,
                minStock: 3000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/dnC3We4b8RoJJuw1QwQn.png",
                warehouse: Warehouse.example[1]),
        
        Product(name: "Data Encryptor",
                description: "Advanced encryption device that secures sensitive data with military-grade algorithms, protecting against unauthorized access and cyber threats.",
                category: Category(name: "Security", description: "Security category description."),
                price: Decimal(string: "943.00") ?? 0,
                sku: "ERO-CC1",
                stock: 3500,
                minStock: 2500,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/1mIjr1MAjTShpBJmzur1.png",
                warehouse: Warehouse.example[1]),
        
        Product(name: "Power Grid Optimizer",
                description: "AI-driven system for optimizing power distribution grids, reducing energy wastage and enhancing overall efficiency.",
                category: Category(name: "Energy Management", description: "Energy Management category description."),
                price: Decimal(string: "474.00") ?? 0,
                sku: "WIE-WI9",
                stock: 2000,
                minStock: 1500,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/UjykZZ7EpWWs3xJHa8cq.png",
                warehouse: Warehouse.example[3]),
        
        Product(name: "Quantum Sensor",
                description: "Utilizes quantum principles to detect and analyze minute changes in environmental factors, enabling advanced monitoring and control systems.",
                category: Category(name: "Signal Processing", description: "Signal Processing category description."),
                price: Decimal(string: "687.00") ?? 0,
                sku: "YUO-89F",
                stock: 2000,
                minStock: 3000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/2ivPSNWndZlSKFFiDDiY.png",
                warehouse: Warehouse.example[3]),
        
        Product(name: "Graphene Capacitor",
                description: "Revolutionary energy storage solution utilizing graphene's unique properties for high-capacity and rapid charging applications.",
                category: Category(name: "Energy Storage", description: "Energy Storage category description."),
                price: Decimal(string: "328.00") ?? 0,
                sku: "SDI-766",
                stock: 0,
                minStock: 4000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/ZA6P1j5Cdys9SowChIwZ.png",
                warehouse: Warehouse.example[1]),
        
        Product(name: "Bio-Sensing Module",
                description: "Integrates biological sensing technology for real-time monitoring of physiological data, facilitating advancements in healthcare and biotechnology.",
                category: Category(name: "Signal Processing", description: "Signal Processing category description."),
                price: Decimal(string: "567.00") ?? 0,
                sku: "ERO-231",
                stock: 5000,
                minStock: 2000,
                imageUrl: "https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/YGvI36VoQe5mJNelMBS1-template-builder/pub/ewyr9mrwaJBfASQqmVEj.png",
                warehouse: Warehouse.example[0])
    ]
}
