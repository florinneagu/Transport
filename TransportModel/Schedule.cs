using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySQLDatabaseProvider;

namespace TransportModel
{
    public class Schedule
    {
        List<Line> Lines { get; set; }
        MySqlDataProvider _provider;
        public void Initialize(MySqlDataProvider provider)
        {
            _provider = provider;
            Lines = new List<Line>();

            List<string[]> lines = provider.ReadAllDataFromTable("Line");
            foreach (var item in lines)
            {
                Line line = new Line(item);
                line.Initialize(provider);
                Lines.Add(line);
            }
        }

        public void Print()
        {
            foreach (var line in Lines)
            {
                line.Print();
            }
        }

        public void PrintNextArrivalTimeDirect(string stationName, Direction direction, string time)
        {
            string arrivalTime = _provider.FindNextArrival(stationName, (int)direction, time);
            Console.WriteLine("Station: {0} Direction: {1} Next Train at {2}", stationName, direction.ToString(), arrivalTime);
        }

        public void PrintNextArrivalTime(string stationName, Direction direction, string time)
        {
            List<string> arrivalTimes = new List<string>();
            foreach (var line in Lines)
            {
                if (line.Direction == direction)
                {
                    foreach (var station in line.Stations)
                    {
                        if (station.Value.Name == stationName)
                        {
                            foreach (var arrivalTime in station.Value.ArrivalTimes)
                            {
                                TimeSpan arrivalTimeSpan = TimeSpan.Parse(arrivalTime);
                                TimeSpan timeSpan = TimeSpan.Parse(time);

                                if (arrivalTimeSpan > timeSpan)
                                {
                                    Console.WriteLine("Station: {0} Direction: {1} Next Train at {2}", stationName, direction.ToString(), arrivalTime);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }


        public void PrintArrivalTimesForStation(string stationName)
        {
            List<string> arrivalTimes = new List<string>();
            foreach (var line in Lines)
            {
                foreach(var station in line.Stations)
                {
                    if (station.Value.Name == stationName)
                    {
                        Console.WriteLine("Arrival times for {0} and direction {1}", stationName, station.Value.Direction.ToString());
                        foreach (var time in station.Value.ArrivalTimes)
                        {
                            Console.WriteLine(time);
                        }
                    }
                }
            }
        }
    }
}
