using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
  public class SurveyQuestion
    {
      public int surveyId { get; set; }
      public int questionId { get; set; }
      public string question { get; set; }
    }
}
