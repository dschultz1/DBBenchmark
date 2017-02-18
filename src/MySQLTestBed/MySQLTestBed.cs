using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

using DBTestBed;

namespace MySQLTestBed
{
    public class MySQLTestBed : TestBed
    {
        public MySqlConnection conn { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string statement { get; set; }
        public string host { get; set; }
        public int hostPort { get; set; }
        public string database { get; set; }

        public MySQLTestBed() { }

        protected MySQLTestBed(string username = "root", string password = "abc123#$", string host = "localhost", int hostPort = 3306)
        {
            this.username = username;
            this.password = password;
            this.host = host;
            this.hostPort = hostPort;
        }

        private void init()
        {
            this.conn = new MySqlConnection
            {
                ConnectionString = $"server={this.host};user id={this.username};password={this.password};persistsecurityinfo=True;port={this.hostPort};database={this.database}"
            };
            this.conn.Open();
        }

        private void close()
        {
            this.conn.Close();
        }

        private void setStatement(string statement)
        {
            this.statement = statement;
        }

        private void executeStatement()
        {
            if(this.conn != null && this.statement != null)
            {
                MySqlCommand cmd = new MySqlCommand(this.statement, this.conn);

                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                   
                }
            }
        }

        public static MySQLTestBed setupSQL(string username = "root", string password = "abc123#$", string host = "localhost", int hostPort = 3306)
        {
            MySQLTestBed sql = new MySQLTestBed(username, password, host, hostPort);
            sql.database = "employees";
            sql.init();
            return sql;
        }

        public double[] runQueryTest(int n, string query)
        {
            long seed = Environment.TickCount;
            int count = 100000000;
            long x = 0;


            double[] results = { 999999, 0, -999999, 0 };
            double[] tempResults = new double[n];
            Stopwatch watch = new Stopwatch();
            watch.Reset();
            watch.Start();
            while (watch.ElapsedMilliseconds < 1200)
            {
                x = TestFunction(seed, count);
            }
            watch.Stop();
            watch.Reset();
            MySQLTestBed sql = MySQLTestBed.setupSQL("root", "abc123#$", "localhost", 3306);
            sql.setStatement(query);
            for (int i = 0; i < n; i++)
            {
                watch.Start();
                
                sql.executeStatement();
                
                
                watch.Stop();
                double milli = watch.ElapsedTicks * (1.0 / Stopwatch.Frequency) * 1000;
                if (milli < results[0])
                    results[0] = milli;
                else if (milli > results[2])
                    results[2] = milli;
                tempResults[i] = milli;
                results[1] += milli;
                watch.Reset();

            }
            sql.close();
            results[1] = results[1] / n;
            for (int ix = 0; ix < n; ix++)
            {
                double diff = Math.Pow((tempResults[ix] - results[1]), 2.0);
                results[3] += diff;
            }
            results[3] = results[3] / n;
            results[3] = Math.Sqrt(results[3]);
            return results;
        }

        public static long TestFunction(long seed, int count)
        {
            long result = seed;
            for (int i = 0; i < count; ++i)
            {
                result ^= i ^ seed; // Some useless bit operations
            }
            return result;
        }
    }
}
