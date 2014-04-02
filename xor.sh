#!/usr/bin/bash
# Bash is not meant for this kind of thing.
# Use python instead, for the big number
# crunching. But for smaller numbers, or if
# if you don't have access to another method,
# you can do this in the shell. -Keegan 
###################################################
#---->                                            #------->
#--------->        CRYPTO CORE [ Bitwise XOR ]    # --->
#----->                                           #----------->
###################################################
strip () {
tr -d '\040\011\012\015'
}

# Both your msg and your key seed files must
# be binary and of the same length.
# Place them in the ~/seeds directory.
# Your seed files must be named a.xor and b.xor.

msg=$(cat ~/seeds/a.xor | strip)
key=$(cat ~/seeds/b.xor | strip)

msglgth () {
SETMSGLGTH=$(cat a.xor | wc -c)
}
msglgth

exor () {
for ((i=0; i < ${#a}; i++ )); do
   out=${out}$((${a:$i:1} ^ ${b:$i:1}))
done
}

a=$msg
b=$key

exor

echo $out
