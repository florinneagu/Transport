using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySQLDatabaseProvider;

namespace TransportModel
{
    public class Station
    {
        MySqlDataProvider _provider;
        public string Id { get; set; }
        public string Name { get; set; }
        public Line Line { get; set; }
        public Direction Direction { get; set; }
        public int Order { get; set; }
        public List<string> ArrivalTimes { get; set; }
        public Station(string id, string name, Line line, Direction direction, int order)
        {
            Id = Id;
            Name = name;
            Line = line;
            Direction = direction;
            Order = order;
        }
        public Station(Line line, string[] properties)
        {
            Id = properties[0];
            Name = properties[1];
            Line = line;
            Direction = (Direction)Convert.ToInt16(properties[3]);
            Order = Convert.ToInt16(properties[4]);
        }
        public void Initialize(MySqlDataProvider provider)
        {
            _provider = provider;

            ArrivalTimes = new List<string>();

            List<string[]> times = provider.ReadArrivalTimeForStation(Id);
            foreach (var item in times)
            {
                ArrivalTimes.Add(item[1]);
            }
        }
        public void Print()
        {
            Console.WriteLine("\tStation: {0}. Arrival times: ", Name);
            foreach (var arrivalTime in ArrivalTimes)
            {
                Console.Write("\t {0} ", arrivalTime);
            }
            Console.WriteLine();
            Console.WriteLine();
        }
    }
}
