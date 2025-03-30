#!/usr/bin/env bash
# Bash is not meant for this kind of thing.
# Use rust or python instead, for the normal
# crunching. But for some conceptual learnering 
# with smaller numbers, or if you don't have access to another method,
# you can do this in the shell. This is mostly
# for educational purposes, for real cryptography
# we use _bytes_ not _strings_. 

# See https://github.com/jpegleg/dwarven-toolbox/blob/main/src/hexor.rs for XOR of bytes instead of strings.

###################################################
#---->                                            #------->
#--------->        CRYPTO CORE [ Bitwise XOR ]    # --->
#----->                                           #----------->
###################################################
stripper () {
tr -d '\040\011\012\015'
}

# Both your msg and your key seed files must
# be binary strings of 0 an 1 characters
# and of the same length.
# Place them in the ~/seeds directory.
# Your seed files must be named a.xor and b.xor.

msg=$(cat ~/seeds/a.xor | stripper)
key=$(cat ~/seeds/b.xor | stripper)

msglgth () {
SETMSGLGTH=$(wc -c ~/seeds/a.xor)
}
msglgth

exor () {
for ((i=0; i < ${#a}; i++ )); do
   out=${out}$((${a:$i:1} ^ ${b:$i:1}))
done
}

a=$msg
b=$key

exor 2> /dev/null

echo $out
