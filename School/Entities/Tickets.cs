using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
  public class Tickets
    {
      public int issueId { get; set; }
      public string generatedBy { get; set; }
      public string generatedFor { get; set; }
      public string issue { get; set; }
      public int linkedWith { get; set; }
      public string status { get; set; }
      public string issueDate { get; set; }
      public bool? isNew { get; set; }

    }   
}
