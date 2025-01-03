# FIFO_Buffer_HDL

# CONCEPT

* FIFO
> * First in first out
> ![alt text](image/fifo0.png)

> * Configuration
> ![alt text](image/fifo1.png)

* FIFO Circular Queue Implementation
> * Initial (empty)
> ![alt text](image/fifo2.png)  

> * Write
> ![alt text](image/fifo3.png) 
> ![alt text](image/fifo4.png) 

> * Read
> ![alt text](image/fifo5.png)

> * Full & Empty
> ![alt text](image/fifo6.png)

* FIFO HDL Implementation
> * Hierarchy module:
> |--fifo_unit.v
>       |--fifo_ctrl.v
>       |--register_file.v

> * Block diagram
> ![alt text](image/fifo7.png)