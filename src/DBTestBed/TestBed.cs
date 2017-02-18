using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DBTestBed
{
    /*
     * Ensures that each database benchmark has to implement at least this one function.
     * */
    public interface TestBed
    {
        double[] runQueryTest(int n, string query);
    }
}
