## The first terminologies are from OOP

- ### Class
contains related feature and functionality, it contain variable and routines etc.

- ### Properties
Variable in a class. 

- ### Method
Task or function in a class.

- ### Members
Methods and Properties in a class.

- ### Object
Object is an instance of class which will be instantiated the class.

- ### Handle
handle is pointer which point the value of arguement to property of class i.e *this.name*.

- ### Encapsulation
when class contain properties and method for itself or operate on them.

- ### Agrregation/Composition
A class contain a refrence to another class for example drived class and this method uses the *has-a* relationship.

- ### Construct
building object by calling new() function.

- ### OOP Heirarchy
relationship between drive and base class is called *is-a* process. and this property of OOP heirarchy is inheritance type.


## Some terminologies are from UVM

- ### Create
Create is a method to contruct an object indirectly from UVM factory pattern instead of calling new().

- ### Transaction
Transaction of data is destoyed and generated every point in stimulus. 

- ### Component
Component is the component of envoronment like driver,monitor.

- ### UVM Heirarchy
this is the heirarchy of UVM like Test has an environment and environment has an agent.

# Verification Methodologies

## Goal of Verification Methodologies

- ### Reuse
the goal of verification is increases reusability for variety of test by confiuring an environment.

- ### Interoperatibility
Verification that works with tools for example DUT is test under different tools by using Verification methodology.

- ### Verification Intellectual Property (VIP)
Verification code of component that makes the design.

- ### Best Practices
consistency way of using with all the user and all the tools.

## What is UVM
UVM stand  for universal verification methodologies. an industrial verification standard which Accellera creates. 

![image](https://user-images.githubusercontent.com/81433387/182689947-18d78233-4c31-42a6-b63b-32be0a49455b.png)

The upper test class is for build and configure the environment and generate the stimulus and the test class you can determine how many time we run the particular stimulus, what typy of transaction and what is the version of particular component

The Envirinment class instantes the component for driving transaction to DUT. Monitoring value from DUT and checking value as well 

The design under test communicate through system verilog interface that has different methods for driving transaction to DUT and get the result from it.

all of these component are constructed under the base class called uvm_root

![image](https://user-images.githubusercontent.com/81433387/182692897-b0044f90-52af-4232-bb41-84d7ac0c8ae2.png)


- # Verification Phases

Any class based Verification has three phases 
- ### Construction

  * where the component is connected congigured and constructed

- ### Run Time Task 
  * Simulation time is consumed, sending and recieving the transaction

- ### Clean-up stage
  * Results is collected verified and final report are generated

these stages needs to be synchronized with all the component this means that not any stage are completed while previous stage are in construction stage

`How this approach implemented??`

The testbench component are drive from the common base class. these base class define empty virtual methods for these different stages of the design for `virtual function for construction`, `virtual tasks for Run_time_task`,`virtual function for Clean-up`. then each component override the methods which are necessary for specific component by using this method synchronizing is maintain in same order for every component 

![image](https://user-images.githubusercontent.com/81433387/182699145-1d385adb-5666-4fba-b069-2f4d1a2759a7.png)
