# OSP
operating system principles

## Bibliography

### Introduction

Dennis M. Ritchie and Ken Thompson. 1983. The UNIX time-sharing system. *Commun. ACM* 26, 1 (January 1983), 84–89. DOI:https://doi.org/10.1145/357980.358014

Thomas Narten and Mark Burgess. 2003. Unix operating system. In *Encyclopedia of computer science*. John Wiley and Sons Ltd., GBR, 1816–1819.

### Processes and Threads

Manuel Serrano, Frédéric Boussinot, and Bernard Serpette. 2004. Scheme fair threads. In *Proceedings of the 6th ACM SIGPLAN international conference on principles and practice of declarative programming* (PPDP ’04), Association for Computing Machinery, New York, NY, USA, 203–214. DOI:https://doi.org/10.1145/1013963.1013986

Myung Kuk Yoon, Keunsoo Kim, Sangpil Lee, Won Woo Ro, and Murali Annavaram. 2016. Virtual thread: Maximizing thread-level parallelism beyond GPU scheduling limit. In *Proceedings of the 43rd international symposium on computer architecture* (ISCA ’16), IEEE Press, Seoul, Republic of Korea, 609–621. DOI:https://doi.org/10.1109/ISCA.2016.59

Brian T. Lewis. 2003. Coroutine. In *Encyclopedia of computer science*. John Wiley and Sons Ltd., GBR, 465–466.

Chris Shaver and Edward A. Lee. 2012. The coroutine model of computation. In *Proceedings of the 15th international conference on model driven engineering languages and systems* (MODELS’12), Springer-Verlag, Berlin, Heidelberg, 319–334. DOI:https://doi.org/10.1007/978-3-642-33666-9_21

* [Parrot: A Practical Runtime for Deterministic, Stable, and Reliable Threads](/others/parrot-sosp13.pdf)

Cui, H, J Šimša, Y Lin, H Li, B Blum, X Xu, J Yang, Ga Gibson, and Re Bryant. “Parrot: A Practical Runtime for Deterministic, Stable, and Reliable Threads.” ACM, 2013.


### Deadlocks

Christian Gram Kalhauge and Jens Palsberg. 2018. Sound deadlock prediction. *Proc. ACM Program. Lang.* 2, OOPSLA (October 2018). DOI:https://doi.org/10.1145/3276516

J. G. Hunt. 1986. Detection of deadlocks in multiprocess systems. *SIGPLAN Not.* 21, 1 (January 1986), 46–48. DOI:https://doi.org/10.1145/382282.382421

### Memory Management

Peter J. Denning. 2003. Virtual memory. In *Encyclopedia of computer science*. John Wiley and Sons Ltd., GBR, 1832–1835.

Kathryn S. McKinley. 2016. Next generation virtual memory management. *SIGPLAN Not.* 51, 7 (March 2016), 107. DOI:https://doi.org/10.1145/3007611.2892244

* [Transactional Memory: Architectural Support for Lock-Free Data Structures](/AllinAll/others/herlihy93transactional.pdf)

Herlihy, Maurice, and J. Eliot B. Moss. “Transactional Memory: Architectural Support for Lock-Free Data Structures.” In Proceedings of the 20th Annual International Symposium on Computer Architecture, 289–300. ISCA ’93. New York, NY, USA: Association for Computing Machinery, 1993. https://doi.org/10.1145/165123.165164.


### File Systems

Marshall K. McKusick, William N. Joy, Samuel J. Leffler, and Robert S. Fabry. 1984. A fast file system for UNIX. *ACM Trans. Comput. Syst.* 2, 3 (August 1984), 181–197. DOI:https://doi.org/10.1145/989.990

Yongseok Son, Hyuck Han, and Heon Young Yeom. 2015. Optimizing file systems for fast storage devices. In *Proceedings of the 8th ACM international systems and storage conference* (SYSTOR ’15), Association for Computing Machinery, New York, NY, USA. DOI:https://doi.org/10.1145/2757667.2757670

