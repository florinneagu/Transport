using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySQLDatabaseProvider;
using TransportModel;

namespace Transport
{
    class Program
    {
        static void Main(string[] args)
        {
            string connection = "server = localhost; uid = florin; pwd=!Password1; persistsecurityinfo = True; database = transport";
            MySqlDataProvider provider = new MySqlDataProvider(connection);

            Schedule schedule = new Schedule();
            schedule.Initialize(provider);
            schedule.Print();
            Console.ReadKey();
//            schedule.PrintNextArrivalTime("Yonge", Direction.North, DateTime.Now.ToString("HH:mm"));
            schedule.PrintNextArrivalTimeDirect("Yonge", Direction.North, "8:17");
            Console.ReadKey();
            schedule.PrintNextArrivalTime("Yonge", Direction.North, "8:17");
            Console.ReadKey();
            schedule.PrintArrivalTimesForStation("Yonge");
            Console.ReadKey();
        }
    }
}
