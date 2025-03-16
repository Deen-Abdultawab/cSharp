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