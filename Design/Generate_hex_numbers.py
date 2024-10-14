## File : Generate_hex_numbers
## Author : Ali Badry
## Date : 26/9/2024
## Version : 1
## Abstract : A script that generates random numbers in text file with
##            pre-specified width and depth to initialize the memmory with
import random
## ================================================== ##
##  Function to generate a random 8-bit hex number    ##
## ================================================== ##
def generate_hex_number(bits):
    max_value = (1 << bits) - 1  # 8 bits max value
    return hex(random.randint(0, max_value))[2:].zfill(bits // 4)

## ============================= ##
##  open the file for writing    ##
## ============================= ##
with open('MEM_content.txt', 'w') as file:
    for _ in range(16):
        hex_number = generate_hex_number(8)
        file.write(hex_number + '\n')

print("Done!")
