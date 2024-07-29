# Operating System (OS)

An operating system is like the manager of a computer. It's software that manages all the hardware and software resources of a computer system.

An operating system acts as a bridge between software and hardware, enabling software programs to interact with hardware and efficiently manage computer resources.

```
                            _____________________________
                            |                             |
                            |         Applications        |
                            |_____________________________|
                                        |
                                    ___________
                                    |           |
                                    | Operating |
                                    |  System   |
                                    |___________|
                                /       |       \
                            ______/   _______    \_________
                            |       | |       | |           |
                            | Hardware | Devices | Resources|
                            |_________| |_______| |_________|
```

1. `Hardware`: This includes all the physical components of the computer, like the CPU, memory (RAM), storage drives (hard disk, SSD), input/output devices (keyboard, mouse, monitor), etc.

2. `Devices`: These are peripherals and devices connected to the computer, such as printers, scanners, and external drives.

3. `Resources`: These are resources managed by the OS, such as CPU time, memory space, file storage, and network access.

4. `Operating System`: It sits between the hardware and the applications you use. It manages the hardware resources, provides services for programs (like opening files), and controls the overall operation of the computer.

5. `Applications`: These are the programs and software that users interact with directly, like web browsers, word processors, games, etc. Applications communicate with the OS to utilize hardware resources and perform tasks.


## Kernel

![kernal](./images/kernel.png)

The kernel is the core(heart) component of an operating system. It is responsible for managing the computer's resources and providing the essential services that allow other software to function properly. 

1. `Core Functionality`: The kernel handles essential tasks such as memory management (allocating and deallocating memory), process management (scheduling tasks for efficient execution), and device management (controlling peripheral devices like keyboards and printers).

2. `Interaction`: It serves as the intermediary between software applications and the hardware of the computer, facilitating communication and ensuring that programs can access and utilize hardware resources effectively.

3. `Types`: Kernels can be classified into different types, including monolithic kernels (where all kernel services run in a single address space) and microkernels (where kernel services are separated into different processes).

4. `Critical Component`: Without the kernel, the operating system cannot function. It provides the foundational layer that enables higher-level software to run and perform tasks on the hardware.


```
                         ____________________________________________________________
                        |                         Operating System                   |
                        |____________________________________________________________|
                                      |                                |
                                ______|_________             __________|__________
                                |               |           |                    |
                                |    Kernel     |<--------->|   Hardware         |
                                |_______________|           |____________________|
```

Functionality:

   - `Kernel to Hardware`: The kernel acts as an intermediary between the hardware and the rest of the operating system. It controls access to hardware resources, ensuring that multiple software programs can run simultaneously without conflicts.

   - `Kernel to Applications`: Applications and user-level software interact with the kernel to request services and resources from the hardware. The kernel facilitates these requests and ensures that they are handled efficiently.

---------

## Type of OS

Operating systems (OS) are essential software that manage computer hardware and software resources and provide common services for computer programs. 

Here are some examples of widely used operating systems:

1. `Microsoft Windows`: Developed by Microsoft, Windows is one of the most prevalent operating systems for personal computers. Versions include Windows 10, Windows 11, and various editions like Home, Pro, Enterprise, etc.

2. `MacOS`: Developed by Apple Inc., MacOS is the operating system used exclusively on Apple's Macintosh computers. It's known for its user-friendly interface and integration with other Apple products.

3. `Linux`: Linux is a family of open-source Unix-like operating systems based on the Linux kernel. It is widely used in servers, embedded systems, and as the basis for many other specialized operating systems (distributions or distros) like Ubuntu, Fedora, Debian, and CentOS.

4. `iOS`: Developed by Apple Inc., iOS is the operating system specifically designed for Apple's mobile devices like the iPhone and iPad. It is known for its security, performance, and ecosystem integration.

5. `Android`: Developed by Google, Android is the most widely used operating system for mobile devices globally. It's based on the Linux kernel and is open-source, allowing a wide range of manufacturers to use and customize it for their devices.

6. `Unix`: Unix is a powerful, multi-user, and multitasking operating system originally developed in the 1970s. It has since spawned many variants and influenced the design of other operating systems, including Linux and MacOS.

7. `Chrome OS`: Developed by Google, Chrome OS is a Linux-based operating system designed primarily for devices such as Chromebooks. It revolves around the Chrome web browser and is primarily intended for users who rely on web applications and cloud storage.

8. `FreeBSD`: A Unix-like operating system descended from Research Unix via the Berkeley Software Distribution (BSD). It is known for its focus on performance, stability, and advanced networking capabilities.

---


## Linux os

Linux is a free, stable, and highly secure operating system known for its exceptional performance. 

Linux distributions, often referred to as "distros," are variants of the Linux operating system that package together the Linux kernel with a collection of software applications and tools. Each distribution is designed to serve different purposes and cater to diverse user needs. 

some examples of Linux distributions:

 - `Ubuntu`: Derived from Debian, Ubuntu is known for its ease of use, regular releases, and strong community support. It offers desktop, server, and cloud editions, with LTS versions providing long-term support.

  - `Debian`: A versatile, community-driven distro known for its stability and commitment to free software principles. Debian serves as the foundation for many other distributions.

  - `CentOS`: A community-driven project that rebuilds the open-source components of RHEL. CentOS is widely used in server environments due to its stability and compatibility with RHEL.

  - `Fedora`: Developed by the Fedora Project and sponsored by Red Hat, Fedora emphasizes innovation and includes cutting-edge technologies. It serves as a testbed for features later incorporated into Red Hat Enterprise Linux (RHEL).