%MASTERCLOCKMULT = 1;
%SMALLESTUNIT    = 12;
%AUTOASSIGN      = 1;
%DECIMALS        = 0;
%ENDTIME         = 100000;
ce { A In Default None 0 1 50 } = 1 20000 0 131400;
clk { A In Default None 0 1 50 } = (1 6000 0 6000 1 6000 0 6000
  )#15 ;
serial_in { A In Default None 0 1 50 } = 1 12000(0 24000 1 24000
   0 24000 1 24000 0 24000 1 24000)#5 ;
bits_out[5] { A Out Default None 0 1 50 } = ;
bits_out[4] { A Out Default None 0 1 50 } = ;
bits_out[3] { A Out Default None 0 1 50 } = ;
bits_out[2] { A Out Default None 0 1 50 } = ;
bits_out[1] { A Out Default None 0 1 50 } = ;
bits_out[0] { A Out Default None 0 1 50 } = ;
