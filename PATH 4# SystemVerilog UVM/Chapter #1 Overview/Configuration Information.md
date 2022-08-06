# Configuration Information

The main goal of UVM is reusibility. and this can be done with configure environment which can be used with different projects.

In order to acheive this goal we need mechanism which can be store the configuration whic can effect you testbench 

UVM class library provide verious utility to support storing or retriving a configuration. 

In testbench there are several classes each type of component class. 1 object of the configuration class will be created for every object of its relative component class.This configuration may be randomized or per-test value.

We have 2 types of configuration classes 1 for configuring the environment and other is configuring the agent each agent have their own configuration class.

```
class env_config extends uvm_objects; // env_configuration class controll which of the environment subcomponent are build
    //factory macro and constructor are here 

    rand bit  enable_scoreboard;
endclass
```