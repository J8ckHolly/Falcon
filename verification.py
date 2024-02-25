a = [1239209379,419574236]
b = [130411988, 1626089620]
p = [1239647505,920966792]
p0i=[1135219257,1823569546]

z = []
z_cut = []
s = []
s_cut = []
w = []
#d = []

# Acts like (30 downto 0)
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
    z_cut.append(get_select_bits(z[i],30, 0))

    s.append(z_cut[i] * p0i[i])
    s_cut.append(get_select_bits(s[i],30, 0))

    w.append(s_cut[i] * p[i])


    


#print("Z=",z)
#print("Z_cut=",z_cut)
#print("S=",s)
    
def to_binary(n):
    """Converts integer to binary string of length 31"""
    return bin(n)[2:].zfill(31)

def main():
    for i in range(33):
        print(to_binary(i))
        print("hi")

