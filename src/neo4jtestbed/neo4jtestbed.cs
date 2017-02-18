using System;
using System.Collections.Generic;
using System.Linq;

using Neo4j.Driver.V1;
using System.Diagnostics;
using DBTestBed;

namespace neo4jtestbed
{

    public class neo4jclient:TestBed
    {
        public int hostPort { get; set; }
        public string hostURL { get; set; }
        public string username { get; set; }
        public string statement { get; set; }
        public string password { get; set; }
        private IDriver driver;
        private ISession session;
        private IStatementResult result;


        public neo4jclient() { }

        protected neo4jclient(string hostURL = "localhost", int hostPort = 7687, string username = "neo4j", string password = "neo4j")
        {
            this.hostPort = hostPort;
            this.hostURL = hostURL;
            this.username = username;
            this.password = password;
        }

        public static neo4jclient setupConnection(string hostURL = "localhost", int hostPort = 7687, string username = "neo4j", string password = "neo4j")
        {
            var conn = new neo4jclient(hostURL, hostPort, username, password);
            return conn;
        }

        public void init()
        {
            this.driver = GraphDatabase.Driver($"bolt://{hostURL}:{hostPort}", 
                AuthTokens.Basic(username, password));
            this.session = this.driver.Session();
        }

        public void setStatement(string statement)
        {
            this.statement = statement;
        }

        public void execStatement()
        {
            this.result = this.session.Run(this.statement);
        }

        /*
         * Runs the neo4j test query n times
         * and returns the min, mean, max, standard dev.
         * */
        public double[] runQueryTest(int n, string query)
        {
            long seed = Environment.TickCount;
            int count = 100000000;
            long x = 0;
            

            double[] results = { 999999, 0, -999999, 0};
            double[] tempResults = new double[n];
            Stopwatch watch = new Stopwatch();
            watch.Reset();
            watch.Start();
            while (watch.ElapsedMilliseconds < 1200)  // A Warmup of 1000-1500 mS 
                                                          // stabilizes the CPU cache and pipeline.
            {
                x = TestFunction(seed, count); // Warmup
            }
            watch.Stop();


            watch.Reset();

 //           watch.Start();
            neo4jclient connection = neo4jclient.setupConnection("localhost", 7687, "neo4j", "abc123#$");
            connection.setStatement(query);
            connection.init();


            for (int i = 0; i < n; i++)
            {
                watch.Start();
                connection.execStatement();
//                connection.session.Dispose();
//                connection.driver.Dispose();
          
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
            results[1] = results[1] / n;
            for(int ix = 0; ix < n; ix++)
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
