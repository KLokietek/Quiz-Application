using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.IO;
using Newtonsoft.Json;

namespace Aplikacja_quizowa_zad2
{
    public class QuizManager
    {
        public void CreateQuiz()
        {
            using (var context = new QuizDbContext())
            {
                Console.WriteLine("Tworzenie nowego quizu:");

                Quiz newQuiz = new Quiz();
                Console.ForegroundColor = ConsoleColor.DarkMagenta;
                Console.Write("Podaj nazwę quizu: ");
                Console.ResetColor();
                newQuiz.Name = Console.ReadLine();

                bool addingQuestions = true;
                while (addingQuestions)
                {
                    Question newQuestion = new Question();

                    Console.ForegroundColor = ConsoleColor.Cyan;
                    Console.Write("Podaj treść pytania: ");
                    Console.ResetColor();
                    newQuestion.QuestionText = Console.ReadLine();

                    bool addingAnswers = true;
                    while (addingAnswers)
                    {
                        Answer newAnswer = new Answer();

                        Console.Write("Podaj treść odpowiedzi: ");
                        newAnswer.AnswerText = Console.ReadLine();

                        Console.ForegroundColor= ConsoleColor.Yellow;
                        Console.Write("Czy odpowiedź jest poprawna? (T/N): ");
                        Console.ResetColor();
                        string isCorrect = Console.ReadLine().ToUpper();

                        newAnswer.IsCorrect = (isCorrect == "T");

                        newQuestion.Answers.Add(newAnswer);

                        Console.ForegroundColor= ConsoleColor.Magenta;
                        Console.Write("Czy chcesz dodać kolejną odpowiedź? (T/N): ");
                        Console.ResetColor();
                        string addMoreAnswers = Console.ReadLine().ToUpper();

                        addingAnswers = (addMoreAnswers == "T");
                    }

                    newQuiz.Questions.Add(newQuestion);

                    Console.Write("Czy chcesz dodać kolejne pytanie? (T/N): ");
                    string addMoreQuestions = Console.ReadLine().ToUpper();

                    addingQuestions = (addMoreQuestions == "T");
                }

                context.Quizzes.Add(newQuiz);
                context.SaveChanges();
                Console.ForegroundColor= ConsoleColor.Green;
                Console.WriteLine("Quiz został utworzony i zapisany w bazie danych.");
                Console.ResetColor();
            }
        }

        public void RunQuiz()
        {
            using (var context = new QuizDbContext())
            {
                Console.ForegroundColor= ConsoleColor.DarkMagenta;
                Console.WriteLine("Uruchamianie quizu:");
                Console.ResetColor();

                var quizzes = context.Quizzes.Include(q => q.Questions).ThenInclude(q => q.Answers).ToList();

                if (quizzes.Count == 0)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("Brak quizów. Utwórz najpierw quiz lub wczytaj zapisane.");
                    Console.ResetColor();
                    return;
                }

                Console.ForegroundColor = ConsoleColor.Blue;
                Console.WriteLine("Wybierz quiz:");
                Console.ResetColor();
                for (int i = 0; i < quizzes.Count; i++)
                {
                    Console.WriteLine($"{i + 1}. {quizzes[i].Name}");
                }

                Console.ForegroundColor = ConsoleColor.Yellow;
                Console.Write("Podaj numer quizu: ");
                Console.ResetColor();
                int selectedQuizIndex;
                while (!int.TryParse(Console.ReadLine(), out selectedQuizIndex) || selectedQuizIndex < 1 || selectedQuizIndex > quizzes.Count)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.Write("Podaj poprawny numer quizu: ");
                    Console.ResetColor();
                }

                Quiz selectedQuiz = quizzes[selectedQuizIndex - 1];
                int score = 0;

                foreach (var question in selectedQuiz.Questions)
                {
                    Console.ForegroundColor= ConsoleColor.Yellow;
                    Console.WriteLine(question.QuestionText);
                    Console.ResetColor();

                    for (int i = 0; i < question.Answers.Count; i++)
                    {
                        Console.WriteLine($"{i + 1}. {question.Answers[i].AnswerText}");
                    }

                    Console.Write("Podaj numer odpowiedzi: ");
                    int userAnswer;
                    while (!int.TryParse(Console.ReadLine(), out userAnswer) || userAnswer < 1 || userAnswer > question.Answers.Count)
                    {
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.Write("Podaj poprawny numer odpowiedzi: ");
                        Console.ResetColor();
                    }

                    Answer selectedAnswer = question.Answers[userAnswer - 1];
                    if (selectedAnswer.IsCorrect)
                    {
                        score++;
                    }
                }
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine($"Twój wynik to: {score} / {selectedQuiz.Questions.Count}");
                Console.ResetColor();
            }
        }
        public void DisplayQuizzes()
        {
            using (var context = new QuizDbContext())
            {
                var quizNames = context.Quizzes.Select(q => q.Name).ToList();

                Console.ForegroundColor= ConsoleColor.Green;
                Console.WriteLine("Lista dostępnych quizów:");
                Console.ResetColor();

                if (quizNames.Count == 0)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("Brak dostępnych quizów.");
                    Console.ResetColor();
                    return;
                }

                for (int i = 0; i < quizNames.Count; i++)
                {
                    Console.WriteLine($"{i + 1}. {quizNames[i]}");
                }
            }
        }
       
    }
}
