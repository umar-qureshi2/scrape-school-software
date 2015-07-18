using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
    public class Campus
    {
        
        public string campusName { get; set; }
        public string address { get; set; }
        public int zipCode { get; set; }
        public string phone1 { get; set; }
        public string phone2 { get; set; }
        public string phone3 { get; set; }
        public string principal { get; set; }
        public string email { get; set; }
        public bool? isActive { get; set; }

    }
}
