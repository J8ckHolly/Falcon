#unit1:adder
#port map(A=>E1,B=>M1,Cin=>'0',S(0)=>P(2),S(63 downto 1)=>M2(62 downto 0), Cout=>M2(63));
#unit2:adder
#port map(A=>E2,B=>M2,Cin=>'0',S(0)=>P(3),S(63 downto 1)=>M3(62 downto 0), Cout=>M3(63));

print("unit"+str(0)+":adder32")
print("port map(A=>E0,B(31)=>'0', B(30 downto 0)=>D, Cin=>'0',S(0)=>P(1),S(31 downto 1)=>M1(30 downto 0), Cout=>M1(31));")
for i in range(1,30):
    print("unit"+str(i)+":adder32")
    print("port map(A=>E"+str(i)+",B=>M"+str(i)+",Cin=>'0',S(0)=>P("+str(i+1)+"),S(31 downto 1)=>M"+str(i+1)+"(30 downto 0), Cout=>M"+str(i+1)+"(31));")

print("unit"+str(30)+":adder32")
print("port map(A=>E30,B=>M30,Cin=>'0',S(31 downto 0)=>P(62 downto 31),Cout=>P(63));")