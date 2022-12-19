using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Excel = Microsoft.Office.Interop.Excel;
namespace Sandbox
{
    class user
    {
        public string UserID { get; set; }
        public string UserName { get; set; }
        public string Phone { get; set; }

    }
    public class Program
    {
        static Excel.Application xlApp = new Excel.Application();
        static string _pDebug = Path.GetDirectoryName(Assembly.GetEntryAssembly().Location); // lay dia chi file tool
        static List<user> _user = new List<user>();
        public void main(string[] args)
        {
            Console.OutputEncoding = Encoding.UTF8;
            read_Data(@"C:\Users\Con Cac\Desktop\data.xlsx");
            write_data(@"C:\Users\Con Cac\Desktop\_test");
        }
        public static void read_Data(string psourcefilname)
        {
            if (!File.Exists(psourcefilname))
            {
                Console.WriteLine("Khong ton tai file!!!");
                return;
            }
            Excel.Workbook xlWorkbook= xlApp.Workbooks.Open(psourcefilname);
            Excel.Worksheet xlWorksheet= xlWorkbook.ActiveSheet();
            var lastrow = xlWorksheet.Cells.Find("*", System.Reflection.Missing.Value,
                               System.Reflection.Missing.Value, System.Reflection.Missing.Value,
                               Excel.XlSearchOrder.xlByRows, Excel.XlSearchDirection.xlPrevious,
                               false, System.Reflection.Missing.Value, System.Reflection.Missing.Value).Row;
            /*var lastcolum = xlWorksheet.Cells.Find("*", System.Reflection.Missing.Value,
                               System.Reflection.Missing.Value, System.Reflection.Missing.Value,
                               Excel.XlSearchOrder.xlByColumns, Excel.XlSearchDirection.xlPrevious,
                               false, System.Reflection.Missing.Value, System.Reflection.Missing.Value).Column;*/
            // cau truc file doc va save file==> luu dien vao mot file khac
            var rowstart = 3;
            for (int i = rowstart; i < lastrow; i++)
            {
                var u = new user
                {
                    UserID = xlWorksheet.Cells[i,3].Value.ToString(),
                    UserName = xlWorksheet.Cells[i,5].Value.ToString(),
                    Phone= xlWorksheet.Cells[i,4].Value.ToString(),
                };
                _user.Add(u);
            }
            xlWorkbook.Close();
        }
        public static void write_data(string pdest)
        {
            //var sourceFileName = _pDebug + @"/filetemplate.xlsx";
            var destFileName = pdest + $"//bao_cao_hang_ngay_{DateTimeToString()}.xslx";// noi tao file bao cao
            // kiem tra du lieu
            if (_user==null||_user.Count==0)
            {
                Console.WriteLine("File khong co du lieu!!");
                return;
            }
            // tao thu muc            if (!Directory.Exists(destFileName))
            {
                Directory.CreateDirectory(destFileName);
            }
            // edit file
            Excel.Workbook wb = xlApp.Workbook.Open(destFileName);
            Excel.Worksheet ws= wb.ActiveSheet;
            int index = 1;
            int rowstart = 7;
            foreach (var user in _user)
            {
                ws.Cells[rowstart, 1] = index++;
                ws.Cells[rowstart, 2]=user.UserID;
                ws.Cells[rowstart, 3]=user.UserName;
                ws.Cells[rowstart, 4] = user.Phone;
                rowstart++;
            }
            wb.Save();
            wb.Close();
            Console.WriteLine("Thanh cong");

        }
        public static string DateTimeToString()
        {
            var now = DateTime.Now;
            return now.ToString("ddMMyyyy_hhmmss");
        }
    }
}