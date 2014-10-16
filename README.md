CRYPTO CORE .bashrc < by Keegan Bowen 

  Setup the additions to your bashrc file     
  and place the xor.sh script in ~/Scripts/   

To install the changes and script use:
bash ./setup.sh

Important Note:
Both your msg and your key seed files must
be binary and of the same length.
Place them in the ~/seeds directory.

The files need to be named a.xor and b.xor.

This bashrc addition is for bash/shell hackers 
who study or work in cryptography and or discrete probability.

Usage example: Ad-hoc XOR Batches

These functions were created for academic usage and prototyping. But there is
some practical usage here too. In this example, you are doing a forensic
statistical analysis of an intercepted one time pad. As part of your
investigation, you need to XOR one 1090 character binary string 
against 800 data set strings in your library directory.


Validate your test file. These should both return 1090.

cat ~/seeds/a.xor | wc -c
cat ~/seeds/a.xor | stripper | wc -c

Validate the test library. These should also return 1090.

for data in $(ls library/*); do
     echo "$data"
     cat "$data" | wc -c
     echo "$data stripped"
     cat "$data" | stripper | wc -c
done


Then run your XOR against each data input and store the results.

or data in $(ls library/); 
    do cat library/"$data" | stripper > ~/seeds/b.xor 
    exor > ~/seeds/result"$data".out
done
