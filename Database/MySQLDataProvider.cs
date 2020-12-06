using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Diagnostics;
using System.Linq;
using System.Xml.Linq;
using MySql.Data.MySqlClient;

namespace MySQLDatabaseProvider
{
    public class MySqlDataProvider 
    {
        string ConnectionString;
        public MySqlDataProvider(string connectionString)
        {
            ConnectionString = connectionString;
        }

        private MySqlConnection OpenDbConnection()
        {
            var dbConnection = new MySqlConnection(ConnectionString);

            try
            {
                dbConnection.Open();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }

            return dbConnection;
        }

        public List<string[]> ReadAllDataFromTable(string tableName)
        {
            List<string[]> result = new List<string[]>();
            using (var dbConnection = OpenDbConnection())
            {
                var mySqlCommand = new MySqlCommand { Connection = dbConnection };

                var mySqlCommandString = string.Format("select * from {0}", tableName);
                mySqlCommand.CommandText = mySqlCommandString;

                try
                {
                    using (var reader = mySqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            List<string> list = new List<string>();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                list.Add(reader.GetString(i));
                            }
                            result.Add(list.ToArray());
                        }
                    }
                }
                catch (Exception ex)
                {
                }
                finally
                {
                    mySqlCommand.Dispose();
                    dbConnection.Close();
                }
                return result;
            }
        }

        public List<string[]> ReadStationsForLine(string lineId)
        {
            List<string[]> result = new List<string[]>();
            using (var dbConnection = OpenDbConnection())
            {
                var mySqlCommand = new MySqlCommand { Connection = dbConnection };

                var mySqlCommandString = string.Format("select * from station where line={0}", lineId);
                mySqlCommand.CommandText = mySqlCommandString;

                try
                {
                    using (var reader = mySqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            List<string> list = new List<string>();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                list.Add(reader.GetString(i));
                            }
                            result.Add(list.ToArray());
                        }
                    }
                }
                catch (Exception ex)
                {
                }
                finally
                {
                    mySqlCommand.Dispose();
                    dbConnection.Close();
                }
                return result;
            }
        }

        public List<string[]> ReadArrivalTimeForStation(string stationId)
        {
            List<string[]> result = new List<string[]>();
            using (var dbConnection = OpenDbConnection())
            {
                var mySqlCommand = new MySqlCommand { Connection = dbConnection };

                var mySqlCommandString = string.Format("select * from station_time where station_id={0}", stationId);
                mySqlCommand.CommandText = mySqlCommandString;

                try
                {
                    using (var reader = mySqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            List<string> list = new List<string>();
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                list.Add(reader.GetString(i));
                            }
                            result.Add(list.ToArray());
                        }
                    }
                }
                catch (Exception ex)
                {
                }
                finally
                {
                    mySqlCommand.Dispose();
                    dbConnection.Close();
                }
                return result;
            }
        }

        public string FindNextArrival(string stationName, int direction, string time)
        {
            string result = string.Empty;
            using (var dbConnection = OpenDbConnection())
            {
                var mySqlCommand = new MySqlCommand { Connection = dbConnection };

                var mySqlCommandString = string.Format("select arrivaltime from station_time, station where station_time.station_id = station.station_id and station.name = '{0}' and station.direction = {1} and arrivaltime > '{2}'",
                    stationName, direction, time);
                mySqlCommand.CommandText = mySqlCommandString;

                try
                {
                    using (var reader = mySqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            result = reader.GetString(0);
                            break;
                        }
                    }
                }
                catch (Exception ex)
                {
                }
                finally
                {
                    mySqlCommand.Dispose();
                    dbConnection.Close();
                }
                return result;
            }
        }

    }
}
