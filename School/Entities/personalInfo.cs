using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entities
{
    public class personalInfo
    {
        public string pKId { get; set; }
        public string firstName { get; set; }
        public string middleName { get; set; }
        public string lastName { get; set; }
        public string iAm { get; set; }
        public string phone { get; set; }
        public string emergencyContact { get; set; }
        public string cellNo { get; set; }
        public string eMail { get; set; }
        public string enrollmentDate { get; set; }
        public string dOB { get; set; }
        public int gender { get; set; }
        public string userType { get; set; }
        public bool? isActive { get; set; }
        public bool? isNew { get; set; }
        public string passCode { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string address3 { get; set; }
        public string fileName { get; set; }
        public Byte[] recordFile { get; set; }
       
    }
}
