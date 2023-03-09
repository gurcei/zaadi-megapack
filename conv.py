#!/bin/python
import argparse

def read_file(fname):
    pixels = []
    infile = open(fname, 'rb')
    # ignore first two bytes (dummy address)
    b = infile.read(1)
    b = infile.read(1)

    pixels = []
    b = infile.read(1)
    while b != b'':
        pixels.append(b[0])
        # print(b)
        b = infile.read(1)

    infile.close()
    return pixels

IMG_WIDTH = 150
IMG_HEIGHT = 90

# read in arguments
parser = argparse.ArgumentParser(description='Convert Mr Zaadi\'s graphics into a bitplane-dma-copy-friendly format')
parser.add_argument('in_file', type=str, help='path to original graphic file (.prg)')
parser.add_argument('out_file', type=str, help='path to new graphic file to be created (.prg)')

args = parser.parse_args()

# main program
pixels = read_file(args.in_file)
outfile = open(args.out_file, 'wb')

offset = 0
bytelst = []

for bitplane in range(0,5):
    print('bitplane {}: ${:04X}'.format(bitplane, offset))
    for y in range(0,IMG_HEIGHT,8):
        print('row {}: ${:04X}'.format(y, offset))

        for x in range(0,IMG_WIDTH,8):

            for yi in range(0,8):
                bp_byteval = 0
                for xi in range(0,8):
                    absx = x + xi
                    absy = y + yi
                    pixval = 0
                    if (absx < IMG_WIDTH and absy < IMG_HEIGHT):
                        pixval = pixels[absy*IMG_WIDTH + absx]

                    bitplaneval = pixval & (2 ** bitplane)
                    if bitplaneval:
                        bp_byteval += 2**(7-xi)

                bytelst.append(bp_byteval)
                offset += 1

outfile.write(b'\x01\xc0')
outfile.write(bytes(bytelst))
outfile.close()
