using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aplikacja_quizowa_zad2
{
    public class Quiz
    {
        [Key]
        public int Id { get; set; }

        public string Name { get; set; }
        public List<Question> Questions { get; set; } = new List<Question>();
    }
}
