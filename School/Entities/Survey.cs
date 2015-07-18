using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
   public class Survey
    {
       public string surveyName { get; set; }
       public string surveyDate { get; set; }
       public string surveyGeneratedBy { get; set; }
       public string surveyGeneratedFor { get; set; }
      public int type { get; set; }
      public bool? isActive { get; set; }

    }
}
