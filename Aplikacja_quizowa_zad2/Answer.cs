using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aplikacja_quizowa_zad2
{
    public class Answer
    {
        [Key]
        public int Id { get; set; }

        public string AnswerText { get; set; }
        public bool IsCorrect { get; set; }
    }
}