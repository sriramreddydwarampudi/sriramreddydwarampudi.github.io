Let A1,A2......Ar be the subset of Universal set U. Then the number m of the element which do not appear in any subset A1,A2......Ar of U.

Pigeonhole Principle
Example: Let U be the set of positive integer not exceeding 1000. Then |U|= 1000 Find |S| where S is the set of such integer which is not divisible by 3, 5 or 7?

Solution: Let A be the subset of integer which is divisible by 3
                Let B be the subset of integer which is divisible by 5
                Let C be the subset of integer which is divisible by 7

Then S = Ac ∩ Bc∩ Cc since each element of S is not divisible by 3, 5, or 7.

By Integer division,

          |A|= 1000/3 = 333
          |B|= 1000/5 = 200
          |C| = 1000/7 = 142
          |A∩B|=1000/15=66
          |B∩C|=1000/21=47
          |C∩A|=1000/35=28
          |A∩B∩C|=1000/105=9

Thus by Inclusion-Exclusion Principle

          |S|=1000-(333+200+142)+(66+47+28)-9
          |S|=1000-675+141-9=457