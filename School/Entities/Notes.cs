using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
   public class Notes
    {
       public int CCSec { get; set; }
       public string subjectId { get; set; }
       public string date { get; set; }
       public string noteType { get; set; }
       public string fileName { get; set; }
       public Byte[] dataFile { get; set; }
       public string teacher { get; set; }
       public string description { get; set; }
    }
}
