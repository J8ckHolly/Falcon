a = [1239209379,419574236]
b = [130411988, 1626089620]
p = [1239647505,920966792]
p0i=[1135219257,1823569546]

z = []
z_cut = []
s = []


def get_select_bits(number, start, end):
    bit_number = bin(number)
    bit_number = str(bit_number)
    bit_number = bit_number[-start-1:len(bit_number)-end]
    #bit_number = bit_number[-start-1:]
    bit_number = int(bit_number,2)
    
    return bit_number
    #return (bit_number)

for i in range(2):
    z.append(a[i]*b[i])
    #print(bin(z[0]))
    #z_cut.append(get_select_bits(z[i],30, 0))
    #s.append(z_cut[i] * p0i[i])

for i in range(2):
    z_cut.append(get_select_bits(z[0], 30, 0))
    print(bin(z_cut[i]))

#print(get_select_bits(z[0], 30, 0))
print("Z=",z)
print("Z_cut=",z)
#print("S=",s)