 func fac(_ n: Int) -> Int{
     if n == 1 {
         return 1
     }
     else {
         return n*fac(n-1)
     }
 }


 print(fac(3))