using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aplikacja_quizowa_zad2
{
    public class Question
    {
        [Key]
        public int Id { get; set; }

        public string QuestionText { get; set; }
        public List<Answer> Answers { get; set; } = new List<Answer>();
    }
}
