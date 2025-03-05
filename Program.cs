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
