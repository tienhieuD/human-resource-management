using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Console
{
    class Program
    {
        static void Main(string[] args)
        {
            double[] a_gtri = new double[] { 2, 3,4, 10, 11, 12, 60,20, 25, 30 ,80};
            double[] trongtam = new double[] { 12, 3, 90 };
            
            int[] a_nhom = KMean(a_gtri, trongtam);

            for (int i = 0; i < a_gtri.Length; i++)
            {
                System.Console.WriteLine(a_gtri[i] + " : " + a_nhom[i] +" "+ new Random(10).Next(0,10));
            }
        }

        #region
        public static int[] KMean(double[] a, double[] g)
        {
            int[] c = LayCum(a, g);
            double[] g2 = LayTrongTamMoi(a, c, g);

            if (BangNhau(g2,g))
                return c;
            else
                return KMean(a, g2);
        }

        private static bool BangNhau(double[] g2, double[] g)
        {
            for (int i = 0; i < g.Length; i++)
                if (g[i] != g2[i])
                    return false;
            return true;
        }

        public static double[] LayTrongTamMoi(double[] a, int[] c, double[] g)
        {
            double[] g2 = new double[g.Length];
            for (int i = 0; i < g2.Length; i++)
            {
                double tongGi = 0;
                int dem = 0;

                for (int k = 0; k < a.Length; k++)
                    if (c[k] == i) //nhóm của phần tử k mà = nhóm của trọng tâm g
                    {
                        tongGi += a[k];
                        dem += 1;
                    }
                g2[i] = tongGi / dem;
            }
            return g2;
        }

        public static int[] LayCum(double[] a, double[] g)
        {
            int[] c = new int[a.Length];

            for (int i = 0; i < a.Length; i++)
            {
                c[i] = LayNhomCua(a[i], g);
            }

            return c;
        }

        private static int LayNhomCua(double v, double[] g)
        {
            double KhoangCachNhoNhat = KhoangCach(v, g[0]);
            int nhom = 0;
            for (int k = 1; k < g.Length; k++)
            {
                if (KhoangCach(v, g[k]) <= KhoangCachNhoNhat)
                {
                    KhoangCachNhoNhat = KhoangCach(v, g[k]);
                    nhom = k;
                }
            }
            return nhom;
        }

        private static double KhoangCach(double v1, double v2)
        {
            if (v1 > v2) return v1 - v2;
            return v2 - v1;
        }
#endregion
    }
}
