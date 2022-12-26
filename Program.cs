using System;
namespace sandbox
{
    public class employee
    {
        public enum job
        {
            fulltime = 1,
            parttime = 2,
            casual = 3,
        };
        public job type;
        public int IDs { get; set; }
        public string Name { get; set; }
        public string gender { get; set; }
        public double std_hour { get; set; }
        public double OT_hour { get; set; }
        public double rate { get; set; }
        void setjob(job j)
        { 
            this.type = j;
        }
        public double calculator()
        {
            return std_hour * type;
        }
        employee() {
            Console.WriteLine("Hello");
        }
        public void Main()
        {
            
        }
    }
}