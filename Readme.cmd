** Iterations **
- The for statement: executes its body while a specified Boolean expression (the 'condition') evaluates to true.
- The foreach statement: enumerates the elements of a collection and executes its body for each element of the collection.
- The do-while statement: conditionally executes its body one or more times.
- The while statement: conditionally executes its body zero or more times

// It's possible to use any of these iteration types for the conditions described, but a foreach is best suited for this scenario. The foreach is easy to implement when the number of array elements is unknown. The foreach is a good choice when the index number of the selected array element isn't important. The foreach might run faster when the selected item is used multiple times within the code block.

** do while statement **

Random random = new();
int current = random.Next(1, 11);

do
{
    current = random.Next(1, 11);

    if (current >= 8) continue;
    // the continue statement ensures that numbers greater than or equalt to eight is not logged or reognized during the iteration, it skips every other line of code and transfer execution to the while (bottom of the execution to evaluate the condition).

    Console.WriteLine(current);
} while (current != 7);

** example 2 **

int monsterHealth = 10;
int heroHealth = 10;
Random random = new(); 
int attackScore = random.Next(1, 11);

do {
    monsterHealth -= attackScore;
    Console.WriteLine($"Monster was damaged and lost {attackScore} health, and now has {monsterHealth} health");
    attackScore = random.Next(1, 11);

    if(monsterHealth <= 0) continue;

    heroHealth -= attackScore;
    Console.WriteLine($"Hero was damaged and lost {attackScore} health, and now has {heroHealth} health");
    attackScore = random.Next(1, 11);
} while (monsterHealth > 0 && heroHealth > 0);

Console.WriteLine(heroHealth > monsterHealth ? "Hero wins!" : "Monster wins!");

// as long as the boolean condition in a do while returns true, the execution flow stays within the do-while block and the loopc continues, any code below/after the do-while block only runs after the boolean condition returns false

** Code project 1 - write code that validates integer input **
string? readResult;
Console.WriteLine("Enter an integer between 5 and 10");
int numericValue = 0;
bool validNumber = false;


do {
    readResult = Console.ReadLine();
    validNumber = int.TryParse(readResult, out numericValue);
    if(readResult != null && validNumber) {
        if(!(numericValue >= 5 && numericValue <= 10)) {
            Console.WriteLine($"You entered {numericValue}. Please enter a number between 5 and 10");
            continue;
        } 
    } else {
        Console.WriteLine("Sorry, you entered an invalid number, please try again");
    }
} while (!(numericValue >= 5 && numericValue <= 10));

Console.WriteLine($"Your input value ({numericValue}) has been accepted");

** Code project 2 - write code that validates string input **

// string role = "Administrator | Manager | User";
string[] roles = ["Admininstrator", "Manager", "User"];
bool isMatch = false;
string? enteredRole;
Console.WriteLine("Enter your role name (Administrator, Manager, or User)");

do{
    enteredRole = Console.ReadLine();
    if(enteredRole != null){
        foreach (string role in roles){
            if(role.Equals(enteredRole.Trim(), StringComparison.CurrentCultureIgnoreCase))
            {
                isMatch = true;
            }
        }
        
        if(!isMatch){
            Console.WriteLine($"The role name that you entered, ({enteredRole}) is not valid. Enter your role name (Administrator, Manager, or User)");
        }
    }
} while (!isMatch);

Console.WriteLine($"Your input value ({enteredRole}) has been accepted.");
