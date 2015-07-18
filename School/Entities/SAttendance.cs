using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
  public  class SAttendance
    {
        public string pKId { get; set; }
        public string Sdate { get; set; }
        public bool? attendance { get; set; }
        public bool? smilies { get; set; }
    }
}
