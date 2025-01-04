# FIFO_Buffer_HDL

# CONCEPT

* FIFO
> * First in first out
> ![alt text](image/fifo0.png)
>
> * Configuration
> ![alt text](image/fifo1.png)
>

* FIFO Circular Queue Implementation
> * Initial (empty)
> ![alt text](image/fifo2.png)  
>
> * Write
> ![alt text](image/fifo3.png)
> ![alt text](image/fifo4.png)
>
> * Read
> ![alt text](image/fifo5.png)
>
> * Full & Empty
> ![alt text](image/fifo6.png)
>
> ``` 
> Difference between full and empty:
>   ├── Case 1(Only Read): If r_ptr_next == w_ptr => positive empty signal
>   └── Case 2(Only Write) If W_ptr_next == r_ptr => positive full signal
>   └── Case 3(Read & Write) 
>            if (positive empty) {
>                w_ptr_next = w_ptr;
>                r_ptr_next = r_ptr;}
>            else {
>                w_ptr_next = w_ptr + 1;
>                r_ptr_next = r_ptr + 1;
>            }
> ```

* FIFO HDL Implementation
> * Hierarchy module: 
> ``` 
> fifo_unit.v  
>   ├── fifo_ctrl.v  
>   └── register_file.v  
> ```

    
>
> * Block diagram
> ![alt text](image/fifo7.png)
>

# PERFORMANCE
* Project Summary
> ![alt text](image/fifo11.png)
>
> ![alt text](image/fifo8.png)
>
* Timing
> ![alt text](image/fifo9.png)
>
> ![alt text](image/fifo10.png)

# SIMULATION

> ![alt text](image/fifo12.png)