using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
    public class CoursePlan
    {
        public int progressId { get; set; }
        public string Goal { get; set; }
        public string achieved { get; set; }
        public string year { get; set; }
    }
}
