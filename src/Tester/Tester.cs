using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using DBTestBed;

namespace Tester
{
    public class Tester
    {
        public TestBed dbType { get; set; }
        public string[] queries { get; set; }
        public double[][] results { get; set; }

        public Tester(TestBed dbType, string[] queries)
        {
            this.dbType = dbType;
            this.queries = queries;
        }

        public void runTests(int n)
        {
            this.results = new double[this.queries.Length][];
            for(int i = 0; i < this.queries.Length; i++) {
               this.results[i] =  this.dbType.runQueryTest(n, this.queries[i]);
            }
        }

        public void print()
        {
            for(int i = 0; i < this.queries.Length; i++)
            {
                Console.WriteLine($"Query Executed: {this.queries[i]}");
                Console.WriteLine($"Min {this.results[i][0]} Mean {this.results[i][1]} Max {this.results[i][2]} Std Dev. {this.results[i][3]}");
            }
        }
    }
}
