S0 = (A0 XOR B0) XOR Cin                               '2dt (dt - delay time)

S1 = (A1 XOR B1)
     XOR ((A0 AND B0)
      OR ((A0 XOR B0) AND Cin))                                          '4dt  

S2 = (A2 XOR B2)
     XOR ((A1 AND B1)
      OR ((A1 XOR B1) AND (A0 AND B0))
      OR ((A1 XOR B1) AND (A0 XOR B0) AND Cin))                          '4dt

S3 = (A3 XOR B3)
     XOR ((A2 AND B2)
      OR ((A2 XOR B2) AND (A1 AND B1))
      OR ((A2 XOR B2) AND (A1 XOR B1) AND (A0 AND B0))
      OR ((A2 XOR B2) AND (A1 XOR B1) AND (A0 XOR B0) AND Cin))          '4dt

Cout = (A3 AND B3)
       OR ((A3 XOR B3) AND (A2 AND B2))
       OR ((A3 XOR B3) AND (A2 XOR B2) AND (A1 AND B1))
       OR ((A3 XOR B3) AND (A2 XOR B2) AND (A1 XOR B1) AND (A0 AND B0))
       OR ((A3 XOR B3) AND (A2 XOR B2) AND (A1 XOR B1) AND (A0 XOR B0) AND Cin)  '3dt
a b c d
A B C D
      d
      D
     xx  d & D 
c d
C D
