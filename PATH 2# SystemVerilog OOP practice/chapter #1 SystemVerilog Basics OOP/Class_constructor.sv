//
//  Class: Animal
//
class Animal;
    //  Group: Variables
    string name;
    int age;

    //  Constructor: new
    function new(string name ,int age);
        name = "spot";
        age = 5;
    endfunction: new

    //  Group: Functions
    function print()
        $display("animal name= %s, age= %d",name,age)
    endfunction

endclass: Animal

Animal a_h;
initial begin
    a_h = new();
    a_h.print();
end
