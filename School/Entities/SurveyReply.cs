using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
   public class SurveyReply
    {
       public int surveyId { get; set; }
       public int questionId { get; set; }
       public int answer { get; set; }
       public string repliedBy { get; set; }
    }
}
