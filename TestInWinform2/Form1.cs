
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TestInWinform2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
        public delegate int SomeExportedFunctionInTheDll(int a, int b);
        private unsafe void Form1_Load(object sender, EventArgs e)
        {
            
            DLLFromMemory dll = new DLLFromMemory(Properties.Resources.DllInC__);
       
            SomeExportedFunctionInTheDll addFunc = dll.GetDelegateFromFuncName<SomeExportedFunctionInTheDll>("AddInteger");
            MessageBox.Show( addFunc.DynamicInvoke(10, 10).ToString());
        }
    }
}
