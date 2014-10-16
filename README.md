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
statistical analysis of an intercepted one time pad. 

Here is one example:

You have a one time pad as follows:
11001101111111001001001001000001001

And you need to XOR it against your library of 35 bit strings.
Send your pad to a.xor:

echo -n 11001101111111001001001001000001001 > ~/seeds/a.xor

And place only your library of 35 bit strings in ~/seeds/

Then run an XOR batch against the one time pad, outputting the results to files:

nohup otpbatch

The stripper function is used to sanitize data, just a wrapper for the tr command.
Here we use stripper to validate your test file. These should both return 35.

cat ~/seeds/a.xor | wc -c

cat ~/seeds/a.xor | stripper | wc -c

Validate the test library. These should also return 35.

for data in $(ls seeds/*); do
     echo "$data"
     cat "$data" | wc -c
     echo "$data stripped"
     cat "$data" | stripper | wc -c
done
