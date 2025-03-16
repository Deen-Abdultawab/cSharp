# Iterations

- **The `for` statement**: Executes its body while a specified Boolean expression (the 'condition') evaluates to `true`.
- **The `foreach` statement**: Enumerates the elements of a collection and executes its body for each element of the collection.
- **The `do-while` statement**: Conditionally executes its body one or more times.
- **The `while` statement**: Conditionally executes its body zero or more times.

> It's possible to use any of these iteration types for the conditions described, but a `foreach` is best suited for this scenario. The `foreach` is easy to implement when the number of array elements is unknown. The `foreach` is a good choice when the index number of the selected array element isn't important. The `foreach` might run faster when the selected item is used multiple times within the code block.

---

## `do-while` Statement Example 1

```csharp
Random random = new();
int current = random.Next(1, 11);

do
{
    current = random.Next(1, 11);

    if (current >= 8) continue;
    // The continue statement ensures that numbers greater than or equal to eight
    // are not logged or recognized during the iteration. It skips every other line
    // of code and transfers execution to the while (bottom of the execution)
    // to evaluate the condition.

    Console.WriteLine(current);
} while (current != 7);
```

---

## `do-while` Statement Example 2

```csharp
int monsterHealth = 10;
int heroHealth = 10;
Random random = new();
int attackScore = random.Next(1, 11);

do {
    monsterHealth -= attackScore;
    Console.WriteLine($"Monster was damaged and lost {attackScore} health, and now has {monsterHealth} health");
    attackScore = random.Next(1, 11);

    if (monsterHealth <= 0) continue;

    heroHealth -= attackScore;
    Console.WriteLine($"Hero was damaged and lost {attackScore} health, and now has {heroHealth} health");
    attackScore = random.Next(1, 11);
} while (monsterHealth > 0 && heroHealth > 0);

Console.WriteLine(heroHealth > monsterHealth ? "Hero wins!" : "Monster wins!");
```

> As long as the Boolean condition in a `do-while` loop returns `true`, the execution flow stays within the `do-while` block, and the loop continues. Any code below/after the `do-while` block only runs after the Boolean condition returns `false`.

---

# Code Projects

## **Code Project 1 - Integer Input Validation**

```csharp
string? readResult;
Console.WriteLine("Enter an integer between 5 and 10");
int numericValue = 0;
bool validNumber = false;

do {
    readResult = Console.ReadLine();
    validNumber = int.TryParse(readResult, out numericValue);
    
    if (readResult != null && validNumber) {
        if (!(numericValue >= 5 && numericValue <= 10)) {
            Console.WriteLine($"You entered {numericValue}. Please enter a number between 5 and 10");
            continue;
        }
    } else {
        Console.WriteLine("Sorry, you entered an invalid number, please try again");
    }
} while (!(numericValue >= 5 && numericValue <= 10));

Console.WriteLine($"Your input value ({numericValue}) has been accepted.");
```

---

## **Code Project 2 - String Input Validation**

```csharp
// string role = "Administrator | Manager | User";
string[] roles = ["Administrator", "Manager", "User"];
bool isMatch = false;
string? enteredRole;
Console.WriteLine("Enter your role name (Administrator, Manager, or User)");

do {
    enteredRole = Console.ReadLine();
    if (enteredRole != null) {
        foreach (string role in roles) {
            if (role.Equals(enteredRole.Trim(), StringComparison.CurrentCultureIgnoreCase)) {
                isMatch = true;
            }
        }

        if (!isMatch) {
            Console.WriteLine($"The role name that you entered, ({enteredRole}) is not valid. Enter your role name (Administrator, Manager, or User)");
        }
    }
} while (!isMatch);

Console.WriteLine($"Your input value ({enteredRole}) has been accepted.");
```

# Data Types

A data type is a way a programming language defines how much memory to save for a value.

- reference types and value types

Variables of reference types store references to their data (objects), that is they point to data values stored somewhere else. In comparison, variables of value types directly contain their data.

@REM * int - System.Int32

## Integral Data Type

** An integral type is a simple value type that represents whole numbers with no fraction (such as -1, 0, 1, 2, 3). The most popular in this category is the int data type

Signed integral types: Uses it's byte to represent an equal number of positive and negative numbers
sbyte  : -128 to 127
short  : -32768 to 32767
int    : -2147483648 to 2147483647
long   : -9223372036854775808 to 9223372036854775807

Unsigned integral types: Uses it's byte to represent only positive numbers
byte   : 0 to 255
ushort : 0 to 65535
uint   : 0 to 4294967295
ulong  : 0 to 18446744073709551615

## Floating point Data Type
```
A floating point is a simple value type that represents numbers to the right of the decimal place.

Floating point types:
float  : -3.402823E+38 to 3.402823E+38 (with ~6-9 digits of precision)
double : -1.79769313486232E+308 to 1.79769313486232E+308 (with ~15-17 digits of precision)
decimal: -79228162514264337593543950335 to 79228162514264337593543950335 (with 28-29 digits of precision)

float and double values are stored internally in a binary (base 2) format, while decimal is stored in a decimal (base 10) format, hence float and double are used when estimates and speed are desired and decimal is used when strict accuracy is desired.

A value type variable stores its values directly in an area of storage called the stack. The stack is memory allocated to the code that is currently running on the CPU (also known as the stack frame, or activation frame). When the stack frame has finished executing, the values in the stack are removed.


** combining string array values as strings and as integers challenge

string[] values = { "12.3", "45", "ABC", "11", "DEF" };
decimal result;
decimal total = 0m;
string word = "";

for (int i = 0; i < values.Length; i++){
    if(decimal.TryParse(values[i], out result)){
        total = total + result;
    } else {
        word = word + values[i];
    }
}

Console.WriteLine($"Message: {word}");
Console.WriteLine($"Total: {total}");

**** reverse words in a sentence challenge
string pangram = "The quick brown fox jumps over the lazy dog";

string[] words = pangram.Split(' ');
string[] reversedMessage = new string[words.Length];

for(int i = 0; i < words.Length; i++){
    char[] letters = words[i].ToCharArray();
    Array.Reverse(letters);
    reversedMessage[i] = new string(letters);
}

string result = string.Join(" ", reversedMessage);
Console.WriteLine(result);

** Complete a challenge to parse a string of orders, sort the orders and tag possible errors

string orderStream = "B123,C234,A345,C15,B177,G3003,C235,B179";

string[] streamArray = orderStream.Split(',');
Array.Sort(streamArray);
for(int i = 0; i < streamArray.Length; i++){
    // Console.WriteLine(streamArray[i]);
    if(streamArray[i].Length < 5){
        Console.WriteLine(streamArray[i]);
    } else {
        Console.WriteLine($"{streamArray[i]}    - Error");
    }
}