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
    return '"' + bin(n)[2:].zfill(31) + '"'

for i in range(64):
    #print("A <= ", to_binary(i), ";")
    #print("wait for 10ns;")
    pass

REV10 = [
	   0,  512,  256,  768,  128,  640,  384,  896,   64,  576,  320,  832,
	 192,  704,  448,  960,   32,  544,  288,  800,  160,  672,  416,  928,
	  96,  608,  352,  864,  224,  736,  480,  992,   16,  528,  272,  784,
	 144,  656,  400,  912,   80,  592,  336,  848,  208,  720,  464,  976,
	  48,  560,  304,  816,  176,  688,  432,  944,  112,  624,  368,  880,
	 240,  752,  496, 1008,    8,  520,  264,  776,  136,  648,  392,  904,
	  72,  584,  328,  840,  200,  712,  456,  968,   40,  552,  296,  808,
	 168,  680,  424,  936,  104,  616,  360,  872,  232,  744,  488, 1000,
	  24,  536,  280,  792,  152,  664,  408,  920,   88,  600,  344,  856,
	 216,  728,  472,  984,   56,  568,  312,  824,  184,  696,  440,  952,
	 120,  632,  376,  888,  248,  760,  504, 1016,    4,  516,  260,  772,
	 132,  644,  388,  900,   68,  580,  324,  836,  196,  708,  452,  964,
	  36,  548,  292,  804,  164,  676,  420,  932,  100,  612,  356,  868,
	 228,  740,  484,  996,   20,  532,  276,  788,  148,  660,  404,  916,
	  84,  596,  340,  852,  212,  724,  468,  980,   52,  564,  308,  820,
	 180,  692,  436,  948,  116,  628,  372,  884,  244,  756,  500, 1012,
	  12,  524,  268,  780,  140,  652,  396,  908,   76,  588,  332,  844,
	 204,  716,  460,  972,   44,  556,  300,  812,  172,  684,  428,  940,
	 108,  620,  364,  876,  236,  748,  492, 1004,   28,  540,  284,  796,
	 156,  668,  412,  924,   92,  604,  348,  860,  220,  732,  476,  988,
	  60,  572,  316,  828,  188,  700,  444,  956,  124,  636,  380,  892,
	 252,  764,  508, 1020,    2,  514,  258,  770,  130,  642,  386,  898,
	  66,  578,  322,  834,  194,  706,  450,  962,   34,  546,  290,  802,
	 162,  674,  418,  930,   98,  610,  354,  866,  226,  738,  482,  994,
	  18,  530,  274,  786,  146,  658,  402,  914,   82,  594,  338,  850,
	 210,  722,  466,  978,   50,  562,  306,  818,  178,  690,  434,  946,
	 114,  626,  370,  882,  242,  754,  498, 1010,   10,  522,  266,  778,
	 138,  650,  394,  906,   74,  586,  330,  842,  202,  714,  458,  970,
	  42,  554,  298,  810,  170,  682,  426,  938,  106,  618,  362,  874,
	 234,  746,  490, 1002,   26,  538,  282,  794,  154,  666,  410,  922,
	  90,  602,  346,  858,  218,  730,  474,  986,   58,  570,  314,  826,
	 186,  698,  442,  954,  122,  634,  378,  890,  250,  762,  506, 1018,
	   6,  518,  262,  774,  134,  646,  390,  902,   70,  582,  326,  838,
	 198,  710,  454,  966,   38,  550,  294,  806,  166,  678,  422,  934,
	 102,  614,  358,  870,  230,  742,  486,  998,   22,  534,  278,  790,
	 150,  662,  406,  918,   86,  598,  342,  854,  214,  726,  470,  982,
	  54,  566,  310,  822,  182,  694,  438,  950,  118,  630,  374,  886,
	 246,  758,  502, 1014,   14,  526,  270,  782,  142,  654,  398,  910,
	  78,  590,  334,  846,  206,  718,  462,  974,   46,  558,  302,  814,
	 174,  686,  430,  942,  110,  622,  366,  878,  238,  750,  494, 1006,
	  30,  542,  286,  798,  158,  670,  414,  926,   94,  606,  350,  862,
	 222,  734,  478,  990,   62,  574,  318,  830,  190,  702,  446,  958,
	 126,  638,  382,  894,  254,  766,  510, 1022,    1,  513,  257,  769,
	 129,  641,  385,  897,   65,  577,  321,  833,  193,  705,  449,  961,
	  33,  545,  289,  801,  161,  673,  417,  929,   97,  609,  353,  865,
	 225,  737,  481,  993,   17,  529,  273,  785,  145,  657,  401,  913,
	  81,  593,  337,  849,  209,  721,  465,  977,   49,  561,  305,  817,
	 177,  689,  433,  945,  113,  625,  369,  881,  241,  753,  497, 1009,
	   9,  521,  265,  777,  137,  649,  393,  905,   73,  585,  329,  841,
	 201,  713,  457,  969,   41,  553,  297,  809,  169,  681,  425,  937,
	 105,  617,  361,  873,  233,  745,  489, 1001,   25,  537,  281,  793,
	 153,  665,  409,  921,   89,  601,  345,  857,  217,  729,  473,  985,
	  57,  569,  313,  825,  185,  697,  441,  953,  121,  633,  377,  889,
	 249,  761,  505, 1017,    5,  517,  261,  773,  133,  645,  389,  901,
	  69,  581,  325,  837,  197,  709,  453,  965,   37,  549,  293,  805,
	 165,  677,  421,  933,  101,  613,  357,  869,  229,  741,  485,  997,
	  21,  533,  277,  789,  149,  661,  405,  917,   85,  597,  341,  853,
	 213,  725,  469,  981,   53,  565,  309,  821,  181,  693,  437,  949,
	 117,  629,  373,  885,  245,  757,  501, 1013,   13,  525,  269,  781,
	 141,  653,  397,  909,   77,  589,  333,  845,  205,  717,  461,  973,
	  45,  557,  301,  813,  173,  685,  429,  941,  109,  621,  365,  877,
	 237,  749,  493, 1005,   29,  541,  285,  797,  157,  669,  413,  925,
	  93,  605,  349,  861,  221,  733,  477,  989,   61,  573,  317,  829,
	 189,  701,  445,  957,  125,  637,  381,  893,  253,  765,  509, 1021,
	   3,  515,  259,  771,  131,  643,  387,  899,   67,  579,  323,  835,
	 195,  707,  451,  963,   35,  547,  291,  803,  163,  675,  419,  931,
	  99,  611,  355,  867,  227,  739,  483,  995,   19,  531,  275,  787,
	 147,  659,  403,  915,   83,  595,  339,  851,  211,  723,  467,  979,
	  51,  563,  307,  819,  179,  691,  435,  947,  115,  627,  371,  883,
	 243,  755,  499, 1011,   11,  523,  267,  779,  139,  651,  395,  907,
	  75,  587,  331,  843,  203,  715,  459,  971,   43,  555,  299,  811,
	 171,  683,  427,  939,  107,  619,  363,  875,  235,  747,  491, 1003,
	  27,  539,  283,  795,  155,  667,  411,  923,   91,  603,  347,  859,
	 219,  731,  475,  987,   59,  571,  315,  827,  187,  699,  443,  955,
	 123,  635,  379,  891,  251,  763,  507, 1019,    7,  519,  263,  775,
	 135,  647,  391,  903,   71,  583,  327,  839,  199,  711,  455,  967,
	  39,  551,  295,  807,  167,  679,  423,  935,  103,  615,  359,  871,
	 231,  743,  487,  999,   23,  535,  279,  791,  151,  663,  407,  919,
	  87,  599,  343,  855,  215,  727,  471,  983,   55,  567,  311,  823,
	 183,  695,  439,  951,  119,  631,  375,  887,  247,  759,  503, 1015,
	  15,  527,  271,  783,  143,  655,  399,  911,   79,  591,  335,  847,
	 207,  719,  463,  975,   47,  559,  303,  815,  175,  687,  431,  943,
	 111,  623,  367,  879,  239,  751,  495, 1007,   31,  543,  287,  799,
	 159,  671,  415,  927,   95,  607,  351,  863,  223,  735,  479,  991,
	  63,  575,  319,  831,  191,  703,  447,  959,  127,  639,  383,  895,
	 255,  767,  511, 1023]

