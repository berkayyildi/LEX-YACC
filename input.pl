#!/usr/bin/perl

print "Hello World\n";

# This is a single line comment

print "Hello, world\n";
print 'Hello, world\n';

$a = 10;
print "Value of a = $a\n";
print 'Value of a = $a\n';

$age = 25;             # An integer assignment
$name = "John Paul";   # A string 
$salary = 1445.50;     # A floating point

print "Age = $age\n";
print "Name = $name\n";
print "Salary = $salary\n";

@ages = (25, 30, 40);             
@names = ("John Paul", "Lisa", "Kumar");

print "\$ages[0] = $ages[0]\n";
print "\$ages[1] = $ages[1]\n";
print "\$ages[2] = $ages[2]\n";
print "\$names[0] = $names[0]\n";
print "\$names[1] = $names[1]\n";
print "\$names[2] = $names[2]\n";

$str = "hello" . "world";       # Concatenates strings.
$num = 5 + 10;                  # adds two numbers.
$mul = 4 * 5;                   # multiplies two numbers.
$mix = $str . $num;             # concatenates string and number.

print "str = $str\n";
print "num = $num\n";
print "mul = $mul\n";
print "mix = $mix\n";

$a = 10;
# check the boolean condition using if statement
if( $a < 20 ) {
   # if condition is true then print the following
   printf "a is less than 20\n";
}
print "value of a is : $a\n";

$a = 100;
# check the boolean condition using if statement
if( $a < 20 ) {
   # if condition is true then print the following
   printf "a is less than 20\n";
} else { 
   # if condition is false then print the following
   printf "a is greater than 20\n";
}
print "value of a is : $a\n";

$a = "";
# check the boolean condition using if statement
if( $a ) {
   # if condition is true then print the following
   printf "a has a true value\n";
} else {
   # if condition is false then print the following
   printf "a has a false value\n";
}
print "value of a is : $a\n";

$a = 100;
# check the boolean condition using if statement
if( $a  ==  20 ) {
   # if condition is true then print the following
   printf "a has a value which is 20\n";
} elsif( $a ==  30 ) {
   # if condition is true then print the following
   printf "a has a value which is 30\n";
} else {
   # if none of the above conditions is true
   printf "a has a value which is $a\n";
}

$a = 10;

# while loop execution
while( $a < 20 ) {
   printf "Value of a: $a\n";
   $a = $a + 1;
}

while( $a < 20 ) {
   if( $a == 15) {
      # skip the iteration. - continue
      $a = $a + 1;
      next;
   }
   print "value of a: $a\n";
   $a = $a + 1;
}

$a = 10;
while( $a < 20 ) {
   if( $a == 15) {
      # terminate the loop. - break
      $a = $a + 1;
      last;
   }
   print "value of a: $a\n";
   $a = $a + 1;
}
