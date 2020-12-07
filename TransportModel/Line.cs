using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySQLDatabaseProvider;

namespace TransportModel
{
    public class Line
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public Direction Direction { get; set; }
        public Dictionary<int, Station> Stations { get; set; }
        public Line(string id, string name, Direction direction, Dictionary<int, Station> stations)
        {
            Id = id;
            Name = name;
            Direction = direction;
            Stations = stations;
        }
        public Line(string[] properties)
        {
            Id = properties[0];
            Direction = (Direction)Convert.ToInt16(properties[1]);
            Name = properties[2];
        }
        public void Initialize(MySqlDataProvider provider)
        {
            Stations = new Dictionary<int, Station>();

            List<string[]> stations = provider.ReadStationsForLine(this.Id);
            foreach (var item in stations)
            {
                Station station = new Station(this, item);
                station.Initialize(provider);
                Stations.Add(station.Order, station);
            }
        }

        public void Print()
        {
            Console.WriteLine("Line: {0} Direction: {1}", Name, Direction.ToString());
            foreach (var item in Stations)
            {
                item.Value.Print();
            }
        }
    }
}
