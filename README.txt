CRYPTO CORE .bashrc < by Keegan Bowen 

  Setup the additions to your bashrc file     
  and place the xor.sh script in ~/Scripts/   

To install the changes and script use:
bash ./setup.sh

Important Note:
Both your msg and your key seed files must
contain binary strings and of the same length.
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

Here we use stripper to validate the test file. These should both return 35.

cat ~/seeds/a.xor | wc -c

cat ~/seeds/a.xor | stripper | wc -c

Validate the whole test library:

libvalidate

To just generate a dataset and get playing, you can try the following:
cd ~/seeds
rm *
libgen
cp 1000.xor a.xor
touch b.xor
reqbatch

A recursive XOR batch can be done multiple ways with these functions, one example is a 4 deep recusive batch
against 010010101010 with 4 inputs:

cd ~/seeds
rm -f *
echo -n "010010101010" > a.xor
echo -n "111010010010" > b.xor
echo -n "111011111000" > c.xor
echo -n "000011111010" > d.xor
echo -n "100110100111" > e.xor
  
for ((i=0; i < 4; i++)); do
    reqbatch
done

The reqbatch function carries out the same operations as the otp batch function but has verbose output and doesn't background the process so it can be used within other loops without making a mess with mutiple otpbatches running at the same time.
