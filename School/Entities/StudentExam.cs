using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
  public class StudentExam
    {
      public string examDate { get; set; }
      public decimal obtainedMarks { get; set; }
      public bool? isPresent { get; set; }
      public string pKId { get; set; }
      public string subjectName { get; set; }
    }
}
