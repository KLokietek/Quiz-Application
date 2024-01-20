using Aplikacja_quizowa_zad2;

QuizManager quizManager = new QuizManager();

bool exit = false;

while (!exit)
{
    Console.ResetColor();
    Console.ForegroundColor= ConsoleColor.Red;
    Console.BackgroundColor= ConsoleColor.Yellow;
    Console.Write("***QUIZ APP***");
    Console.ResetColor();
    Console.WriteLine("");
    Console.ForegroundColor = ConsoleColor.Blue;
    Console.WriteLine("     Menu");
    Console.WriteLine("");
    Console.ResetColor();

    Console.WriteLine("1. Dodaj quiz");
    Console.WriteLine("2. Uruchom quiz");
    Console.WriteLine("3. Wyświetl quizy");
    Console.WriteLine("4. Wyjdź");
    

    Console.Write("Wybierz opcję: ");
    string choice = Console.ReadLine();

    switch (choice)
    {
        case "1":
            quizManager.CreateQuiz();
            break;
        case "2":
            quizManager.RunQuiz();
            break;
        case "3":
            quizManager.DisplayQuizzes();
            break;
        case "4":
            exit = true;
            break;
        
        default:
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("Niepoprawny wybór.");
            Console.ResetColor();
            break;
    }
}