def bit_reverse(i, n):
    return int(format(i, '0%db' % n)[::-1], 2)

#x = 63
#rev = (bit_reverse(63,10))
#print(bin(x))
#print(bin(rev))
norm10 = []

for element in REV10:
    norm10.append(bit_reverse(element, 10))

#print(len(REV10))
	#for (u = 0; u < n; u ++) {
	#	size_t v;
 
	#	v = REV10[u << k];
	#	gm[v] = x1;
	#	igm[v] = x2;
	#	x1 = modp_montymul(x1, g, p, p0i);
	#	x2 = modp_montymul(x2, ig, p, p0i);
	#}

u = 0
logn = 6

n = 1 << logn
k = 10 - logn
gm = [None] * 64
gmreal = []
uk = []
list10norm = []
ukrev = []
ulist = []
for u in range(0, n):
	ulist.append(u)
for u in range(0,n):
    #print(u<<k)
    gmreal.append(REV10[u<<k])
    v = norm10[u<<k]
    uk.append(u<<k)
    list10norm.append(v)
    ukrev.append(bit_reverse(u<<k,10))
    #gm[v] = "x1-" + str(u)
    #print(gm)
    #print(" ")
    pass
#ultimately there will be an equal number of twiddle factors as there are number of coefficients
#print("UnSorted")
#print(gm)
#print("Sorted")
#print(sorted(mylist))

for element in REV10:
    #print(bin(element))
    pass
print("u")
print(ulist)
print("u<<k")
print(uk)
print("REV10[u<<k]")
print(gmreal)
print("REV(u<<k)")
print(ukrev)

#print(norm10)



#function reverse_any_vector (a: in std_logic_vector)
#return std_logic_vector is
#  variable result: std_logic_vector(a'RANGE);
#  alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
#begin
#  for i in aa'RANGE loop
#    result(i) := aa(i);
#  end loop;
#  return result;
#end; -- function reverse_any_vector

def print_binary_10_bits(x):
    if x >= 0:
        binary = bin(x)[2:].zfill(10)  # Convert to binary and fill with leading zeros
    else:
        # For negative numbers, print two's complement
        binary = bin(2**10 + x)[2:]
    return (binary)

# Example usage:
#x = 7
#print_binary_10_bits(x)  # Output: 0000000111

for i in range(0,64):
	#print("u <= \"",print_binary_10_bits(i),"\";")
	#print("wait for 10 ns;")
	#print(len("0000000000"))
	pass
#x = 0b0000000000
#print(x)
