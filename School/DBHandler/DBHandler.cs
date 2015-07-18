using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace DBHandler
{
    public class DBHandler
    {
     private string dbconstring = string.Empty;

        public DBHandler( string constring)
        {
            dbconstring = constring;
        }


        public void insertTest(Entities.personalInfo t1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[insertPersonalInfo]"))
         {
             s1.AddParameter("@pKId", System.Data.SqlDbType.NVarChar, t1.pKId);
             s1.AddParameter("@firstName", System.Data.SqlDbType.NVarChar, t1.firstName);
             s1.AddParameter("@middleName", System.Data.SqlDbType.NVarChar, t1.middleName);
             s1.AddParameter("@lastName", System.Data.SqlDbType.NVarChar, t1.lastName);
             s1.AddParameter("@iAm", System.Data.SqlDbType.NVarChar, t1.iAm);
             s1.AddParameter("@phone", System.Data.SqlDbType.NVarChar, t1.phone);
             s1.AddParameter("@emergencyContact", System.Data.SqlDbType.NVarChar, t1.emergencyContact);
             s1.AddParameter("@cellNo", System.Data.SqlDbType.NVarChar, t1.cellNo);
             s1.AddParameter("@email", System.Data.SqlDbType.NVarChar, t1.eMail);
             s1.AddParameter("@dOB", System.Data.SqlDbType.Date, t1.dOB);
             s1.AddParameter("@enrollmentdate", System.Data.SqlDbType.Date, t1.enrollmentDate);
             s1.AddParameter("@gender", System.Data.SqlDbType.Int, t1.gender);
             s1.AddParameter("@userType", System.Data.SqlDbType.NVarChar, t1.userType);
             s1.AddParameter("@isActive", System.Data.SqlDbType.Bit, t1.isActive);
             s1.AddParameter("@isNew", System.Data.SqlDbType.Bit, t1.isNew);
             s1.AddParameter("@passCode", System.Data.SqlDbType.NVarChar, t1.passCode);
             s1.AddParameter("@address1", System.Data.SqlDbType.NVarChar, t1.address1);
             s1.AddParameter("@address2", System.Data.SqlDbType.NVarChar, t1.address2);
             s1.AddParameter("@address3", System.Data.SqlDbType.NVarChar, t1.address3);
             s1.AddParameter("@fileName", System.Data.SqlDbType.NVarChar, t1.fileName);
             s1.AddParameter("@recordFile", System.Data.SqlDbType.VarBinary, t1.recordFile);

             s1.Execute();


            }
        } 
        public void InsertBranch(Entities.Campus c1,Entities.ZipCodes z1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertBranch]"))
            {
                
                s1.AddParameter("@campusName", System.Data.SqlDbType.NVarChar, c1.campusName);
                s1.AddParameter("@address", System.Data.SqlDbType.NVarChar, c1.address);
                s1.AddParameter("@zipCode", System.Data.SqlDbType.Int, c1.zipCode);
                s1.AddParameter("@phone1", System.Data.SqlDbType.NVarChar, c1.phone1);
                s1.AddParameter("@phone2", System.Data.SqlDbType.NVarChar, c1.phone2);
                s1.AddParameter("@phone3", System.Data.SqlDbType.NVarChar, c1.phone3);
                s1.AddParameter("@principal", System.Data.SqlDbType.NVarChar, c1.principal);
                s1.AddParameter("@cityName", System.Data.SqlDbType.NVarChar, z1.cityName);
                s1.AddParameter("@email", System.Data.SqlDbType.NVarChar, c1.email);
                s1.AddParameter("@isActive", System.Data.SqlDbType.Bit, c1.isActive);
                s1.Execute();


            }
        }
        public void InsertClass(Entities.Class c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertClass]"))
            {

                s1.AddParameter("@classId", System.Data.SqlDbType.NVarChar, c1.classId);
                s1.AddParameter("@className", System.Data.SqlDbType.NVarChar, c1.className);
                s1.Execute();


            }
        }

        public void InsertSection(Entities.Section c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertSectionName]"))
            {
                s1.AddParameter("@sectionName ", System.Data.SqlDbType.NVarChar, c1.sectionName);
                s1.Execute();

            }
        }

        public void InsertCampusClassSection(Entities.CampusClassSection c1,Entities.personalInfo p1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertSectionClass]"))
            {
                s1.AddParameter("@pkid", System.Data.SqlDbType.NVarChar, p1.pKId);
                s1.AddParameter("@className", System.Data.SqlDbType.NVarChar, c1.className);
                s1.AddParameter("@sectionName", System.Data.SqlDbType.NVarChar, c1.sectionName);
                s1.Execute();

            }
        }
        public void AddCourse(Entities.Subjects c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spAddSubject]"))
            {
                s1.AddParameter("@subjectId", System.Data.SqlDbType.NVarChar, c1.subjectId);
                s1.AddParameter("@subjectName", System.Data.SqlDbType.NVarChar, c1.subjectName);
                s1.Execute();
            }
        }

        public DataSet SelectClassSection(Entities.CampusClassSection c1, Entities.personalInfo p1)
        {
            DataSet ds;
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spSelectCampusDetails]"))
            {
                s1.AddParameter("@pKId", System.Data.SqlDbType.NVarChar, p1.pKId);
                s1.AddParameter("@campusId", System.Data.SqlDbType.Int, c1.campusId);
                s1.AddParameter("@sectionId", System.Data.SqlDbType.Int, c1.sectionName);
                s1.AddParameter("@classId", System.Data.SqlDbType.NVarChar, c1.className);
                ds = new DataSet();
                ds = s1.Execute();
            }
                return ds;
        }

        public void InsertTeacherAttendance(Entities.TAttendance c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertTeacherAttendance]"))
            {
                s1.AddParameter("@pKId", System.Data.SqlDbType.NVarChar, c1.pKId);
                s1.AddParameter("@date", System.Data.SqlDbType.Date, c1.date);
                s1.AddParameter("@attendance ", System.Data.SqlDbType.Bit, c1.attendance);
                s1.Execute();
            }
        }
       
        public void AssignCourses(Entities.Section s3, Entities.personalInfo p1,Entities.personalInfo p2, Entities.Class c1, Entities.Subjects s2)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spAssignTeacher]"))
            {
                s1.AddParameter("@subjectName", System.Data.SqlDbType.NVarChar, s2.subjectName);
                s1.AddParameter("@sectionName", System.Data.SqlDbType.NVarChar, s3.sectionName);
                s1.AddParameter("@className", System.Data.SqlDbType.NVarChar, c1.className);
                s1.AddParameter("@iAm ", System.Data.SqlDbType.NVarChar, p1.pKId);
                s1.AddParameter("@pKId", System.Data.SqlDbType.NVarChar, p2.pKId);
                s1.Execute();
            }
        }

        public void AddTicket(Entities.Tickets c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertNewIssue]"))
            {
                s1.AddParameter("@generatedBy", System.Data.SqlDbType.NVarChar, c1.generatedBy);
                s1.AddParameter("@generatedFor", System.Data.SqlDbType.NVarChar, c1.generatedFor);
                s1.AddParameter("@issue", System.Data.SqlDbType.NVarChar, c1.issue);
                s1.AddParameter("@linkedWith", System.Data.SqlDbType.Int, c1.linkedWith);
                s1.AddParameter("@issueDate", System.Data.SqlDbType.Date, c1.issueDate);
                s1.AddParameter("@isNew", System.Data.SqlDbType.Bit, c1.isNew);
                s1.Execute();
            }
        }


        public DataSet SelectTicket(Entities.Tickets c1)
        {
            DataSet ds;

            using (WSqlCommand dbCom = new WSqlCommand(dbconstring, "[dbo].[spSelectIssue]"))
            {
                dbCom.AddParameter("@issueId", SqlDbType.Int, c1.issueId);
                
                ds = new DataSet();
                ds = dbCom.Execute();
            }
            return ds;
        }

        public void AddNotes(Entities.Notes c1, Entities.Subjects s2, Entities.Section s3, Entities.Class c2)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spAddNotes]"))
            {
                s1.AddParameter("@subjectName", System.Data.SqlDbType.NVarChar, s2.subjectName);
                s1.AddParameter("@sectionName", System.Data.SqlDbType.NVarChar, s3.sectionName);
                s1.AddParameter("@className", System.Data.SqlDbType.NVarChar, c2.className);
                s1.AddParameter("@teacher", System.Data.SqlDbType.NVarChar, c1.teacher);
                s1.AddParameter("@noteType", System.Data.SqlDbType.NVarChar, c1.noteType);
                s1.AddParameter("@assignDate", System.Data.SqlDbType.Date, c1.date);
                s1.AddParameter("@fileName", System.Data.SqlDbType.NVarChar, c1.fileName);
                s1.AddParameter("@dataFile", System.Data.SqlDbType.VarBinary, c1.dataFile);
                s1.AddParameter("@description", System.Data.SqlDbType.NVarChar, c1.description);
                s1.Execute();
            }
        }

        public void CoursePlan(Entities.CoursePlan c1, Entities.Subjects s2, Entities.Section s3, Entities.Class c2, Entities.personalInfo p1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertCourseProgress]"))
            {
                s1.AddParameter("@subjectName", System.Data.SqlDbType.NVarChar, s2.subjectName);
                s1.AddParameter("@sectionName", System.Data.SqlDbType.NVarChar, s3.sectionName);
                s1.AddParameter("@className", System.Data.SqlDbType.NVarChar, c2.className);
                s1.AddParameter("@pKId", System.Data.SqlDbType.NVarChar, p1.pKId);
                s1.AddParameter("@progressId", System.Data.SqlDbType.Int, c1.progressId);
                s1.AddParameter("@year", System.Data.SqlDbType.NVarChar, c1.year);
                s1.AddParameter("@goal", System.Data.SqlDbType.NVarChar, c1.Goal);
                s1.Execute();
            }
        }

        public void AddExamypes(Entities.ExamType e1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertExamType]"))
            {
                s1.AddParameter("@examTypeId", System.Data.SqlDbType.NVarChar, e1.examTypeId);
                s1.AddParameter("@examType", System.Data.SqlDbType.NVarChar, e1.examType);
                s1.Execute();
            }
        }

        public void AddExamDate(Entities.ExamDate c1, Entities.Subjects s2, Entities.Section s3, Entities.Class c2, Entities.personalInfo p1,Entities.ExamType e1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertExamDate]"))
            {
                s1.AddParameter("@subjectName", System.Data.SqlDbType.NVarChar, s2.subjectName);
                s1.AddParameter("@sectionName", System.Data.SqlDbType.NVarChar, s3.sectionName);
                s1.AddParameter("@className", System.Data.SqlDbType.NVarChar, c2.className);
                s1.AddParameter("@examTypeId", System.Data.SqlDbType.NVarChar, e1.examTypeId);
                s1.AddParameter("@iAm", System.Data.SqlDbType.NVarChar, p1.pKId);
                s1.AddParameter("@examDate", System.Data.SqlDbType.Date, c1.examDate);
                s1.AddParameter("@totalMarks", System.Data.SqlDbType.Int, c1.totalMarks);
                s1.Execute();
            }
        }

        public void AddStudentExam(Entities.StudentExam c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spAddStudentMarks]"))
            {
                s1.AddParameter("@subjectName", System.Data.SqlDbType.NVarChar, c1.subjectName);
                s1.AddParameter("@examDate", System.Data.SqlDbType.Date, c1.examDate);
                s1.AddParameter("@obtainedMarks", System.Data.SqlDbType.Real, c1.obtainedMarks);
                s1.AddParameter("@ispresent", System.Data.SqlDbType.Bit, c1.isPresent);
                s1.AddParameter("@pkid", System.Data.SqlDbType.NVarChar, c1.pKId);
                s1.Execute();
            }
        }

        public void AssignStudentClass(Entities.personalInfo p1, Entities.StudentSubject p2, Entities.Class c1, Entities.Section ss1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spAssignClassSection]"))
            {
                s1.AddParameter("@iAm", System.Data.SqlDbType.NVarChar, p1.pKId);
                s1.AddParameter("@studentId", System.Data.SqlDbType.NVarChar, p2.pKId);
                s1.AddParameter("@className", System.Data.SqlDbType.NVarChar, c1.className);
                s1.AddParameter("@sectionName", System.Data.SqlDbType.NVarChar, ss1.sectionName);
                s1.AddParameter("@year", System.Data.SqlDbType.NVarChar, p2.year);
                s1.Execute();
            }
        }

        public DataSet ShowStudentClass(Entities.personalInfo p1)
        {
            DataSet ds;

            using (WSqlCommand dbCom = new WSqlCommand(dbconstring, "[dbo].[spSelectStudent]"))
            {
                dbCom.AddParameter("@iAm", System.Data.SqlDbType.NVarChar, p1.pKId);
                ds = new DataSet();
                ds = dbCom.Execute();

            }
            return ds;
        }
        public void AddEvaluation(Entities.Recommendations r1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertEvaluation]"))
            {
                s1.AddParameter("@studentId", System.Data.SqlDbType.NVarChar, r1.studentId);
                s1.AddParameter("@teacher", System.Data.SqlDbType.NVarChar, r1.teacher);
                s1.AddParameter("@Adate", System.Data.SqlDbType.Date, r1.Adate);
                s1.AddParameter("@appitude", System.Data.SqlDbType.NVarChar, r1.appitude);
                s1.AddParameter("@attitude", System.Data.SqlDbType.NVarChar, r1.attitude);
                s1.AddParameter("@recommendation", System.Data.SqlDbType.NVarChar, r1.recommendation);
                s1.Execute();
            }
        }
        public void InsertStudentAttendance(Entities.SAttendance a1, Entities.Subjects c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertStudentAttendance]"))
            {
                s1.AddParameter("@pkid", System.Data.SqlDbType.NVarChar, a1.pKId);
                s1.AddParameter("@subjectName", System.Data.SqlDbType.NVarChar, c1.subjectName);
                s1.AddParameter("@Sdate", System.Data.SqlDbType.Date, a1.Sdate);
                s1.AddParameter("@attendance", System.Data.SqlDbType.Bit, a1.attendance);
                s1.AddParameter("@smilies", System.Data.SqlDbType.Bit, a1.smilies);
                s1.Execute();
            }
        }


        public DataSet CheckUserType(Entities.tblSchoolId p1, Entities.Campus c1)
        {
            DataSet ds;

            using (WSqlCommand dbCom = new WSqlCommand(dbconstring, "[dbo].[spSelectUserType]"))
            {
                dbCom.AddParameter("@ID", System.Data.SqlDbType.NVarChar, p1.schoolId);
                dbCom.AddParameter("@campus", System.Data.SqlDbType.NVarChar, c1.campusName);
                ds = new DataSet();
                ds = dbCom.Execute();

            }
            return ds;
        }

        public DataSet Graph(Entities.StudentExam c1,Entities.Class c2,Entities.ExamType e1)
        {
            DataSet ds;

            using (WSqlCommand dbCom = new WSqlCommand(dbconstring, "[dbo].[spSelectStudentMarks]"))
            {
                dbCom.AddParameter("@studentId", SqlDbType.NVarChar, c1.pKId);
                dbCom.AddParameter("@className", SqlDbType.NVarChar, c2.className);
                dbCom.AddParameter("@examType", SqlDbType.NVarChar, e1.examType);

                ds = new DataSet();
                ds = dbCom.Execute();
            }
            return ds;
        }

        public int InsertSurvey(Entities.Survey c1)
        {
           int temp1;
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spAddSurvey]"))
            {

                SqlParameter temp = s1.AddOutputParameter("@surveyId", System.Data.SqlDbType.Int);
                s1.AddParameter("@surveyName", System.Data.SqlDbType.NVarChar, c1.surveyName);
                s1.AddParameter("@surveyDate", System.Data.SqlDbType.Date, c1.surveyDate);
                s1.AddParameter("@generatedBy", System.Data.SqlDbType.NVarChar, c1.surveyGeneratedBy);
                s1.AddParameter("@generatedFor", System.Data.SqlDbType.NVarChar, c1.surveyGeneratedFor);
                s1.AddParameter("@type", System.Data.SqlDbType.Int, c1.type);
                s1.AddParameter("@isActive", System.Data.SqlDbType.Bit, c1.isActive);
                s1.Execute();
                temp1=int.Parse(temp.Value.ToString());
            }

            return temp1;
        }

        public void GenerateSurvey(Entities.SurveyQuestion c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spAddSurveyQuestions]"))
            {

                s1.AddParameter("@surveyId", System.Data.SqlDbType.Int, c1.surveyId);
                s1.AddParameter("@questionId", System.Data.SqlDbType.Int, c1.questionId);
                s1.AddParameter("@question", System.Data.SqlDbType.NVarChar, c1.question);
                s1.Execute();
            }
        }

        public void SurveyReply(Entities.SurveyReply c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spSurveyReply]"))
            {

                s1.AddParameter("@survey", System.Data.SqlDbType.Int, c1.surveyId);
                s1.AddParameter("@questionId", System.Data.SqlDbType.Int, c1.questionId);
                s1.AddParameter("@answer", System.Data.SqlDbType.Int, c1.answer);
                s1.AddParameter("@repliedBy", System.Data.SqlDbType.NVarChar, c1.repliedBy);
                s1.Execute();
            }
        }

        public void InsertSurveyResponse(Entities.SurveyReply c1 ,Entities.Survey c2)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertSurveyResponse]"))
            {

                s1.AddParameter("@surveyId", System.Data.SqlDbType.Int, c1.surveyId);
                s1.AddParameter("@repliedBy", System.Data.SqlDbType.NVarChar, c1.repliedBy);
                s1.AddParameter("@replyDate", System.Data.SqlDbType.Date, c2.surveyDate);
                s1.Execute();
            }
        }

        public void InsertStudentGrade(Entities.StudentSubject c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertGrade]"))
            {

                s1.AddParameter("@subjectName", System.Data.SqlDbType.NVarChar, c1.subjectName);
                s1.AddParameter("@student", System.Data.SqlDbType.NVarChar, c1.pKId);
                s1.AddParameter("@grade", System.Data.SqlDbType.NVarChar, c1.grade);
                s1.Execute();
            }
        }

        public void InsertNote(Entities.Announcement c1)
        {
            using (WSqlCommand s1 = new WSqlCommand(dbconstring, "[dbo].[spInsertAnnouncement]"))
            {

                s1.AddParameter("@iam", System.Data.SqlDbType.NVarChar, c1.createdBy);
                s1.AddParameter("@note", System.Data.SqlDbType.NVarChar, c1.note);
                s1.Execute();
            }
        }

        public DataSet ShowSurvey(Entities.SurveyQuestion q1)
        {
            DataSet ds;

            using (WSqlCommand dbCom = new WSqlCommand(dbconstring, "[dbo].[spShowQuestions]"))
            {
                dbCom.AddParameter("@surveyId", System.Data.SqlDbType.Int, q1.surveyId);
                ds = new DataSet();
                ds = dbCom.Execute();

            }
            return ds;
        }

        public DataSet ShowSubNotes(Entities.Notes q1,Entities.personalInfo p1,Entities.Class c1)
        {
            DataSet ds;

            using (WSqlCommand dbCom = new WSqlCommand(dbconstring, "[dbo].[spShowSubNotes]"))
            {
                dbCom.AddParameter("@iam", System.Data.SqlDbType.NVarChar, p1.pKId);
                dbCom.AddParameter("@className", System.Data.SqlDbType.NVarChar, c1.className);
                dbCom.AddParameter("@noteType", System.Data.SqlDbType.NVarChar, q1.noteType);
                dbCom.AddParameter("@minDate", System.Data.SqlDbType.Date, q1.date);
                dbCom.AddParameter("@maxDate", System.Data.SqlDbType.Date, q1.date);
                ds = new DataSet();
                ds = dbCom.Execute();

            }
            return ds;
        }

        public DataSet ShowStudentAttendacne(Entities.personalInfo p1, Entities.SAttendance s1, Entities.Subjects s2)
        {
            DataSet ds;

            using (WSqlCommand dbCom = new WSqlCommand(dbconstring, "[dbo].[spShowAttandus]"))
            {
                dbCom.AddParameter("@iAm", System.Data.SqlDbType.NVarChar, p1.pKId);
                dbCom.AddParameter("@subjectName", System.Data.SqlDbType.NVarChar, s2.subjectName);
                dbCom.AddParameter("@month", System.Data.SqlDbType.NVarChar, s1.Sdate);
                dbCom.AddOutputParameter("@smilies", System.Data.SqlDbType.Int);
                dbCom.AddOutputParameter("@sad", System.Data.SqlDbType.Int);
                dbCom.AddOutputParameter("@presents", System.Data.SqlDbType.Int);
                dbCom.AddOutputParameter("@absents", System.Data.SqlDbType.Int);
                ds = new DataSet();
                ds = dbCom.Execute();

            }
            return ds;
        }

        public DataSet CountSmiles(Entities.personalInfo p1)
        {
            DataSet ds;

            using (WSqlCommand dbCom = new WSqlCommand(dbconstring, "[dbo].[spShowCMAttandus]"))
            {
                dbCom.AddParameter("@iAm", System.Data.SqlDbType.NVarChar, p1.pKId);
                ds = new DataSet();
                ds = dbCom.Execute();

            }
            return ds;
        }
        
   /*     public DataSet GetCampuses(Entities.Campus c1,Entities.ZipCodes z1)
        {
            ResponseBase response = new ResponseBase();
            DataSet ds;

            using (WSqlCommand dbCom = new WSqlCommand(dbconstring, "[dbo].[spSelectCampus]"))
                {
                    dbCom.AddParameter("@campusId", SqlDbType.Int, c1.campusId);
                    dbCom.AddParameter("@campusName", SqlDbType.NVarChar, c1.campusName);
                    dbCom.AddParameter("@address", SqlDbType.NVarChar, c1.address);
                    dbCom.AddParameter("@zipCode", SqlDbType.Int, c1.zipCode);
                    dbCom.AddParameter("@city", SqlDbType.NVarChar, z1.cityName);
                    dbCom.AddParameter("@email", SqlDbType.NVarChar, c1.email);
                    dbCom.AddParameter("@isActive", SqlDbType.Bit, c1.isActive);
                    ds = new DataSet();
                    ds = dbCom.Execute();

                }
                return ds;
            

           

        }
        public class ResponseBase
        {
            public Response ResponseCode { get; set; }
            public string ResponseMessage { get; set; }
        }
        public enum Response
        {
            None = 0,
            Success = 1,
            Failed = 2,
            Exception = 3
        }*/
    }
}