Keith A. Smith and Margo I. Seltzer. 1997. File system Aging—Increasing the relevance of file system benchmarks. In *Proceedings of the 1997 ACM SIGMETRICS international conference on measurement and modeling of computer systems* (SIGMETRICS ’97), Association for Computing Machinery, New York, NY, USA, 203–213. DOI:https://doi.org/10.1145/258612.258689

* [Hfs: A Hybrid File System Prototype for Improving Small File and Metadata Performance](http://dl.acm.org/doi/abs/10.1145/1272996.1273016)

Zhang, Zhihui, and Kanad Ghose. “Hfs: A Hybrid File System Prototype for Improving Small File and Metadata Performance.” Acm Sigops Operating Systems Review 41, no. 3 (2007): 175–87.


### Input/Output

Sara McAllister, Benjamin Berg, Julian Tutuncu-Macias, Juncheng Yang, Sathya Gunasekar, Jimmy Lu, Daniel S. Berger, Nathan Beckmann, and Gregory R. Ganger. 2021. Kangaroo: Caching billions of tiny objects on flash. In *Proceedings of the ACM SIGOPS 28th symposium on operating systems principles* (SOSP ’21), Association for Computing Machinery, New York, NY, USA, 243–262. DOI:https://doi.org/10.1145/3477132.3483568

### Virtualization

Michael Pearce, Sherali Zeadally, and Ray Hunt. 2013. Virtualization: Issues, security threats, and solutions. *ACM Comput. Surv.* 45, 2 (March 2013). DOI:https://doi.org/10.1145/2431211.2431216

Oren Laadan and Jason Nieh. 2010. Operating system virtualization: Practice and experience. In *Proceedings of the 3rd annual haifa experimental systems conference* (SYSTOR ’10), Association for Computing Machinery, New York, NY, USA. DOI:https://doi.org/10.1145/1815695.1815717

G. Shrikanth. 2009. Xen and the Art of Virtualization. *Dataquest* 27, 10 (2009), 97–97.

* [Firecracker: Lightweight Virtualization for Serverless Applications](/others/nsdi20-paper-agache.pdf)

Agache, Alexandru, Marc Brooker, Alexandra Iordache, Anthony Liguori, Rolf Neugebauer, Phil Piwonka, and Diana-Maria Popa. “Firecracker: Lightweight Virtualization for Serverless Applications.” In 17th USENIX Symposium on Networked Systems Design and Implementation (NSDI 20), 419–34. Santa Clara, CA: USENIX Association, 2020. 

### Security

C. Nachenberg. 1997. Computer Virus — Coevolution. *Communications of the Acm* 40, 1 (1997), 46–51.

### Multiple Processor Systems

M. D Janssens, J. K Annot, and A. J Van De Goor. 1986. Adapting UNIX for a multiprocessor environment. *Commun. ACM* 29, 9 (September 1986), 895–901. DOI:https://doi.org/10.1145/6592.6598

S. Zhuravlev, J. C. Saez, S. Blagodurov, A. Fedorova, and M. Prieto. 2013. Survey of Scheduling Techniques for Addressing Shared Resources in Multicore Processors. *Acm Computing Surveys* 45, 1 (2013), 4.1-4.28.

### Operating System Design

W. K. Thompson. Unix and Beyond: An Interview.

* [The Synthesis Kernel](/others/TheSynthesisKernel.pdf)

Pu, C., H. Massalin, and J. Ioannidis. “The Synthesis Kernel” 1970.

* [Singularity: Rethinking the Software Stack](/others/osr2007_rethinkingsoftwarestack.pdf)

Hunt, G.C. and J.R. Larus, Singularity: Rethinking the Software Stack. SIGOPS Oper. Syst. Rev., 2007. 41(2): p. 37–49.

McKusick, Kirk M ,Bostic,et al.The design and implementation of the 4.4BSD operating system[J].Addison-Wesley, 1996.DOI:http://dx.doi.org/.

### Cases

* [LINUX is obsolete](/others/LINUXisobsolete.pdf)

